/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.controller;

import com.mycompany.mycampaignpro.model.Sys_Campaign;
import com.mycompany.mycampaignpro.model.Sys_Json_Filter;
import com.mycompany.mycampaignpro.model.Sys_Segment;
import com.mycompany.mycampaignpro.model.responseObject.ResponseObject;
import com.mycompany.mycampaignpro.model.responseObject.errorMessage;
import com.mycompany.mycampaignpro.repository.Sys_Campaign_Repository;
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
 * @author ikozompolis
 */
@RestController
public class SYSCampaignController {
    
    @Autowired
    Sys_Campaign_Repository sys_Campaign_Repository;
    
    @RequestMapping("/getAllCampaigns")
    public List<Sys_Campaign>getAllCampaigns(){
        return sys_Campaign_Repository.findAllCampaigns();
    }
    
     @RequestMapping("/getAllDataCampaigns")
    public List<Sys_Campaign>getAllDataCampaigns(){
        return sys_Campaign_Repository.findAll();
    }
    
    @RequestMapping("/saveNewCampaign")
    public ResponseObject saveNewCampaign(@RequestBody String json) throws JSONException{
        String name,description,datetime,segmentId,title,body;
        JSONObject jsonObject = new JSONObject(json);
        name = (String) jsonObject.get("campaignName");  
        description = (String) jsonObject.get("campaignDescription");
        segmentId = (String) jsonObject.get("segmentId");
        datetime = (String) jsonObject.get("datetime");
        title = (String) jsonObject.get("notificationTitle");
        body = (String) jsonObject.get("notificationBody");
       
        if(sys_Campaign_Repository.getCampagnByName(name)!=null){
            return new ResponseObject("fail",new errorMessage("Invalid Message","The Campaign name exists",""));
       }else{
            Sys_Campaign sys_Campaign = new Sys_Campaign("SIMPLE_NOTIFICATION","INACTIVE",name,description,json,Long.valueOf(segmentId));
            sys_Campaign_Repository.save(sys_Campaign);
            return new ResponseObject("success",sys_Campaign);
        }
        
    }
    
    @RequestMapping("/saveEditCampaign")
    public ResponseObject saveEditCampaign(@RequestBody String json) throws JSONException{
        String name,description,datetime,segmentId,title,body,id;
        JSONObject jsonObject = new JSONObject(json);
        name = (String) jsonObject.get("campaignName");  
        description = (String) jsonObject.get("campaignDescription");
        segmentId = (String) jsonObject.get("segmentId");
        datetime = (String) jsonObject.get("datetime");
        title = (String) jsonObject.get("notificationTitle");
        body = (String) jsonObject.get("notificationBody");
        id = (String) jsonObject.get("campaignId");
       
        if(sys_Campaign_Repository.getCampagnByNameExceptThis(name, Long.valueOf(id))!= null){
            return new ResponseObject("fail",new errorMessage("Invalid Message","The Campaign name exists",""));
       }else{
            Sys_Campaign sys_Campaign = sys_Campaign_Repository.findOne(Long.valueOf(id));
            sys_Campaign.setSys_campaign_type("SIMPLE_NOTIFICATION");
            sys_Campaign.setSys_campaign_status("INACTIVE");
            sys_Campaign.setSys_campaign_name(name);
            sys_Campaign.setSys_campaign_description(description);
            sys_Campaign.setSys_json_data(json);
           
            sys_Campaign.setSys_segment_id(Long.valueOf(segmentId));
            
            sys_Campaign_Repository.save(sys_Campaign);
            return new ResponseObject("success",sys_Campaign);
        }
        
    }
    
    @RequestMapping("/updateCampaignStatus")
    public void updateCampaignStatus(@RequestParam Long id){
       Sys_Campaign sys_Campaign = sys_Campaign_Repository.findOne(id);
       sys_Campaign.setSys_campaign_status("ACTIVE");
       sys_Campaign_Repository.save(sys_Campaign);
    }
    
    @RequestMapping("/getCampaignDataById")
    public Sys_Campaign getCampaignDataById(@RequestParam Long id){
        
        return sys_Campaign_Repository.findOne(id);
        
    }
    
    @RequestMapping("/getStartDateOfCampaign")
    public String getStartDateOfCampaign(@RequestParam Long id) throws JSONException{
        Sys_Campaign sys_Campaign = sys_Campaign_Repository.findOne(id);
        JSONObject jsonObject = new JSONObject(sys_Campaign.getSys_json_data());
        return jsonObject.getString("datetime");
    }
    
}
    
