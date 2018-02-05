/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.repository.impl;

import com.mycompany.mycampaignpro.repository.Firebase_Send_Message_Repository;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.util.HashMap;
 
import javax.net.ssl.HttpsURLConnection;
 
import org.apache.http.HttpStatus;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Repository;

/**
 *
 * @author user
 */
@Repository
public class Firebase_Send_Message_Repository_Impl implements Firebase_Send_Message_Repository{
    
    public static final String FCM_URL = "https://fcm.googleapis.com/v1/projects/mycampaigninfo/messages:send";
    public static final String FCM_SERVER_API_KEY    = "AIzaSyD0NvWgqGCfiVw5570M0QHfhTrwKU79Iwo";
    
    
     @Override
    public String sentMessageToUser(String authorization, String usertoken, String title, String body) {
        
            int responseCode = -1;
        String responseBody = null;
        try
        {
            System.out.println("Sending FCM request");
            byte[] postData = getPostData(usertoken,title,body);
            
            URL url = new URL(FCM_URL);
            HttpsURLConnection httpURLConnection = (HttpsURLConnection)url.openConnection();
 
            //set timeputs to 10 seconds
            httpURLConnection.setConnectTimeout(10000);
            httpURLConnection.setReadTimeout(10000);
 
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setUseCaches(false);
            httpURLConnection.setRequestMethod("POST");
            httpURLConnection.setRequestProperty("Content-Type", "application/json");
            httpURLConnection.setRequestProperty("Content-Length", Integer.toString(postData.length));
            httpURLConnection.setRequestProperty("Authorization", "Bearer " + authorization);
 
             
 
            OutputStream out = httpURLConnection.getOutputStream();
            out.write(postData);
            out.close();
            responseCode = httpURLConnection.getResponseCode();
            //success
            if (responseCode == HttpStatus.SC_OK)
            {
                responseBody = convertStreamToString(httpURLConnection.getInputStream());
                System.out.println("FCM message sent : " + responseBody);
                return "success";
            }
            //failure
            else
            {
                responseBody = convertStreamToString(httpURLConnection.getErrorStream());
                System.out.println("Sending FCM request failed for regId: " + authorization + " response: " + responseBody);
                return "fail";
            }
        }
        catch (IOException ioe)
        {
            System.out.println("IO Exception in sending FCM request. regId: " + authorization);
            ioe.printStackTrace();
            return "fail";
        }
        catch (Exception e)
        {
            System.out.println("Unknown exception in sending FCM request. regId: " + authorization);
            e.printStackTrace();
            return "fail";
        }
        
    }

    @Override
    public byte[] getPostData(String registrationId, String title, String body) throws JSONException {
      
        
        String jsonrequest = "{\"message\":{\"token\" : \"" + registrationId + "\",\"notification\" : {\"body\" : \"" + body + "\",\"title\" : \"" + title + "\" }}}";
        
        
 
        return jsonrequest.getBytes();
    }

    @Override
    public String convertStreamToString(InputStream inStream) throws Exception {

        InputStreamReader inputStream = new InputStreamReader(inStream);
        BufferedReader bReader = new BufferedReader(inputStream);
 
        StringBuilder sb = new StringBuilder();
        String line = null;
        while((line = bReader.readLine()) != null)
        {
            sb.append(line);
        }
 
        return sb.toString();
        
    }
    
}
