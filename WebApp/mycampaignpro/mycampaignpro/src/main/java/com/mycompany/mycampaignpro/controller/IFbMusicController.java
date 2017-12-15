/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.controller;

import com.mycompany.mycampaignpro.model.I_Fb_Music;
import com.mycompany.mycampaignpro.model.I_User;
import com.mycompany.mycampaignpro.model.responseObject.ResponseObject;
import com.mycompany.mycampaignpro.repository.I_Fb_Music_Repository;
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
public class IFbMusicController {
    
    @Autowired
    I_Fb_Music_Repository i_Fb_Music_Repository;
    
    @Autowired
    I_User_Repository i_User_Repository;
    
    @RequestMapping("/getAllFbMusic")
    public List<I_Fb_Music> getAllLocations(){
        return i_Fb_Music_Repository.findAll();
    }
    
    @RequestMapping("/saveFbMusic")
    public ResponseObject saveLocation(@RequestParam String i_username, String i_music_title){
        I_User i_User = i_User_Repository.find(i_username);
        I_Fb_Music i_Fb_Music;
        i_Fb_Music_Repository.save(i_Fb_Music = new I_Fb_Music(i_User.getI_user_id(), i_music_title));
        return new ResponseObject("Success",i_Fb_Music);
    }
    
    @RequestMapping("/findFbMusicByUsername")
    public List<I_Fb_Music> findByUsername(@RequestParam String username){
        I_User i_User= i_User_Repository.find(username);
        
        return i_Fb_Music_Repository.findByUserId(i_User.getI_user_id());
    }
    
}
