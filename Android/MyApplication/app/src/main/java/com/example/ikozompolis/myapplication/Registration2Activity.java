package com.example.ikozompolis.myapplication;


import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
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
import java.util.HashMap;
import static com.example.ikozompolis.myapplication.MainActivity.MyPREFERENCES;
import static com.example.ikozompolis.myapplication.MainActivity.alarmBroadcastReceiver;
import static com.example.ikozompolis.myapplication.Usefullmethods.configuration.URL_REGISTER;

/*
* This class definition describes the 2nd Register Screen
* */
public class Registration2Activity extends AppCompatActivity {

    private EditText name, surname, email, mobile;
    private Button register;


    SharedPreferences sharedPreferences;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registration2);

        name = (EditText) findViewById(R.id.name);
        surname = (EditText) findViewById(R.id.surname);
        email = (EditText) findViewById(R.id.email);
        mobile = (EditText) findViewById(R.id.mobile);
        register = (Button) findViewById(R.id.register);
        sharedPreferences = getSharedPreferences(MyPREFERENCES, Context.MODE_PRIVATE);

        final Intent intent = getIntent();

        /*
        * Definition of Register button
        * */
        register.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View view) {

                final HashMap<String, String> params = new HashMap<String, String>();
                params.put("i_username", intent.getStringExtra("USERNAME"));
                params.put("i_password", intent.getStringExtra("PASSWORD"));
                params.put("i_first_name", name.getText().toString());
                params.put("i_last_name", surname.getText().toString());
                params.put("i_email_address", email.getText().toString() );
                params.put("i_mobile_number", mobile.getText().toString());

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
                                editor.putString("username",intent.getStringExtra("USERNAME"));
                                editor.putString("loginWay","CUSTOM");
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
                        Toast.makeText(Registration2Activity.this,"Something get wrong", Toast.LENGTH_SHORT).show();
                        error.printStackTrace();

                    }
                });

                /*
                * Call the above request method using Mysingleton class
                * */
                Mysingleton.getInstance(Registration2Activity.this).addToRequestque(jsonObjectRequest);


            }
        });

    }

}
