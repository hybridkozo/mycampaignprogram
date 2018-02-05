/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.simplenotification;

import com.mycompany.mycampaignpro.model.Sys_Campaign;
import com.mycompany.mycampaignpro.repository.Sys_Campaign_Repository;
import static java.lang.Math.log;
import static java.rmi.server.LogStream.log;
import lombok.extern.slf4j.Slf4j;
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
    
    @Autowired
    Sys_Campaign_Repository sys_Campaign_Repository;

    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {

        log.info("Job Simple Notification triggered");
		JobDataMap map = context.getMergedJobDataMap();
		Long id = map.getLong("id");
                Sys_Campaign sys_campaign = sys_Campaign_Repository.findOne(id);
                
                System.out.println("The campaign data is: " + sys_campaign.getSys_campaign_name() + "\n" + sys_campaign.getSys_campaign_description());
                
    }
    
}
