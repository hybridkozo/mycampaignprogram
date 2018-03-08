package com.example.ikozompolis.myapplication.FacebookPackage;

import android.content.Context;
import android.os.Bundle;
import android.util.Log;
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

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import static com.example.ikozompolis.myapplication.CentralActivity.location;
import static com.example.ikozompolis.myapplication.CentralActivity.username;
import static com.example.ikozompolis.myapplication.Usefullmethods.configuration.URL_SAVE_EDUCATION_INFO;
import static com.example.ikozompolis.myapplication.Usefullmethods.configuration.URL_SAVE_FB_BOOK;
import static com.example.ikozompolis.myapplication.Usefullmethods.configuration.URL_SAVE_FB_EVENT;
import static com.example.ikozompolis.myapplication.Usefullmethods.configuration.URL_SAVE_FB_FAVORITE_TEAM;
import static com.example.ikozompolis.myapplication.Usefullmethods.configuration.URL_SAVE_FB_INTEREST_PAGE;
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

                            if (object.has("work")) {

                                JSONArray jsonArray = object.getJSONArray("work");
                                JSONObject empl= new JSONObject();
                                JSONObject pos=new JSONObject();
                                for (int i = 0; i < jsonArray.length(); i++) {
                                    JSONObject obj = jsonArray.getJSONObject(i);
                                    if(obj.has("employer")) {
                                        empl = obj.getJSONObject("employer");
                                    }else{
                                         empl.put("name", "");
                                    }
                                    if(obj.has("position")) {
                                        pos = obj.getJSONObject("position");
                                    }
                                    else{
                                        pos.put("name","");
                                    }
                                    if(empl.getString("name")!="") {
                                        employer = URLEncoder.encode(empl.getString("name"),"utf-8");
                                    }
                                    else {
                                        employer =null;
                                    }
                                    if (pos.getString("name")!="") {
                                        position = URLEncoder.encode(pos.getString("name"),"utf-8");
                                    }else{
                                        position = null;
                                    }

                                    URL = URL_SAVE_WORK_INFO + "?i_username=" + username + "&i_work_employer=" + employer + "&i_work_position=" + position;
                                    saveData(URL,methodGET,context,"The work experience saved successfully...","Something went wrong on saving work experience...");

                                }

                            }else {
                                Log.v("FACEBOOK_FUNCTIONS", "No work info found from facebook...");
                            }


                        } catch (JSONException e) {
                            e.printStackTrace();
                        } catch (UnsupportedEncodingException e) {
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

                            if (object.has("education")) {
                                JSONObject deg, sch, yr,obj;
                                JSONArray jsonArray = object.getJSONArray("education");
                                for (int i = 0; i < jsonArray.length(); i++) {

                                     obj = jsonArray.getJSONObject(i);

                                    if (obj.has("degree")) {
                                        deg = obj.getJSONObject("degree");
                                    }else{
                                        deg = null;
                                    }
                                    if (obj.has("school")) {
                                        sch = obj.getJSONObject("school");
                                    }else {
                                        sch = null;
                                    }
                                     if (obj.has("year")){
                                         yr = obj.getJSONObject("year");
                                     }else {
                                         yr = null;
                                     }
                                    if (obj.has("type")) {
                                        type = URLEncoder.encode(obj.getString("type"),"utf-8");
                                    }else {
                                        type = null;
                                    }

                                    if(deg!=null){
                                        degree = URLEncoder.encode(deg.getString("name"),"utf-8");
                                    }else{
                                        degree = null;
                                    }
                                    if(sch!=null) {
                                        school = URLEncoder.encode(sch.getString("name"),"utf-8");
                                    }else{
                                        school = null;
                                    }
                                    if(yr!=null) {
                                        year = URLEncoder.encode(yr.getString("name"),"utf-8");
                                    }else{
                                        year=null;
                                    }
                                    URL = URL_SAVE_EDUCATION_INFO + "?i_username=" + username + "&i_edu_degree=" + degree + "&i_edu_school=" + school + "&i_edu_type=" + type + "&i_edu_year=" + year;
                                    saveData(URL,methodGET,context,"The Education Info saved successfully...","Something went wrong on saving Education Info...");

                                }

                            }else {

                                Log.v("FACEBOOK_FUNCTIONS", "No Education Info found from facebook....");
                            }


                        } catch (JSONException e) {
                            e.printStackTrace();
                        } catch (UnsupportedEncodingException e) {
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

                            if (object.has("music")) {
                                JSONObject music = object.getJSONObject("music");
                                JSONArray jsonArray = music.getJSONArray("data");
                                JSONObject obj;
                                for (int i = 0; i < jsonArray.length(); i++) {
                                    obj = jsonArray.getJSONObject(i);
                                    if(obj.has("name")) {
                                        i_music_title = URLEncoder.encode(obj.getString("name"),"utf-8");
                                    }else{
                                        i_music_title = null;
                                    }
                                    URL = URL_SAVE_FB_MUSIC + "?i_username=" + username + "&i_music_title=" + i_music_title;
                                    saveData(URL,methodGET,context,"The FB Music Info saved successfully...","Something went wrong on saving FB Music Info...");
                                }

                            }else {
                                Log.v("FACEBOOK_FUNCTIONS", "No music info found from facebook...");
                            }


                        } catch (JSONException e) {
                            e.printStackTrace();
                        } catch (UnsupportedEncodingException e) {
                            e.printStackTrace();
                        }
                    }
                });
        Bundle parameters = new Bundle();
        parameters.putString("fields", "music");
        request.setParameters(parameters);
        request.executeAsync();

    }



    public void saveFbEvents(AccessToken accessToken, final Context context) {


        GraphRequest request = GraphRequest.newMeRequest(
                accessToken,
                new GraphRequest.GraphJSONObjectCallback() {
                    @Override
                    public void onCompleted(
                            JSONObject object,
                            GraphResponse response) {
                        String URL,i_event_name, i_event_description, i_event_start_date;

                        try {

                            if (object.getString("events") != null) {
                                JSONObject music = object.getJSONObject("events");
                                JSONArray jsonArray = music.getJSONArray("data");
                                for (int i = 0; i < jsonArray.length(); i++) {
                                    JSONObject obj = jsonArray.getJSONObject(i);
                                    if(obj.has("name")){
                                        i_event_name = URLEncoder.encode(obj.getString("name"),"utf-8");
                                    }
                                    else {
                                        i_event_name = null;
                                    }

                                    if (obj.has("description")) {
                                        i_event_description =URLEncoder.encode(obj.getString("description"),"utf-8");
                                    }else{
                                        i_event_description=null;
                                    }
                                    if(obj.has("start_time")) {
                                        i_event_start_date = URLEncoder.encode(obj.getString("start_time"), "utf-8");
                                    }
                                    else {
                                        i_event_start_date = null;
                                    }
                                    URL = URL_SAVE_FB_EVENT + "?username=" + username + "&i_event_name=" + i_event_name + "&i_event_description=" + i_event_description + "&i_event_start_date=" + i_event_start_date;
                                    saveData(URL,methodGET,context,"The FB Event Info saved successfully...","Something went wrong on saving FB Event Info...");
                                }

                            }else {
                                Log.v("FACEBOOK_FUNCTIONS", "No FB Events found...");
                            }


                        } catch (JSONException e) {
                            e.printStackTrace();
                        } catch (UnsupportedEncodingException e) {
                            e.printStackTrace();
                        }
                    }
                });
        Bundle parameters = new Bundle();
        parameters.putString("fields", "events");
        request.setParameters(parameters);
        request.executeAsync();

    }



    public void saveFbFavoriteTeams(AccessToken accessToken, final Context context) {


        GraphRequest request = GraphRequest.newMeRequest(
                accessToken,
                new GraphRequest.GraphJSONObjectCallback(){
                    @Override
                    public void onCompleted(JSONObject object, GraphResponse response) {
                        String i_team_name,URL;

                        try {

                            if (object.has("favorite_teams")) {
                                JSONArray data = object.getJSONArray("favorite_teams");
                                JSONObject name;
                                for (int i = 0; i < data.length(); i++) {
                                    name = data.getJSONObject(i);
                                    i_team_name = URLEncoder.encode(name.getString("name"), "utf-8");
                                    URL = URL_SAVE_FB_FAVORITE_TEAM + "?i_username=" + username + "&i_team_name=" + i_team_name;
                                    saveData(URL,methodGET,context,"The FB Favorite Team Info saved successfully...","Something went wrong on saving FB Favorite Team Info...");
                                }

                            }else {
                                Log.v("FACEBOOK_FUNCTIONS", "No FB Favorite Team Info experience found..");
                            }


                        } catch (JSONException e) {
                            e.printStackTrace();
                        } catch (UnsupportedEncodingException e) {
                            e.printStackTrace();
                        }
                    }
                });
        Bundle parameters = new Bundle();
        parameters.putString("fields", "favorite_teams");
        request.setParameters(parameters);
        request.executeAsync();

    }




    public void saveFbBooksInfo(AccessToken accessToken, final Context context) {


        GraphRequest request = GraphRequest.newGraphPathRequest(
                accessToken,"me?fields=books{name,description}",
                new GraphRequest.Callback() {
                    @Override
                    public void onCompleted(GraphResponse response) {
                                JSONObject jsonObject = response.getJSONObject();
                                String name,description, URL;
                        try {
                            if (jsonObject.has("books")){
                                JSONObject book = jsonObject.getJSONObject("books");
                                JSONArray data = book.getJSONArray("data");
                                JSONObject obj;
                                for (int i = 0; i<data.length();i++){
                                    obj = data.getJSONObject(i);
                                    if(obj.has("name")) {
                                        name = URLEncoder.encode(obj.getString("name"),"utf-8");
                                    }else {
                                        name = null;
                                    }

                                    if( obj.has("description")) {
                                        description = URLEncoder.encode(obj.getString("description"), "utf-8");
                                    } else {
                                        description = null;
                                    }
                                    URL = URL_SAVE_FB_BOOK + "?username=" + username + "&name=" + name + "&description=" + description;
                                    saveData(URL,methodGET,context,"The FB Books Info saved successfully...","Something went wrong on saving FB Books Info...");
                                }
                            }else{
                                Log.v("FACEBOOK_FUNCTIONS", "No FB Events Info found...");
                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                        } catch (UnsupportedEncodingException e) {
                            e.printStackTrace();
                        }

                    }
                });

        request.executeAsync();

    }


    public void saveFbLastPageLikes(AccessToken accessToken, final Context context) {


        GraphRequest request = GraphRequest.newGraphPathRequest(
                accessToken,"me?fields=likes{about,name}",
                new GraphRequest.Callback() {
                    @Override
                    public void onCompleted(GraphResponse response) {
                        JSONObject jsonObject = response.getJSONObject();
                        String name,about, URL;
                        try {
                            if (jsonObject.getString("likes")!=null){
                                JSONObject book = jsonObject.getJSONObject("likes");
                                JSONArray data = book.getJSONArray("data");
                                for (int i = 0; i<data.length();i++){
                                    JSONObject obj = data.getJSONObject(i);
                                    if(obj.has("name")) {
                                        name = URLEncoder.encode(obj.getString("name"),"utf-8");
                                    }else {
                                        name = null;
                                    }
                                    if( obj.has("about")) {
                                        about = URLEncoder.encode(obj.getString("about"),"utf-8");
                                    } else {
                                        about = null;
                                    }
                                    URL = URL_SAVE_FB_INTEREST_PAGE + "?i_username=" + username + "&i_page_name=" + name + "&i_page_description=" + about;
                                    saveData(URL,methodGET,context,"The Info saved successfully...","Something went wrong on saving FB Info...");
                                }
                            }else{
                                Log.v("FACEBOOK_FUNCTIONS", "No FB Interest Pages Info experience found...");
                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                        } catch (UnsupportedEncodingException e) {
                            e.printStackTrace();
                        }

                    }
                });

        request.executeAsync();

    }



    public void saveData(String URL, int method, final Context context, final String successMessage, final String failMessage) {

        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(method, URL, null, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                try {
                    String status = response.getString("status");
                    if (status.equals("success")){
                        Log.v("FACEBOOK_FUNCTIONS", successMessage);
                    }else {
                        Log.v("FACEBOOK_FUNCTIONS", failMessage);
                    }

                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.v("ON_RESPONSE_VOLLEY: ", "Something went wrong on response... please try again..");

            }
        });

        Mysingleton.getInstance(context).addToRequestque(jsonObjectRequest);


    }

}
