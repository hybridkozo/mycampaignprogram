/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro;

import static org.springframework.util.CollectionUtils.isEmpty;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class EmailJob implements Job {


	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		log.info("Job triggered to send emails");
		JobDataMap map = context.getMergedJobDataMap();
		sendEmail(map);
		log.info("Job completed");
	}
	
	@SuppressWarnings("unchecked")
	private void sendEmail(JobDataMap map) {
		String subject 	   = map.getString("subject");
		String messageBody = map.getString("messageBody");
		List<String> to    = (List<String>) map.get("to");
		List<String> cc	   = (List<String>) map.get("cc");
		List<String> bcc   = (List<String>) map.get("bcc");
                
                System.out.println(subject);
		

	}
}