package com.example.ikozompolis.myapplication.Usefullmethods;

import com.android.volley.Request;

/**
 * Created by user on 2/12/2017.
 */

public class configuration {

    public static final String ip_v4="10.101.89.156";
    public static final String localURL = "http://" + ip_v4 + ":8080/";
    public static final String URL_USERNAME="http://" + ip_v4 +":8080/getByUsername?username=";
    public static String URL_VALIDATE_ACCOUNT = "http://" + ip_v4 +":8080/validateAccount";
    public static String URL_REGISTER="http://" + ip_v4 +":8080/register";

    public static String URL_SAVE_WORK_INFO = localURL + "newWorkInfo";
    public static String URL_SAVE_EDUCATION_INFO = localURL + "saveEducationInfo";



    public static int methodGET = Request.Method.GET;
    public static int methodPOST = Request.Method.POST;
}
