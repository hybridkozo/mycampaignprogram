/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.controller;

import com.mycompany.mycampaignpro.model.I_Location;
import com.mycompany.mycampaignpro.model.I_User;
import com.mycompany.mycampaignpro.model.responseObject.ResponseObject;
import com.mycompany.mycampaignpro.repository.I_Location_Repository;
import com.mycompany.mycampaignpro.repository.I_User_Repository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


/**
 *
 * @author user
 */
@RestController
public class ILocationController {
    
    @Autowired
    I_Location_Repository i_Location_Repository;
    
    @Autowired
    I_User_Repository i_User_Repository;
    
    @RequestMapping("/getAllLocations")
    public List<I_Location> getAllLocations(){
        return i_Location_Repository.findAll();
    }
    
    @RequestMapping("/saveLocation")
    public ResponseObject saveLocation(@RequestParam String i_username, String i_country_code, String i_country_name, String i_city_name, String i_prefecture, String i_department, String i_street_address,String i_postal_code){
        I_User i_User = i_User_Repository.find(i_username);
        I_Location i_Location;
        i_Location_Repository.save(i_Location = new I_Location(i_User.getI_user_id(), i_country_code, i_country_name, i_city_name, i_prefecture, i_department, i_street_address, i_postal_code));
        return new ResponseObject("Success",i_Location);
    }
    
    @RequestMapping("/findLocationByUsername")
    public List<I_Location> findByUsername(@RequestParam String username){
        I_User i_User= i_User_Repository.find(username);
        
        return i_Location_Repository.findByUserId(i_User.getI_user_id());
    }
    
    
}
