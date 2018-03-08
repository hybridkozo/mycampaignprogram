package com.example.ikozompolis.myapplication.Usefullmethods;

import com.android.volley.Request;

/**
 * Created by user on 2/12/2017.
 */

public class configuration {

    public static final String ip_v4="192.168.1.105";
    public static final String localURL = "http://" + ip_v4 + ":8080/";
    public static final String URL_USERNAME="http://" + ip_v4 +":8080/getByUsername?username=";
    public static String URL_VALIDATE_ACCOUNT = "http://" + ip_v4 +":8080/validateAccount";
    public static String URL_REGISTER="http://" + ip_v4 +":8080/register";

    public static String URL_SAVE_WORK_INFO = localURL + "newWorkInfo";
    public static String URL_SAVE_EDUCATION_INFO = localURL + "saveEducationInfo";
    public static String URL_SAVE_FB_BOOK = localURL + "newFbBook";
    public static String URL_SAVE_FB_EVENT = localURL + "newFbEvent";
    public static String URL_SAVE_FB_FAVORITE_TEAM = localURL + "saveFbFavoriteTeam";
    public static String URL_SAVE_FB_MUSIC = localURL + "saveFbMusic";
    public static String URL_SAVE_FB_INTEREST_PAGE = localURL + "saveInterestFbPage";

    public static String URL_UPDATE_FIREBASE_DEVICE_ID = localURL + "setFirebaseDeviceId";

    public static int methodGET = Request.Method.GET;
    public static int methodPOST = Request.Method.POST;
}
