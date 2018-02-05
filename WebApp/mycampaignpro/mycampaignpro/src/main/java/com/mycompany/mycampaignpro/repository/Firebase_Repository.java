/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.repository;

import java.io.IOException;
import java.io.InputStream;
import org.json.JSONException;

/**
 *
 * @author ikozompolis
 */
public interface Firebase_Repository {
    
    /**
     *
     * @return
     * @throws IOException
     */
    String getAccessToken() throws IOException;
    
   
    
}
