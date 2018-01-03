package com.example.ikozompolis.myapplication;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.example.ikozompolis.myapplication.Receiver.AlarmBroadcastReceiver;
import com.facebook.AccessToken;
import com.facebook.CallbackManager;
import com.facebook.FacebookCallback;
import com.facebook.FacebookException;
import com.facebook.GraphRequest;
import com.facebook.GraphResponse;
import com.facebook.login.LoginResult;
import com.facebook.login.widget.LoginButton;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import android.support.v4.app.ActivityCompat;
import static com.example.ikozompolis.myapplication.Usefullmethods.configuration.URL_REGISTER;
import static com.example.ikozompolis.myapplication.Usefullmethods.configuration.URL_USERNAME;
import static com.example.ikozompolis.myapplication.Usefullmethods.configuration.URL_VALIDATE_ACCOUNT;


public class MainActivity extends AppCompatActivity {

    private static final String TAG = "The ID is: ";
    public static final String MyPREFERENCES = "LoginUsername" ;
    public static Boolean status;

    private Button login;
    private EditText username, password;
    private TextView register;
    CallbackManager callbackManager;

    public static AlarmBroadcastReceiver alarmBroadcastReceiver = new AlarmBroadcastReceiver();
    SharedPreferences sharedPreferences;
    HashMap<String, String> params = new HashMap<String, String>();
    AccessToken accessToken;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        callbackManager = CallbackManager.Factory.create();

        /*
        * Initialization
        * */
        login = (Button) findViewById(R.id.login);
        username = (EditText) findViewById(R.id.username);
        password = (EditText) findViewById(R.id.password);
        register = (TextView) findViewById(R.id.register);
        LoginButton loginButton = (LoginButton) findViewById(R.id.fb);
        loginButton.setReadPermissions(Arrays.asList("email","user_work_history","user_education_history","user_likes", "user_events"));
        sharedPreferences = getSharedPreferences(MyPREFERENCES,Context.MODE_PRIVATE);


