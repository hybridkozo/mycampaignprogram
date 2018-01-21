/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.controller;

import com.mycompany.mycampaignpro.model.Sys_Json_Filter;
import com.mycompany.mycampaignpro.model.responseObject.ResponseObject;
import com.mycompany.mycampaignpro.repository.Sys_Json_Filter_Repository;
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
public class SYSJsonFilterController {
    
    @Autowired
    Sys_Json_Filter_Repository sys_Json_Filter_Repository;
    
    
    @RequestMapping("/getAllJsonFilters")
    public List<Sys_Json_Filter> getAllFilters(){
        
        return sys_Json_Filter_Repository.findAll();
    }
    
    @RequestMapping("/saveNewJsonFilter")
    public ResponseObject saveJsonFilter(@RequestParam String jsonFilter){
        
        Sys_Json_Filter sys_Json_Filter = new Sys_Json_Filter(jsonFilter);
        sys_Json_Filter_Repository.save(sys_Json_Filter);
        return new ResponseObject("success",sys_Json_Filter);
    }
    
}
