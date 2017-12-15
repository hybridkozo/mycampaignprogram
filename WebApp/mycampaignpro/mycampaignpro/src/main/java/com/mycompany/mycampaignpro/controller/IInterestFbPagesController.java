/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.controller;

import com.mycompany.mycampaignpro.model.I_Interest_Fb_Pages;
import com.mycompany.mycampaignpro.model.I_User;
import com.mycompany.mycampaignpro.model.responseObject.ResponseObject;
import com.mycompany.mycampaignpro.repository.I_Interest_Fb_Pages_Repository;
import com.mycompany.mycampaignpro.repository.I_User_Repository;
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
public class IInterestFbPagesController {
    
    @Autowired
    I_Interest_Fb_Pages_Repository i_Interest_Fb_Pages_Repository;
    
    @Autowired
    I_User_Repository i_User_Repository;
    
    @RequestMapping("/getAllFbInterestPages")
    public List<I_Interest_Fb_Pages> getAllLocations(){
        return i_Interest_Fb_Pages_Repository.findAll();
    }
    
    @RequestMapping("/saveInterestFbPage")
    public ResponseObject saveLocation(@RequestParam String i_username, String i_page_name, String i_page_description){
        I_User i_User = i_User_Repository.find(i_username);
        I_Interest_Fb_Pages i_Interest_Fb_Pages;
        i_Interest_Fb_Pages_Repository.save(i_Interest_Fb_Pages = new I_Interest_Fb_Pages(i_User.getI_user_id(), i_page_name, i_page_description));
        return new ResponseObject("Success",i_Interest_Fb_Pages);
    }
    
    @RequestMapping("/findInterestFbPagesByUsername")
    public List<I_Interest_Fb_Pages> findByUsername(@RequestParam String username){
        I_User i_User= i_User_Repository.find(username);
        
        return i_Interest_Fb_Pages_Repository.findByUserId(i_User.getI_user_id());
    }
    
    
}
