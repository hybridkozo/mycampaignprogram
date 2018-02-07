/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.simplenotification;

import com.mycompany.mycampaignpro.jsontoquery.JsonToQuery;
import com.mycompany.mycampaignpro.model.Sys_Campaign;
import com.mycompany.mycampaignpro.model.Sys_Json_Filter;
import com.mycompany.mycampaignpro.model.Sys_Segment;
import com.mycompany.mycampaignpro.repository.Firebase_Repository;
import com.mycompany.mycampaignpro.repository.Firebase_Send_Message_Repository;
import com.mycompany.mycampaignpro.repository.Sys_Campaign_Repository;
import com.mycompany.mycampaignpro.repository.Sys_Json_Filter_Repository;
import com.mycompany.mycampaignpro.repository.Sys_Segment_Repository;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.JsonObject;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONException;
import org.json.JSONObject;
import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;


/**
 *
 * @author ikozompolis
 */
@Slf4j
public class SimpleNotificationJob implements Job{
    private String query;
    private String title;
    private String body;
    
    
    
    @Autowired
    Firebase_Repository firebase_Repository;
    
    @Autowired
    Firebase_Send_Message_Repository firebase_Send_Message_Repository;
    
    @Autowired
    Sys_Campaign_Repository sys_Campaign_Repository;
    @Autowired
    Sys_Segment_Repository sys_Segment_Repository;
    @Autowired
    Sys_Json_Filter_Repository sys_Json_Filter_Repository;

    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {

        log.info("Job Simple Notification triggered");
		JobDataMap map = context.getMergedJobDataMap();
		Long id = map.getLong("id");
                Sys_Campaign sys_campaign = sys_Campaign_Repository.findOne(id);
                Sys_Segment sys_Segment = sys_Segment_Repository.findOne(sys_campaign.getSys_segment_id());
                Sys_Json_Filter sys_Json_Filter = sys_Json_Filter_Repository.findOne(sys_Segment.getSys_json_id());
                JsonToQuery jsonToQuery = new JsonToQuery();
        try {
            JSONObject jsonCampaignData = new JSONObject(sys_campaign.getSys_json_data());
            title = jsonCampaignData.getString("notificationTitle");
            body = jsonCampaignData.getString("notificationBody");
        } catch (JSONException ex) {
            Logger.getLogger(SimpleNotificationJob.class.getName()).log(Level.SEVERE, null, ex);
        }
                
        try {
            this.query = jsonToQuery.getSegmentUsers(sys_Json_Filter.getSys_json());
            System.out.println(this.query);
            
        } catch (JSONException ex) {
            Logger.getLogger(SimpleNotificationJob.class.getName()).log(Level.SEVERE, null, ex);
        }
        
     String jdbcUrl= "jdbc:postgresql://localhost:5432/program";
   
     String username= "postgres";
    
     String password= "giannis2669";
    
    try (Connection conn = DriverManager.getConnection(jdbcUrl, username, password); 
        Statement stmt = conn.createStatement(); 
        ResultSet rs = stmt.executeQuery(this.query);) {
      
      int row = 0;
      while (rs.next()) {
        
          firebase_Send_Message_Repository.sentMessageToUser(firebase_Repository.getAccessToken(), rs.getString(11),title , body);
          
        System.out.println("----------Row " + (++row) + " ------------");
        System.out.println("USER_ID=" + rs.getString(1));
        System.out.println("CREATION_DATE=" + rs.getString(2));
        System.out.println("LAST_UPDATE_DATE=" + rs.getString(3));
        System.out.println("FIRST_NAME=" + rs.getString(4));
        System.out.println("LAST_NAME=" + rs.getString(5));
        System.out.println("MOBILE_NUMBER=" + rs.getString(6));
        System.out.println("USERNAME=" + rs.getString(7));
        System.out.println("PASSWORD=" + rs.getString(8));
        System.out.println("EMAIL_ADDRESS=" + rs.getString(9));
        System.out.println("EMAIL_ADDRESS=" + rs.getString(11));
        System.out.println();
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }   catch (IOException ex) {
            Logger.getLogger(SimpleNotificationJob.class.getName()).log(Level.SEVERE, null, ex);
        }
                
                
    }
    
}
