/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 * @author ikozompolis
 */
@Entity
@Table(name = "i_fb_events")
public class I_Fb_Events {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "i_fb_events_id_seq")
    @SequenceGenerator(name = "i_fb_events_id_seq", sequenceName = "i_fb_events_id_seq")
    private long i_fb_events_id;
    @Column(name = "i_user_id")
    private long i_user_id;
    @Column(name = "i_event_name")
    private String i_event_name;
    @Column(name = "i_event_description")
    private String i_event_description;
    @Column(name = "i_event_start_date")
    private Date i_event_start_date;

    public I_Fb_Events() {
    }

    public I_Fb_Events(long i_user_id, String i_event_name, String i_event_description, Date i_event_start_date) {
        this.i_user_id = i_user_id;
        this.i_event_name = i_event_name;
        this.i_event_description = i_event_description;
        this.i_event_start_date = i_event_start_date;
    }
    
    

    public long getI_fb_events_id() {
        return i_fb_events_id;
    }

    public void setI_fb_events_id(long i_fb_events_id) {
        this.i_fb_events_id = i_fb_events_id;
    }

    public long getI_user_id() {
        return i_user_id;
    }

    public void setI_user_id(long i_user_id) {
        this.i_user_id = i_user_id;
    }

    public String getI_event_name() {
        return i_event_name;
    }

    public void setI_event_name(String i_event_name) {
        this.i_event_name = i_event_name;
    }

    public String getI_event_description() {
        return i_event_description;
    }

    public void setI_event_description(String i_event_description) {
        this.i_event_description = i_event_description;
    }

    public Date getI_event_start_date() {
        return i_event_start_date;
    }

    public void setI_event_start_date(Date i_event_start_date) {
        this.i_event_start_date = i_event_start_date;
    }
    
    
    
}
