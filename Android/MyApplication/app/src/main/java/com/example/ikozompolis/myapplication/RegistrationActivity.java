package com.example.ikozompolis.myapplication;

import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import org.json.JSONException;
import org.json.JSONObject;
import java.util.Objects;
import static com.example.ikozompolis.myapplication.Usefullmethods.configuration.URL_USERNAME;

/*
* This class definition describes the 1st Register Screen
* */
public class RegistrationActivity extends AppCompatActivity {

    private Button next;
    private EditText username, password, repassword;
    SharedPreferences sharedPreferences;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registration);

        /*
        * Initialization
        * */
        next = (Button) findViewById(R.id.next);
        username = (EditText) findViewById(R.id.username);
        password = (EditText) findViewById(R.id.password);
        repassword = (EditText) findViewById(R.id.repassword);

        /*
        * Define the "next" button functionality
        * */
        next.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                final String data = username.getText().toString();


                /*
                * Define the request that will be called
                * */
                JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.GET, URL_USERNAME + data, null, new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {
                            if (response.getString("status").equals("success")){
                                Toast.makeText(getApplicationContext(),"The username exists",Toast.LENGTH_LONG).show();

                            }else {

                                if(Objects.equals(password.getText().toString(), repassword.getText().toString())){
                                    Intent intent = new Intent(getApplicationContext(),Registration2Activity.class);
                                    intent.putExtra("USERNAME", username.getText().toString());
                                    intent.putExtra("PASSWORD", password.getText().toString());
                                    startActivity(intent);
                                    finish();

                                } else{
                                    Toast.makeText(getApplicationContext(),"Passwords do not match",Toast.LENGTH_LONG).show();
                                }

                            }

                        } catch (JSONException e) {
                            e.printStackTrace();
                        }

                    }
                }, new Response.ErrorListener() {

                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(RegistrationActivity.this,"Something get wrong...", Toast.LENGTH_SHORT).show();
                        error.printStackTrace();
                    }
                }
                );//End of Json Object request definition

                /*
                * Call the request defined above using Mysingleton Class
                * */
                Mysingleton.getInstance(RegistrationActivity.this).addToRequestque(jsonObjectRequest);

            }
        }); //End of "next" button functionality
    }
}
