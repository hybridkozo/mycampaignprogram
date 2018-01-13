/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.controller;

import com.mycompany.mycampaignpro.model.I_Fb_Books;
import com.mycompany.mycampaignpro.model.I_User;
import com.mycompany.mycampaignpro.model.responseObject.ResponseObject;
import com.mycompany.mycampaignpro.repository.I_Fb_Books_Repository;
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
public class IFbBooksController {
    
    @Autowired
    I_User_Repository i_User_Repository;
    
    @Autowired
    I_Fb_Books_Repository i_Fb_Books_Repository;
    
    @RequestMapping("/getAllFbBooks")
    public List<I_Fb_Books> getAllFbBooks(){
        return i_Fb_Books_Repository.findAll();
    } 
    
    @RequestMapping("/newFbBook")
    public ResponseObject newFbBook(@RequestParam String username, String name, String description){
        I_User i_User= i_User_Repository.find(username);
       I_Fb_Books i_Fb_Books  = new I_Fb_Books(i_User.getI_user_id(),name,description);
        i_Fb_Books_Repository.save(i_Fb_Books);
        
        return new ResponseObject("success", i_Fb_Books);
    }
    
    @RequestMapping("/findBooksByUsername")
    public List<I_Fb_Books> findByUsername(@RequestParam String username){
        I_User i_User= i_User_Repository.find(username);
        
        return i_Fb_Books_Repository.findByUserId(i_User.getI_user_id());
    }
    
    @RequestMapping("/getDistinctFavoriteBooks")
    public List<String> getDistinctFavoriteBooks(){   
        return i_Fb_Books_Repository.getDistinctFavoriteBooks();
    }
    
    
    
    
}
