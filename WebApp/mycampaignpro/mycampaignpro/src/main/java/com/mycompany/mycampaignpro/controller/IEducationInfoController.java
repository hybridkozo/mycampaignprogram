/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.controller;

import com.mycompany.mycampaignpro.model.I_Education_Info;
import com.mycompany.mycampaignpro.model.I_User;
import com.mycompany.mycampaignpro.repository.I_Education_Repository;
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
public class IEducationInfoController {
    
    @Autowired
    I_Education_Repository i_Education_Repository;
    
    @Autowired
    I_User_Repository i_User_Repository;
    
    @RequestMapping("/getAllEducationInfo")
    public List<I_Education_Info> getAllEducationInfo(){
        return i_Education_Repository.findAll();
    }
    
    @RequestMapping("/saveEducationInfo")
    public String saveEducationInfo(@RequestParam String i_username, String i_edu_degree, String i_edu_school, String i_edu_type, String i_edu_year){
        
       I_User i_User = i_User_Repository.find(i_username);
       i_Education_Repository.save(new I_Education_Info(i_User.getI_user_id(),i_edu_degree,i_edu_school,i_edu_type,i_edu_year));       
       
       return "success";
        
    }
    
}
