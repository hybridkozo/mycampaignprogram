/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.controller;

import com.mycompany.mycampaignpro.model.I_User;
import com.mycompany.mycampaignpro.model.I_Work_Info;
import com.mycompany.mycampaignpro.model.responseObject.ResponseObject;
import com.mycompany.mycampaignpro.repository.I_User_Repository;
import com.mycompany.mycampaignpro.repository.I_Work_Info_Repository;
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
public class IWorkInfoController {
    
    @Autowired
    I_Work_Info_Repository i_Work_Info_Repository;
    
    @Autowired
    I_User_Repository i_User_Repository;
    
    @RequestMapping("/getAllWorkInfo")
    public List<I_Work_Info> getAllWorkInfo(){
        
        return i_Work_Info_Repository.findAll();  
    }
    
    @RequestMapping("/newWorkInfo")
    public ResponseObject addWorkInfo(@RequestParam String i_username, String i_work_employer, String i_work_position){
        
        if(i_work_employer == null || i_work_position == null){
            return new ResponseObject("fail",null);
        }else {
            I_User i_User = new I_User();
            i_User = i_User_Repository.find(i_username);
            i_Work_Info_Repository.save(new I_Work_Info(i_User.getI_user_id(), i_work_employer, i_work_position));
            return new ResponseObject("success",null);
        }
    }
    
}
