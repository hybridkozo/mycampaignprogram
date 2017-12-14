/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.controller;

import com.mycompany.mycampaignpro.model.I_Fb_Events;
import com.mycompany.mycampaignpro.model.I_User;
import com.mycompany.mycampaignpro.model.responseObject.ResponseObject;
import com.mycompany.mycampaignpro.repository.I_Fb_Events_Repository;
import com.mycompany.mycampaignpro.repository.I_User_Repository;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ikozompolis
 */
@RestController
public class IFbEventsController {
    
    @Autowired
    I_Fb_Events_Repository i_Fb_Events_Repository;
    
    @Autowired
    I_User_Repository i_User_Repository;
    
    @RequestMapping("/getAllFbEvents")
    public List<I_Fb_Events> getAllFbEvents(){
        return i_Fb_Events_Repository.findAll();
    }
    
    @RequestMapping("/newFbEvent")
    public ResponseObject newFbEvent(@RequestParam String username,String i_event_name, String i_event_description, Date i_event_start_date){
        I_User i_User = i_User_Repository.find(username);
        I_Fb_Events i_Fb_Events = new I_Fb_Events(i_User.getI_user_id(),i_event_name, i_event_description, i_event_start_date);
        i_Fb_Events_Repository.save(i_Fb_Events);       
        return new ResponseObject("success",i_Fb_Events);     
    }
    
     @RequestMapping("/findEventsByUsername")
    public List<I_Fb_Events> findByUsername(@RequestParam String username){
        I_User i_User= i_User_Repository.find(username);
        
        return i_Fb_Events_Repository.findByUserId(i_User.getI_user_id());
    }
    
    
}
