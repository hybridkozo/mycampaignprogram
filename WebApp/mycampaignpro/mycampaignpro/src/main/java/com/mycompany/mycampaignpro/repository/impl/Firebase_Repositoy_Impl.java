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
import org.springframework.stereotype.Repository;

/**
 *
 * @author ikozompolis
 */
@Repository
public class Firebase_Repositoy_Impl implements Firebase_Repository{

    /**
     *
     * @return
     * @throws IOException
     */
    @Override
    public String getAccessToken() throws IOException{
       GoogleCredential googleCredential = GoogleCredential
      .fromStream(new FileInputStream("mycampaigninfo-firebase-adminsdk-w35bk-47d6f9bd2a.json"))
      .createScoped(Arrays.asList("https://www.googleapis.com/auth/firebase",
                    "https://www.googleapis.com/auth/cloud-platform"));
  googleCredential.refreshToken();
  return googleCredential.getAccessToken();
    }
    
}
