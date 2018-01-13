/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.controller;

import com.mycompany.mycampaignpro.model.I_Education_Info;
import com.mycompany.mycampaignpro.model.I_User;
import com.mycompany.mycampaignpro.model.responseObject.ResponseObject;
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
    public ResponseObject saveEducationInfo(@RequestParam String i_username, String i_edu_degree, String i_edu_school, String i_edu_type, String i_edu_year){
        
       I_User i_User = i_User_Repository.find(i_username);
       I_Education_Info i_Education_Info = new I_Education_Info(i_User.getI_user_id(),i_edu_degree,i_edu_school,i_edu_type,i_edu_year);
       i_Education_Repository.save(i_Education_Info);  
     
       return new ResponseObject("success",i_Education_Info);
        
    }
    
    @RequestMapping("/findEducationByUsername")
    public List<I_Education_Info> findByUsername(@RequestParam String username){
        I_User i_User= i_User_Repository.find(username);
        
        return i_Education_Repository.findByUserId(i_User.getI_user_id());
    }
    
    
      @RequestMapping("/getDistinctEduSchool")
    public List<String> getDistinctEduSchool(){   
        return i_Education_Repository.getDistinctEduSchool();
    }
    
      @RequestMapping("/getDistinctEduDegree")
    public List<String> getDistinctEduDegree(){   
        return i_Education_Repository.getDistinctEduDegree();
    }
    
      @RequestMapping("/getDistinctEduYear")
    public List<String> getDistinctEduYear(){   
        return i_Education_Repository.getDistinctEduYear();
    }
    
}
