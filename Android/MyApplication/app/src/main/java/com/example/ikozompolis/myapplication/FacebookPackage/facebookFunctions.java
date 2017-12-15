package com.example.ikozompolis.myapplication.FacebookPackage;

import android.content.Context;
import android.os.Bundle;
import android.widget.Toast;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.example.ikozompolis.myapplication.Mysingleton;
import com.facebook.AccessToken;
import com.facebook.GraphRequest;
import com.facebook.GraphResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import static com.example.ikozompolis.myapplication.CentralActivity.location;
import static com.example.ikozompolis.myapplication.CentralActivity.username;
import static com.example.ikozompolis.myapplication.Usefullmethods.configuration.URL_SAVE_EDUCATION_INFO;
import static com.example.ikozompolis.myapplication.Usefullmethods.configuration.URL_SAVE_FB_FAVORITE_TEAM;
import static com.example.ikozompolis.myapplication.Usefullmethods.configuration.URL_SAVE_FB_MUSIC;
import static com.example.ikozompolis.myapplication.Usefullmethods.configuration.URL_SAVE_WORK_INFO;
import static com.example.ikozompolis.myapplication.Usefullmethods.configuration.methodGET;


/**
 * Created by user on 9/12/2017.
 */

public class facebookFunctions {

    public facebookFunctions() {

    }

