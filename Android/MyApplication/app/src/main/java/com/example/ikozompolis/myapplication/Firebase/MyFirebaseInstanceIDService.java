package com.example.ikozompolis.myapplication.Firebase;

/**
 * Created by user on 30/1/2018.
 */

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.example.ikozompolis.myapplication.MainActivity;
import com.example.ikozompolis.myapplication.Mysingleton;
import com.google.firebase.iid.FirebaseInstanceId;
import com.google.firebase.iid.FirebaseInstanceIdService;

import org.json.JSONException;
import org.json.JSONObject;

import static com.example.ikozompolis.myapplication.Usefullmethods.configuration.URL_UPDATE_FIREBASE_DEVICE_ID;


public class MyFirebaseInstanceIDService extends FirebaseInstanceIdService {

    private static final String TAG = "MyFirebaseIIDService";
    SharedPreferences sharedPreferences;


    public String getFBCToken(){
        return FirebaseInstanceId.getInstance().getToken();
    }

    /**
     * Called if InstanceID token is updated. This may occur if the security of
     * the previous token had been compromised. Note that this is called when the InstanceID token
     * is initially generated so this is where you would retrieve the token.
     */
    // [START refresh_token]
    @Override
    public void onTokenRefresh() {
        // Get updated InstanceID token.
        String refreshedToken = FirebaseInstanceId.getInstance().getToken();
        Log.d(TAG, "Refreshed token: " + refreshedToken);

        // If you want to send messages to this application instance or
        // manage this apps subscriptions on the server side, send the
        // Instance ID token to your app server.
        sendRegistrationToServer(refreshedToken);
    }
    // [END refresh_token]

    /**
     * Persist token to third-party servers.
     *
     * Modify this method to associate the user's FCM InstanceID token with any server-side account
     * maintained by your application.
     *
     * @param token .
     */
    private void sendRegistrationToServer(String token) {
        sharedPreferences = getSharedPreferences(MainActivity.MyPREFERENCES, Context.MODE_PRIVATE);
        String username = sharedPreferences.getString("username",null);
        String URL = URL_UPDATE_FIREBASE_DEVICE_ID + "?usernmae=" + username + "&firebaseId=" +token;

        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.GET, URL, null, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {


                try {
                    if (response.getString("status").equals("success")){
                        Log.i("FIREBASE","The Firebase Device Id has been updated successfully...");

                    }else {
                        Log.e("FIREBASE","The Firebase Device Id has not updated successfully please check the Server side APP...");
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }

            }}, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                error.printStackTrace();
            }
        }
        );

        Mysingleton.getInstance(MyFirebaseInstanceIDService.this).addToRequestque(jsonObjectRequest);
    }
}