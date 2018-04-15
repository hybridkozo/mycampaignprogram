package com.example.ikozompolis.myapplication.services;

import android.app.NotificationManager;
import android.app.job.JobParameters;
import android.app.job.JobService;
import android.app.job.JobWorkItem;
import android.content.Context;
import android.content.SharedPreferences;
import android.location.Address;
import android.location.Geocoder;
import android.os.AsyncTask;
import android.preference.PreferenceManager;
import android.util.Log;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.example.ikozompolis.myapplication.CentralActivity;
import com.example.ikozompolis.myapplication.MainActivity;
import com.example.ikozompolis.myapplication.Mysingleton;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import static com.example.ikozompolis.myapplication.Usefullmethods.configuration.localURL;


/**
 * Created by user on 29/10/2017.
 */

public class JobServiceLocation extends JobService {



    private NotificationManager mNM;
    SharedPreferences sharedPreferences;
    SharedPreferences sharedPreferences2;
   // private CommandProcessor mCurProcessor;

    @Override
    public boolean onStartJob(JobParameters jobParameters) {

        sharedPreferences = getSharedPreferences(GPSService.GpsPREFERENCES, Context.MODE_PRIVATE);
        sharedPreferences2 = getSharedPreferences(MainActivity.MyPREFERENCES, Context.MODE_PRIVATE);

        Toast.makeText(getApplicationContext(),"The job has been started",Toast.LENGTH_LONG).show();

        // Start task to pull work out of the queue and process it.
        if(sharedPreferences.getString("latitude", null)!=null&&sharedPreferences2.getString("username",null)!=null){

            InsertLocation(APIURL(getAPIParameters(Double.valueOf(sharedPreferences.getString("latitude", null)), Double.valueOf(sharedPreferences.getString("longitude", null)))));

        }

            // Allow the job to continue running while we process work.
        return false;
    }

    @Override
    public boolean onStopJob(JobParameters jobParameters) {

        return false;
    }


    private String[] getAPIParameters(double lat, double lon) {

        String errorMessage, TAG = "GET ADDRESS: ",CountyCode= null, CountryName= null, FeatureName= null, PostalCode= null, SubAdminArea = null, AdminArea= null,Address = null;
        Geocoder geocoder = new Geocoder(getApplicationContext(), Locale.getDefault());
        List<Address> addresses = null;

        try {
            addresses = geocoder.getFromLocation(lat, lon, 10);
        } catch (IOException ioException) {
            // Catch network or other I/O problems.
            errorMessage = "The service is not available";
            Log.e(TAG, errorMessage, ioException);
        } catch (IllegalArgumentException illegalArgumentException) {
            // Catch invalid latitude or longitude values.
            errorMessage = "Invalid latitude used...";
            Log.e(TAG, errorMessage + ". " +
                    "Latitude = " + lat +
                    ", Longitude = " +
                    lon, illegalArgumentException);
        }

        // Handle case where no address was found.
        if (addresses == null || addresses.size() == 0) {

                errorMessage = "The address is not found...";
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
            for (int i = 0; i <= address2.getMaxAddressLineIndex(); i++) {
                addressFragments.add(address2.getAddressLine(i));
            }
            Address = addressFragments.get(0);
            Log.i(TAG, "The address has been found...");

        }

        String[] APIParameters = {CountyCode, CountryName, FeatureName, PostalCode, SubAdminArea, AdminArea, Address};

        return APIParameters;
    }

    private String APIURL(String[] APIParameters){

        String URL = localURL + "saveLocation?" + "i_username=" +  sharedPreferences2.getString("username", null) + "&i_country_code=" + APIParameters[0] + "&i_country_name=" + APIParameters[1] + "&i_city_name=" + APIParameters[2] + "&i_prefecture=" + APIParameters[4] + "&i_department=" + APIParameters[5] + "&i_street_address=" + APIParameters[6] + "&i_postal_code=" + APIParameters[3];
        Log.v("CreateURL", URL);
        return URL;
    }

    private void InsertLocation(String URL){


        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.GET, URL, null, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                try {
                    JSONObject jsonObject = response.getJSONObject("object");

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

        Mysingleton.getInstance(getApplicationContext()).addToRequestque(jsonObjectRequest);


    }


}
