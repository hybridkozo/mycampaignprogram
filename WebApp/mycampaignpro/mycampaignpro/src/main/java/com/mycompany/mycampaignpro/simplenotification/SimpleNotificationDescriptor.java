/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.simplenotification;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.mycompany.mycampaignpro.EmailJob;
import com.mycompany.mycampaignpro.JobDescriptor;
import com.mycompany.mycampaignpro.TriggerDescriptor;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import static org.quartz.JobBuilder.newJob;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.Trigger;

/**
 *
 * @author ikozompolis
 */
@Data
public class SimpleNotificationDescriptor {
    
    	// TODO add boolean fields for HTML and Attachments
	
        @NotBlank
	private String name;
	private String group;
	private Long id;
	
	private Map<String, Object> data = new LinkedHashMap<>();
	@JsonProperty("triggers")
	private List<TriggerDescriptor> triggerDescriptors = new ArrayList<>();
        
        
        public SimpleNotificationDescriptor setName(final String name) {
		this.name = name;
		return this;
	}

	public SimpleNotificationDescriptor setGroup(final String group) {
		this.group = group;
		return this;
	}

	public SimpleNotificationDescriptor setId(final Long id) {
		this.id = id;
		return this;
	}
        
        public SimpleNotificationDescriptor setTriggerDescriptors(final List<TriggerDescriptor> triggerDescriptors) {
		this.triggerDescriptors = triggerDescriptors;
		return this;
	}

	
	/**
	 * Convenience method for building Triggers of Job
	 * 
	 * @return Triggers for this JobDetail
	 */
	@JsonIgnore
	public Set<Trigger> buildTriggers() {
		Set<Trigger> triggers = new LinkedHashSet<>();
		for (TriggerDescriptor triggerDescriptor : triggerDescriptors) {
			triggers.add(triggerDescriptor.buildTrigger());
		}

		return triggers;
	}

	/**
	 * Convenience method that builds a JobDetail
	 * 
	 * @return the JobDetail built from this descriptor
	 */
	public JobDetail buildJobDetail() {
		// @formatter:off
		JobDataMap jobDataMap = new JobDataMap(getData());
		jobDataMap.put("id", id);
		return newJob(SimpleNotificationJob.class)
                .withIdentity(getName(), getGroup())
                .usingJobData(jobDataMap)
                .build();
		// @formatter:on
	}

	/**
	 * Convenience method that builds a descriptor from JobDetail and Trigger(s)
	 * 
	 * @param jobDetail
	 *            the JobDetail instance
	 * @param triggersOfJob
	 *            the Trigger(s) to associate with the Job
	 * @return the JobDescriptor
	 */
	@SuppressWarnings("unchecked")
	public static SimpleNotificationDescriptor buildDescriptor(JobDetail jobDetail, List<? extends Trigger> triggersOfJob) {
		// @formatter:off
		List<TriggerDescriptor> triggerDescriptors = new ArrayList<>();

		for (Trigger trigger : triggersOfJob) {
		    triggerDescriptors.add(TriggerDescriptor.buildDescriptor(trigger));
		}
		
		return new SimpleNotificationDescriptor()
				.setName(jobDetail.getKey().getName())
				.setGroup(jobDetail.getKey().getGroup())
				.setId(jobDetail.getJobDataMap().getLong("id"))
				
				// .setData(jobDetail.getJobDataMap().getWrappedMap())
				.setTriggerDescriptors(triggerDescriptors);
		// @formatter:on
	}
    
}
