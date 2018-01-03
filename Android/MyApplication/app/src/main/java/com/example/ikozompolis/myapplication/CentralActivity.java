package com.example.ikozompolis.myapplication;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.location.Address;
import android.location.Geocoder;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.example.ikozompolis.myapplication.FacebookPackage.facebookFunctions;
import com.example.ikozompolis.myapplication.Receiver.AlarmBroadcastReceiver;
import com.example.ikozompolis.myapplication.services.GPSService;
import com.facebook.AccessToken;
import com.facebook.Profile;
import com.facebook.login.LoginManager;

import org.json.JSONException;
import org.json.JSONObject;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import static com.example.ikozompolis.myapplication.MainActivity.alarmBroadcastReceiver;
import static com.example.ikozompolis.myapplication.Usefullmethods.configuration.URL_USERNAME;

public class CentralActivity extends AppCompatActivity {

    public static TextView name,surname,email,mobile,location;
    private Button getLocation,startService,stopService,logout;
    SharedPreferences sharedPreferences,sharedPreferences2;
    facebookFunctions fbFunctions;
    AccessToken accessToken;
    Profile profile;
    Double lat, lon;
    String TAG = "Giannis Logs",CountyCode,CountryName,FeatureName,PostalCode,SubAdminArea,AdminArea,FullAddress,errorMessage;
    public static String username;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_central);
        sharedPreferences = getSharedPreferences(MainActivity.MyPREFERENCES, Context.MODE_PRIVATE);
        sharedPreferences2 = getSharedPreferences(GPSService.GpsPREFERENCES, Context.MODE_PRIVATE);
        fbFunctions = new facebookFunctions();
        username =sharedPreferences.getString("username",null);
        String loginWay = sharedPreferences.getString("loginWay", null);

        name = (TextView) findViewById(R.id.name);
        surname = (TextView) findViewById(R.id.surname);
        email = (TextView) findViewById(R.id.email);
        mobile = (TextView) findViewById(R.id.mobile);
        location = (TextView) findViewById(R.id.location);
        startService = (Button) findViewById(R.id.startService);
        stopService = (Button) findViewById(R.id.stopService);
        logout = (Button) findViewById(R.id.logout);
        getLocation = (Button) findViewById(R.id.edit);
        location.setText(loginWay);
        if(sharedPreferences.getString("loginWay",null)=="FB"){
            accessToken = AccessToken.getCurrentAccessToken();
            fbFunctions.saveUserWorkInfo(accessToken,getApplicationContext());
            fbFunctions.saveUserEducationInfo(accessToken,getApplicationContext());
            fbFunctions.saveFbMusicInfo(accessToken,getApplicationContext());
            fbFunctions.saveFbFavoriteTeams(accessToken, getApplicationContext());
            fbFunctions.saveFbBooksInfo(accessToken,getApplicationContext());
            fbFunctions.saveFbLastPageLikes(accessToken,getApplicationContext());
            fbFunctions.saveFbEvents(accessToken,getApplicationContext());
        }

        /*
        * Define the request that will return the data of the user e.g. name, surname, email, mobile...
        * */
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.GET, URL_USERNAME + username, null, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                try {
                    JSONObject jsonObject = response.getJSONObject("object");
                    name.setText(jsonObject.getString("i_first_name").toString());
                    surname.setText(jsonObject.getString("i_last_name").toString());
                    email.setText(jsonObject.getString("i_email_address").toString());
                    mobile.setText(jsonObject.getString("i_mobile_number").toString());
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getApplicationContext(),"Something went wrong",Toast.LENGTH_LONG).show();
            }
        });

        /*
        * Call the above API request in order to retrieve and present user data
        * */
        Mysingleton.getInstance(CentralActivity.this).addToRequestque(jsonObjectRequest);



        /*
        * Define the functionality of the GET THE LAST LOCATION button
        * */
        getLocation.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View view) {

                if ((sharedPreferences2.getString("latitude",null)!=null)&&(sharedPreferences2.getString("latitude",null)!=Double.toString(0.0))){

                    Geocoder geocoder = new Geocoder(getApplicationContext(), Locale.getDefault());
                    lat = Double.valueOf(sharedPreferences2.getString("latitude",null));
                    lon =  Double.valueOf(sharedPreferences2.getString("longitude",null));


                    List<Address> addresses = null;

                    try {
                        addresses = geocoder.getFromLocation(lat, lon, 10);
                    } catch (IOException ioException) {
                        // Catch network or other I/O problems.
                        errorMessage = "The service is not available. Check the network activity.";
                        Log.e(TAG, errorMessage, ioException);
                    } catch (IllegalArgumentException illegalArgumentException) {
                        // Catch invalid latitude or longitude values.
                        errorMessage = "Invalid latitude or longitude used...";
                        Log.e(TAG, errorMessage, illegalArgumentException);
                    }

                    // Handle case where no address was found.
                    if (addresses == null || addresses.size()  == 0) {
                            errorMessage = "The address is not found...";
                        Toast.makeText(CentralActivity.this, errorMessage, Toast.LENGTH_SHORT).show();
                            Log.e(TAG, errorMessage);

                    } else {
                        Address address = addresses.get(4);
                        Address address1 = addresses.get(0);
                        Address address2 = addresses.get(0);

                        CountyCode = address.getCountryCode();
                        CountryName = address.getCountryName();
                        FeatureName = address.getFeatureName();
                        PostalCode = address1.getPostalCode();
                        SubAdminArea = address.getSubAdminArea();
                        AdminArea = address.getAdminArea();

                        ArrayList<String> addressFragments = new ArrayList<String>();
                        // Fetch the address lines using getAddressLine,
                        // join them, and send them to the thread.
                        for(int i = 0; i <= address2.getMaxAddressLineIndex(); i++) {
                            addressFragments.add(address2.getAddressLine(i));
                        }
                        Log.i(TAG, "The address has been found...");
                        location.setText(CountyCode + ", " + CountryName + ", " + FeatureName + ", " + PostalCode + ", " + SubAdminArea + ", " + AdminArea + "......Address......" + addressFragments.get(0));
                        FullAddress = null;
                    }
                }else{
                    Toast.makeText(CentralActivity.this, "No location found...", Toast.LENGTH_SHORT).show();
                }
            }
        });



        /*
        * Define the START SERVICE button functionality
        * */
        startService.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startService();
            }
        });

        /*
        * Define the STOP SERVICE button functionality
        * */
        stopService.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                stopService();
            }
        });


        /*
        * Define the LOGOUT button functionality
        * */
        logout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                alarmBroadcastReceiver.stopAlert(getApplicationContext());
                SharedPreferences sharedpreferences = getSharedPreferences(MainActivity.MyPREFERENCES, Context.MODE_PRIVATE);
                SharedPreferences.Editor editor = sharedpreferences.edit();
                LoginManager.getInstance().logOut();
                editor.clear();
                editor.commit();
                startActivity(new Intent(getApplicationContext(),MainActivity.class));
                finish();
            }
        });


    }


    public void startService(){
        startService(new Intent(getBaseContext(), GPSService.class));
    }

    public void stopService(){
        stopService(new Intent(getBaseContext(), GPSService.class));
    }

}
