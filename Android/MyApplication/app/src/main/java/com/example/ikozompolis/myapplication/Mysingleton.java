package com.example.ikozompolis.myapplication;

import android.content.Context;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.Volley;

/**
 * Created by ikozompolis on 4/8/2017.
 */

/*
* This class provide the way that the API requests will be queued
* */

public class Mysingleton {

    private static Mysingleton mInstance;
    private RequestQueue requestQueue;
    private static Context mCtx;

    private Mysingleton(Context context){
        mCtx = context;
        requestQueue=getRequestQueue();
    }


    public RequestQueue getRequestQueue(){

        if(requestQueue == null){
            requestQueue = Volley.newRequestQueue(mCtx.getApplicationContext());


        }
        return requestQueue;
    }

    public static synchronized Mysingleton getInstance(Context context){

        if(mInstance == null){
            mInstance = new Mysingleton(context);
        }
        return mInstance;
    }


    public<T> void addToRequestque(Request<T> request){

        requestQueue.add(request);


    }
}
