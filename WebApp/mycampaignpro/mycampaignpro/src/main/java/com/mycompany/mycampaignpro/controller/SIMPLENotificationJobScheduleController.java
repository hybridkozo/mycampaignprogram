/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.controller;


import com.mycompany.mycampaignpro.services.impl.SimpleNotificationService;
import com.mycompany.mycampaignpro.simplenotification.SimpleNotificationDescriptor;
import lombok.RequiredArgsConstructor;
import static org.springframework.http.HttpStatus.CREATED;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author user
 */
@RestController
@RequestMapping("/simple/notification/api/v1.0")
@RequiredArgsConstructor
public class SIMPLENotificationJobScheduleController {
    
        private final SimpleNotificationService simpleNotificationService;
    
        @PostMapping(path = "/groups/{group}/jobs")
	public ResponseEntity<SimpleNotificationDescriptor> createJob(@PathVariable String group, @RequestBody SimpleNotificationDescriptor descriptor) {
		return new ResponseEntity<>(simpleNotificationService.createJob(group, descriptor), CREATED);
	}
    
}
