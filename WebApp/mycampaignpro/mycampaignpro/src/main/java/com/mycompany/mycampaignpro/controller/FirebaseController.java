/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.controller;

import com.mycompany.mycampaignpro.repository.Firebase_Repository;
import com.mycompany.mycampaignpro.repository.Firebase_Send_Message_Repository;
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
    
    @Autowired
    Firebase_Send_Message_Repository firebase_Send_Message_Repository;
    
    @RequestMapping("/getFirebaseAccessToken")
    public String getAccessToken() throws IOException{
        
        
        return firebase_Send_Message_Repository.sentMessageToUser(firebase_Repository.getAccessToken(), "ccFeq0wgzSk:APA91bFv1ygxoKV168aok72ug4cMIriUlR8YklSjY0R-7g3pfW2gQ8sZEAER7EWsfxwcjAOudMHHoiDIwvulw25INNEDthUo62InVauok23DqpXnbgADsmd4JCy-ebTjgeElOE-MIQGP", "Test Message", "Aek is the best team");
    }
    
}
