/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 * @author user
 */
@Entity
@Table(name = "sys_segment")
public class Sys_Segment implements Serializable{
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "sys_segment_id_seq")
    @SequenceGenerator(name = "sys_segment_id_seq", sequenceName = "sys_segment_id_seq")
    private long sys_segment_id;
    @Column(name = "sys_segment_name")
    private String sys_segment_name;
    @Column(name = "sys_segment_description")
    private String sys_segment_description;
    @Column(name = "sys_json_id")
    private long sys_json_id;
    
   // @OneToOne(fetch = FetchType.LAZY)
   // @JoinColumn(name = "sys_json_id")
   // private Sys_Json_Filter sys_Json_Filter;
    
    

    public Sys_Segment() {
        super();
    }

    public Sys_Segment(String sys_segment_name, String sys_segment_description, long sys_json_id) {
        this.sys_segment_name = sys_segment_name;
        this.sys_segment_description = sys_segment_description;
        this.sys_json_id = sys_json_id;
    }

    public long getSys_segment_id() {
        return sys_segment_id;
    }

    public void setSys_segment_id(long sys_segment_id) {
        this.sys_segment_id = sys_segment_id;
    }

    public String getSys_segment_name() {
        return sys_segment_name;
    }

    public void setSys_segment_name(String sys_segment_name) {
        this.sys_segment_name = sys_segment_name;
    }

    public String getSys_segment_description() {
        return sys_segment_description;
    }

    public void setSys_segment_description(String sys_segment_description) {
        this.sys_segment_description = sys_segment_description;
    }

    public long getSys_json_id() {
        return sys_json_id;
    }

    public void setSys_json_id(long sys_json_id) {
        this.sys_json_id = sys_json_id;
    }
    
    
    
}
