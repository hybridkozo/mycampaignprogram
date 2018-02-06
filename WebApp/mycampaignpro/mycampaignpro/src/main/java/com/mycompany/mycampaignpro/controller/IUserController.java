/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.controller;

import com.mycompany.mycampaignpro.model.I_User;
import com.mycompany.mycampaignpro.model.responseObject.ResponseObject;
import com.mycompany.mycampaignpro.repository.I_User_Repository;
import com.mycompany.mycampaignpro.services.impl.UserServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ikozompolis
 */
@RestController
public class IUserController {
    
    @Autowired
    I_User_Repository iUserRepository;
    
    @Autowired
    UserServiceImpl userServiceImpl;
    
    
  
    
    
    @RequestMapping("/getAllUsers")
    public List<I_User> getAllUsers(){
        
        return iUserRepository.findAll();
    }
    
     @RequestMapping("/getByUsername")
    public ResponseObject getUserByUsername(@RequestParam String username){
        I_User i_User=iUserRepository.find(username);
        
        
        if (i_User==null){
            
            ResponseObject responseObject = new ResponseObject("fail", i_User);
            return responseObject;
        }else {
            ResponseObject responseObject = new ResponseObject("success",i_User);
            return responseObject;
        }
    }
    @RequestMapping("saveUserCredentials")
    public String saveUserCredentials(@RequestParam String username, String password){
        iUserRepository.save(new I_User(username, password));
        return "Done";
    }
    
    @RequestMapping("/validateUsername")
    public String validateUsername(@RequestParam String username){
        return userServiceImpl.getUsernameValidation(username);
    }
    
    @RequestMapping("/validatePassword")
    public String validatePassword(@RequestParam String password){
        return userServiceImpl.getPasswordValidation(password);
    }
    
    @RequestMapping("/validateAccount")
    public ResponseObject validateAccount(@RequestBody I_User i_User){
        return userServiceImpl.validateAccount(i_User.getI_username(),i_User.getI_password());
    }
    
    @RequestMapping("/register")
    public ResponseObject registerUser(@RequestBody I_User i_User){
      iUserRepository.save(new I_User(i_User.getI_first_name(),i_User.getI_last_name(),i_User.getI_mobile_number(),i_User.getI_username(),i_User.getI_password(),i_User.getI_email_address(),i_User.getI_register_type()));
      return new ResponseObject("success",i_User);
    }
    
}
