/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.controller;

import com.mycompany.mycampaignpro.model.Sys_Campaign;
import com.mycompany.mycampaignpro.repository.Sys_Campaign_Repository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ikozompolis
 */
@RestController
public class SYSCampaignController {
    
    @Autowired
    Sys_Campaign_Repository sys_Campaign_Repository;
    
    @RequestMapping("/getAllCampaigns")
    public List<Sys_Campaign>getAllCampaigns(){
        return sys_Campaign_Repository.findAll();
    }
    
}