        if (ContextCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED&&ContextCompat.checkSelfPermission(this, android.Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.ACCESS_FINE_LOCATION, Manifest.permission.ACCESS_COARSE_LOCATION, Manifest.permission.INTERNET}, 1);
        }
        /*
        *Check if the user is already logged in
        **/
        if (sharedPreferences.getString("username",null)!=null){
            Intent intent = new Intent(getApplicationContext(),CentralActivity.class);
            startActivity(intent);
            finish();
        }

        /*
        *Define the login button functionality
        **/
        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                HashMap<String, String> params = new HashMap<String, String>();
                params.put("i_username", username.getText().toString());
                params.put("i_password", password.getText().toString());


                JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.POST, URL_VALIDATE_ACCOUNT, new JSONObject(params), new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {
                             if (response.getString("status").equals("true")){
                                 Toast.makeText(getApplicationContext(),"You are successfully log-in",Toast.LENGTH_LONG).show();
                                 JSONObject object = response.getJSONObject("object");
                                 String username=object.getString("i_username");

                                 SharedPreferences.Editor editor= sharedPreferences.edit();
                                 editor.putString("username",username);
                                 editor.putString("loginWay","CUSTOM");
                                 editor.commit();

                                 Intent intent = new Intent(getApplicationContext(),CentralActivity.class);
                                 startActivity(intent);
                                 alarmBroadcastReceiver.startAlert(getApplicationContext());
                                 finish();

                             }else {
                                 Toast.makeText(getApplicationContext(),"Wrong username or password.",Toast.LENGTH_LONG).show();
                             }
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }

                    }
                }, new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(MainActivity.this,"Something get wrong", Toast.LENGTH_SHORT).show();
                        error.printStackTrace();
                    }
                }
                ); //end of Json Object Request definition

                //Use my singleton class in order to proceed on Json object Request
                Mysingleton.getInstance(MainActivity.this).addToRequestque(jsonObjectRequest);

            }
        });  //end of login button definition


        /*
        *Define register button functionality
        * */
        register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), RegistrationActivity.class);
                register.setTextColor(getColor(R.color.colorPrimary));
                startActivity(intent);
                finish();
            }
        });


        loginButton.registerCallback(callbackManager, new FacebookCallback<LoginResult>() {


            @Override
            public void onSuccess(LoginResult loginResult) {

                fbLoginDecision(loginResult.getAccessToken().getUserId());
            }

            @Override
            public void onCancel() {

                Toast.makeText(MainActivity.this, "You have cancel the login....", Toast.LENGTH_SHORT).show();

            }

            @Override
            public void onError(FacebookException error) {

                Toast.makeText(MainActivity.this, "Something went Wronrg.....", Toast.LENGTH_SHORT).show();

            }
        });

    }


    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        callbackManager.onActivityResult(requestCode, resultCode, data);
    }


    /*
    * This Method check if the user id exists in the database
    * */
    public void fbLoginDecision(final String userID) {


        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.GET, URL_USERNAME + userID, null, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                try {
                    if (response.getString("status").equals("success")){
                        Toast.makeText(getApplicationContext(),"The username exists",Toast.LENGTH_LONG).show();
                        fbLogin(userID);


                    }else {

                        getFbUserInfo(userID);

                    }

                } catch (JSONException e) {
                    e.printStackTrace();
                }

            }
        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(MainActivity.this,"Something get wrong...", Toast.LENGTH_SHORT).show();
                //status = null;
                error.printStackTrace();
            }
        }
        );//End of Json Object request definition

                /*
                * Call the request defined above using Mysingleton Class
                * */
        Mysingleton.getInstance(MainActivity.this).addToRequestque(jsonObjectRequest);



    }

    /*
    * This method register one facebook user
    * */
    public void registerFbUser(final String userID, String email, String name, String surname){

        params.put("i_username", userID);
        params.put("i_password", "");
        params.put("i_first_name", name);
        params.put("i_last_name", surname);
        params.put("i_email_address", email );
        params.put("i_mobile_number", "");

                /*
                * Define the request method that will be used in order to Register the user
                * */
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.POST, URL_REGISTER, new JSONObject(params), new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                try{
                    if (response.getString("status").equals("success")){
                        Toast.makeText(getApplicationContext(),"The Registration completed successfully",Toast.LENGTH_LONG).show();
                        SharedPreferences.Editor editor= sharedPreferences.edit();
                        editor.putString("username",userID);
                        editor.putString("loginWay","FB");
                        editor.commit();
                        startActivity(new Intent(getApplicationContext(),CentralActivity.class));
                        alarmBroadcastReceiver.startAlert(getApplicationContext());
                        finish();

                    }else {
                        Toast.makeText(getApplicationContext(),"No API responce",Toast.LENGTH_LONG).show();


                    }

                }catch (JSONException e){
                    e.printStackTrace();
                }

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(MainActivity.this,"Something get wrong", Toast.LENGTH_SHORT).show();
                error.printStackTrace();

            }
        });

                /*
                * Call the above request method using Mysingleton class
                * */
        Mysingleton.getInstance(MainActivity.this).addToRequestque(jsonObjectRequest);
    }


    /*
    *
    * This method login facebook user
    **/
    public void fbLogin(String userID){

        SharedPreferences.Editor editor= sharedPreferences.edit();
        editor.putString("username",userID);
        editor.putString("loginWay","FB");
        editor.commit();

        Intent intent = new Intent(getApplicationContext(),CentralActivity.class);
        startActivity(intent);
        alarmBroadcastReceiver.startAlert(getApplicationContext());
        finish();


    }


    /*
    * Return FB First name
    * */
    public void getFbUserInfo(final String userID){

        accessToken = AccessToken.getCurrentAccessToken();

        GraphRequest request = GraphRequest.newMeRequest(
                accessToken,
                new GraphRequest.GraphJSONObjectCallback() {
                    @Override
                    public void onCompleted(
                            JSONObject object,
                            GraphResponse response) {
                        try {
                            String email, name, surname;

                            email =object.getString("email");
                            Log.i("giannislogs",object.getString("email"));
                            name=object.getString("first_name");
                            surname = object.getString("last_name");

                            registerFbUser(userID, email, name, surname);

                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                });
        Bundle parameters = new Bundle();
        parameters.putString("fields", "email,first_name,last_name");
        request.setParameters(parameters);
        request.executeAsync();


    }



}