/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.controller;

import com.mycompany.mycampaignpro.model.I_Fb_Favorite_Teams;
import com.mycompany.mycampaignpro.model.I_User;
import com.mycompany.mycampaignpro.model.responseObject.ResponseObject;
import com.mycompany.mycampaignpro.repository.I_Fb_Favorite_Teams_Repository;
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
public class IFbFavoriteTeamsController {
    
    @Autowired
    I_Fb_Favorite_Teams_Repository i_Fb_Favorite_Teams_Repository;
    
    @Autowired
    I_User_Repository i_User_Repository;
    
    @RequestMapping("/getAllFbFavoriteTeams")
    public List<I_Fb_Favorite_Teams> getAllLocations(){
        return i_Fb_Favorite_Teams_Repository.findAll();
    }
    
    @RequestMapping("/saveFbFavoriteTeam")
    public ResponseObject saveLocation(@RequestParam String i_username, String i_team_name){
        I_User i_User = i_User_Repository.find(i_username);
        I_Fb_Favorite_Teams i_Fb_Favorite_Teams;
        i_Fb_Favorite_Teams_Repository.save(i_Fb_Favorite_Teams = new I_Fb_Favorite_Teams(i_User.getI_user_id(),i_team_name));
        return new ResponseObject("Success",i_Fb_Favorite_Teams);
    }
    
    @RequestMapping("/findFbFavoriteTeamsByUsername")
    public List<I_Fb_Favorite_Teams> findByUsername(@RequestParam String username){
        I_User i_User= i_User_Repository.find(username);
        
        return i_Fb_Favorite_Teams_Repository.findByUserId(i_User.getI_user_id());
    }
    
    
     @RequestMapping("/getDistinctFavoriteSportTeams")
    public List<String> getDistinctFavoriteSportTeams(){   
        return i_Fb_Favorite_Teams_Repository.getDistinctFavoriteSportTeams();
    }
    
}
