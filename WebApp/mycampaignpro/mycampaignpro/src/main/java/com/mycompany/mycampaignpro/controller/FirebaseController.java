/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.controller;

import com.mycompany.mycampaignpro.repository.Firebase_Repository;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ikozompolis
 */
@RestController
public class FirebaseController {
    @Autowired
    Firebase_Repository firebase_Repository;
    
    @RequestMapping("/getFirebaseAccessToken")
    public String getAccessToken() throws IOException{
        return firebase_Repository.getAccessToken();
    }
    
}
