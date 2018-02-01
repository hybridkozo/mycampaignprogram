/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.repository.impl;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.mycompany.mycampaignpro.repository.Firebase_Repository;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Arrays;
import org.hibernate.validator.constraints.URL;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ikozompolis
 */
@Repository
public class Firebase_Repositoy_Impl implements Firebase_Repository{

    private static final String CONFIG_FILE = "/mycampaigninfo-firebase-adminsdk-w35bk-47d6f9bd2a.json";
    java.net.URL fileUrl = getClass().getResource(CONFIG_FILE);
    /**
     *
     * @return
     * @throws IOException
     */
    @Override
    public String getAccessToken() throws IOException{
       GoogleCredential googleCredential = GoogleCredential
      .fromStream(new FileInputStream(fileUrl.getFile()))
      .createScoped(Arrays.asList("https://www.googleapis.com/auth/firebase.messaging"));
  googleCredential.refreshToken();
  return googleCredential.getAccessToken();
    }
    
}
