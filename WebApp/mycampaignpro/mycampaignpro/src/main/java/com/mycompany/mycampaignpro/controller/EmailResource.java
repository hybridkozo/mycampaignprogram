/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.controller;

import com.mycompany.mycampaignpro.JobDescriptor;
import com.mycompany.mycampaignpro.services.impl.EmailService;
import java.util.Optional;
import static org.springframework.http.HttpStatus.CREATED;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;



import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/v1.0")
@RequiredArgsConstructor
public class EmailResource {
	private final EmailService emailService;
        

	@PostMapping(path = "/groups/{group}/jobs")
	public ResponseEntity<JobDescriptor> createJob(@PathVariable String group, @RequestBody JobDescriptor descriptor) {
		return new ResponseEntity<>(emailService.createJob(group, descriptor), CREATED);
	}

	@GetMapping(path = "/groups/{group}/jobs/{name}")
	public Optional<JobDescriptor> findJob(@PathVariable String group, @PathVariable String name) {
		return emailService.findJob(group, name);
//                        .map(ResponseEntity::ok)
//			.orElse(ResponseEntity.notFound().build());
	}

	@PutMapping(path = "/groups/{group}/jobs/{name}")
	public ResponseEntity<Void> updateJob(@PathVariable String group, @PathVariable String name, @RequestBody JobDescriptor descriptor) {
		emailService.updateJob(group, name, descriptor);
		return ResponseEntity.noContent().build();
	}

	@DeleteMapping(path = "/groups/{group}/jobs/{name}")
	public ResponseEntity<Void> deleteJob(@PathVariable String group, @PathVariable String name) {
		emailService.deleteJob(group, name);
		return ResponseEntity.noContent().build();
	}

	@PatchMapping(path = "/groups/{group}/jobs/{name}/pause")
	public ResponseEntity<Void> pauseJob(@PathVariable String group, @PathVariable String name) {
		emailService.pauseJob(group, name);
		return ResponseEntity.noContent().build();
	}

	@PatchMapping(path = "/groups/{group}/jobs/{name}/resume")
	public ResponseEntity<Void> resumeJob(@PathVariable String group, @PathVariable String name) {
		emailService.resumeJob(group, name);
		return ResponseEntity.noContent().build();
	}
}
