/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.services.impl;

import com.mycompany.mycampaignpro.model.I_User;
import com.mycompany.mycampaignpro.model.responseObject.ResponseObject;
import com.mycompany.mycampaignpro.repository.I_User_Repository;
import com.mycompany.mycampaignpro.services.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ikozompolis
 */
@Service
public class UserServiceImpl implements UserService{
    
    @Autowired
    I_User_Repository iUserRepository;
    
    private List<I_User> userList;
    private I_User i_User=new I_User();

    @Override
    public String getUsernameValidation(String username) {
       userList=iUserRepository.findAll();
       String state="false";
       for (I_User i_user : userList){
           if(i_user.getI_username().equals(username)){
               state = "true";
               
           }
       }
       return state;
        
    }

    @Override
    public String getPasswordValidation(String password) {
        userList=iUserRepository.findAll();
       String state="false";
       for (I_User i_user : userList){
           if(i_user.getI_password().equals(password)){
               state = "true";
               
           }
       }
       return state;
    }

    @Override
    public ResponseObject validateAccount(String username, String password) {
           userList=iUserRepository.findAll();
          String state="false";
       for (I_User i_user : userList){
           if(i_user.getI_password().equals(password)&&i_user.getI_username().equals(username)){
               this.i_User=i_user;
               state = "true";
               
           }
       }
       
       
       return new ResponseObject(state,this.i_User);
    }
    
}