    public void saveUserWorkInfo(AccessToken accessToken, final Context context) {


        GraphRequest request = GraphRequest.newMeRequest(
                accessToken,
                new GraphRequest.GraphJSONObjectCallback() {
                    @Override
                    public void onCompleted(
                            JSONObject object,
                            GraphResponse response) {


                        try {
                            String employer, position, URL;

                            if (object.getString("work") != null) {

                                JSONArray jsonArray = object.getJSONArray("work");
                                for (int i = 0; i < jsonArray.length(); i++) {

                                    JSONObject obj = jsonArray.getJSONObject(i);
                                    JSONObject empl = obj.getJSONObject("employer");
                                    JSONObject pos = obj.getJSONObject("position");
                                    employer = empl.getString("name");
                                    position = pos.getString("name");
                                    location.setText("Employer: " + employer + "\nPosition: " + position);
                                    URL = URL_SAVE_WORK_INFO + "?i_username=" + username + "&i_work_employer=" + employer + "&i_work_position=" + position;
                                    saveData(URL,methodGET,context,"The work experience saved successfully...","Something went wrong on saving work experience...");

                                }

                            }else {
                                Toast.makeText(context, "No Work experience found...", Toast.LENGTH_SHORT).show();
                            }


                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                });
        Bundle parameters = new Bundle();
        parameters.putString("fields", "work");
        request.setParameters(parameters);
        request.executeAsync();

    }




    public void saveUserEducationInfo(AccessToken accessToken, final Context context) {


        GraphRequest request = GraphRequest.newMeRequest(
                accessToken,
                new GraphRequest.GraphJSONObjectCallback() {
                    @Override
                    public void onCompleted(
                            JSONObject object,
                            GraphResponse response) {


                        try {
                            String degree, school, type , year, URL;

                            if (object.getString("education") != null) {
                                JSONObject deg, sch, yr,typ;
                                JSONArray jsonArray = object.getJSONArray("education");
                                for (int i = 0; i < jsonArray.length(); i++) {

                                    JSONObject obj = jsonArray.getJSONObject(i);

                                    if (obj.has("degree")) {
                                        deg = obj.getJSONObject("degree");
                                    }else{
                                        deg = new JSONObject().put("name","");
                                    }
                                    if (obj.has("school")) {
                                        sch = obj.getJSONObject("school");
                                    }else {
                                        sch = new JSONObject().put("name", "");
                                    }
                                     if (obj.has("year")){
                                         yr = obj.getJSONObject("year");
                                     }else {
                                         yr = new JSONObject().put("name","");
                                     }

                                    degree = deg.getString("name");
                                    school = sch.getString("name");
                                    if (obj.has("type")) {
                                        type = obj.getString("type");
                                    }else {
                                        type = null;
                                    }
                                    year = yr.getString("name");
                                    URL = URL_SAVE_EDUCATION_INFO + "?i_username=" + username + "&i_edu_degree=" + degree + "&i_edu_school=" + school + "&i_edu_type=" + type + "&i_edu_year=" + year;
                                    saveData(URL,methodGET,context,"The Education Info saved successfully...","Something went wrong on saving Education Info...");

                                }

                            }else {
                                Toast.makeText(context, "No Work experience found...", Toast.LENGTH_SHORT).show();
                            }


                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                });
        Bundle parameters = new Bundle();
        parameters.putString("fields", "education");
        request.setParameters(parameters);
        request.executeAsync();

    }




    public void saveFbMusicInfo(AccessToken accessToken, final Context context) {


        GraphRequest request = GraphRequest.newMeRequest(
                accessToken,
                new GraphRequest.GraphJSONObjectCallback() {
                    @Override
                    public void onCompleted(
                            JSONObject object,
                            GraphResponse response) {
                                String i_music_title,URL;

                        try {

                            if (object.getString("music") != null) {
                                JSONObject data = object.getJSONObject("data");
                                JSONArray jsonArray = data.getJSONArray("data");
                                for (int i = 0; i < jsonArray.length(); i++) {
                                    JSONObject obj = jsonArray.getJSONObject(i);
                                    i_music_title = obj.getString("name");
                                    URL = URL_SAVE_FB_MUSIC + "?i_music_title=" + i_music_title;
                                    saveData(URL,methodGET,context,"The FB Music Info saved successfully...","Something went wrong on saving FB Music Info...");
                                }

                            }else {
                                Toast.makeText(context, "No Work experience found...", Toast.LENGTH_SHORT).show();
                            }


                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                });
        Bundle parameters = new Bundle();
        parameters.putString("fields", "music");
        request.setParameters(parameters);
        request.executeAsync();

    }


    public void saveFbFavoriteTeams(AccessToken accessToken, final Context context) {


        GraphRequest request = GraphRequest.newMeRequest(
                accessToken,
                new GraphRequest.GraphJSONObjectCallback() {
                    @Override
                    public void onCompleted(
                            JSONObject object,
                            GraphResponse response) {
                        String i_team_name,URL;

                        try {

                            if (object != null) {
                                JSONArray jsonArray = object.getJSONArray("favorite_teams");
                                for (int i = 0; i < jsonArray.length(); i++) {
                                    JSONObject obj = jsonArray.getJSONObject(i);
                                    i_team_name = obj.getString("name");
                                    URL = URL_SAVE_FB_FAVORITE_TEAM + "?i_team_name=" + i_team_name;
                                    saveData(URL,methodGET,context,"The FB Favorite Team Info saved successfully...","Something went wrong on saving FB Favorite Team Info...");
                                }

                            }else {
                                Toast.makeText(context, "No FB Favorite Team Info experience found...", Toast.LENGTH_SHORT).show();
                            }


                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                });
        Bundle parameters = new Bundle();
        parameters.putString("fields", "music");
        request.setParameters(parameters);
        request.executeAsync();

    }






    public void retrieveSecondLevelInfo(AccessToken accessToken,final String path,final Context context,final String URL,final String infoValue, String successMessage, String failMassage){

        GraphRequest request = GraphRequest.newGraphPathRequest(accessToken,path , new GraphRequest.GraphJSONArrayCallback() {
            @Override
            public void onCompleted(JSONArray objects, GraphResponse response) {

            }
        });
        Bundle parameters = new Bundle();
        parameters.putString("fields", infoValue);
        request.setParameters(parameters);
        request.executeAsync();
    }





    public void saveData(String URL, int method, final Context context, final String successMessage, final String failMessage) {

        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(method, URL, null, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                try {
                    String status = response.getString("status");
                    if (status.equals("success")){
                        Toast.makeText(context, successMessage, Toast.LENGTH_SHORT).show();
                    }else {
                        Toast.makeText(context, failMessage, Toast.LENGTH_SHORT).show();
                    }

                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(context, "Something went wrong", Toast.LENGTH_LONG).show();

            }
        });

        Mysingleton.getInstance(context).addToRequestque(jsonObjectRequest);


    }

}
