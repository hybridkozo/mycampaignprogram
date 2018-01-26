/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro;

import java.time.format.DateTimeFormatter;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 *
 * @author ikozompolis
 */
//@Component
public class ScheduledTasks {
  // private static final Logger logger = LoggerFactory.getLogger(ScheduledTasks.class);
   private static final DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
   
   @Scheduled(fixedRate = 2000)
   public void scheduleTaskWithFixedRate(){
       System.out.println("FixedRate every 2 second");
   }
   
   @Scheduled(fixedDelay = 2000)
   public void scheduleTaskWithFixedDelay(){
      System.out.println("FixedDelay every 2 second"); 
      try {
        TimeUnit.SECONDS.sleep(5);
    } catch (InterruptedException ex) {
        
        throw new IllegalStateException(ex);
    }
   }
   
   @Scheduled(fixedRate = 2000, initialDelay = 5000)
   public void scheduleTaskWithInitialDelay(){
      System.out.println("Only first excecution will delay 5 seconds. Then it will excecuted every 2 seconds.");   
   }
   public void scheduleTaskWithCronExpression(){}
}
