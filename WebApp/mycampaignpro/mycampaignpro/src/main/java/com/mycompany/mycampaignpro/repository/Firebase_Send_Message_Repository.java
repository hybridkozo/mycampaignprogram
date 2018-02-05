/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.repository;

import java.io.InputStream;
import org.json.JSONException;

/**
 *
 * @author user
 */
public interface Firebase_Send_Message_Repository {
     String sentMessageToUser(String authorization, String usertoken, String title, String body);
    
     byte[] getPostData(String registrationId, String title, String body) throws JSONException;
     
     String convertStreamToString (InputStream inStream) throws Exception;
}
