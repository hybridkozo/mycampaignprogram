/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.controller;

import com.mycompany.mycampaignpro.model.Sys_Json_Filter;
import com.mycompany.mycampaignpro.model.Sys_Segment;
import com.mycompany.mycampaignpro.model.responseObject.ResponseObject;
import com.mycompany.mycampaignpro.model.responseObject.errorMessage;
import com.mycompany.mycampaignpro.repository.Sys_Json_Filter_Repository;
import com.mycompany.mycampaignpro.repository.Sys_Segment_Repository;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author user
 */
@RestController
public class SYSSegmentController {
    
    @Autowired
    Sys_Segment_Repository sys_Segment_Repository;
    
    @Autowired
    Sys_Json_Filter_Repository sys_Json_Filter_Repository;
    
    @RequestMapping("/getAllSegments")
    public List<Sys_Segment> getAllSegments(){
        return sys_Segment_Repository.findAll();
    }
    
    @RequestMapping("/getAllSegmentsDesc")
    public List<Sys_Segment> getAllSegmentDesc(){
        return sys_Segment_Repository.getAllDesc();
    }
    
    @RequestMapping("/getSegmentByName")
    public Sys_Segment getSegmentByNmae(@RequestParam String name){
        return sys_Segment_Repository.findSegmentByName(name);
    }
    
    @RequestMapping("/saveNewSegment")
    public ResponseObject saveNewSegment(@RequestBody String json) throws JSONException{
        String name,description;
        JSONObject jsonObject = new JSONObject(json);
        if(jsonObject.get("name")==null){
          name = null;  
        }else{
             name = (String) jsonObject.get("name");
        }
        
        if(jsonObject.get("description")==null){
          description = null;  
        }else{
          description = (String) jsonObject.get("description");
        }
        
        if("".equals(name)){
        return new ResponseObject("fail",new errorMessage("Invalid Name","Missing the name",""));
        
       }else if (sys_Segment_Repository.findSegmentByName(name)!=null){
          return new ResponseObject("fail",new errorMessage("Name Exists","Please give another name.","")); 
       }else{
           Sys_Json_Filter newJsonFilter = new Sys_Json_Filter(json);
           sys_Json_Filter_Repository.save(newJsonFilter);
           Sys_Segment newSegment = new Sys_Segment(name,description,newJsonFilter.getSys_json_id());
          sys_Segment_Repository.save(newSegment);
           
            return new ResponseObject("success",newSegment);
       }
       }
    
}
