/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.model;

import java.io.Serializable;
import java.util.Objects;
import javax.json.Json;
import javax.persistence.CascadeType;
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
@Table(name = "sys_json_filter")
public class Sys_Json_Filter implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "sys_json_id_seq")
    @SequenceGenerator(name = "sys_json_id_seq", sequenceName = "sys_json_id_seq")
    private long sys_json_id;
    @Column(name = "sys_json")
    private String sys_json;
    
  // @OneToOne(mappedBy = "sys_json_filter", cascade = CascadeType.ALL, 
  //  fetch = FetchType.LAZY, optional = false)
  //  private Sys_Segment sys_Segment;

    public Sys_Json_Filter(String sys_json) {
        this.sys_json = sys_json;
    }

    public Sys_Json_Filter() {
        super();
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 41 * hash + (int) (this.sys_json_id ^ (this.sys_json_id >>> 32));
        hash = 41 * hash + Objects.hashCode(this.sys_json);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Sys_Json_Filter other = (Sys_Json_Filter) obj;
        return true;
    }

    @Override
    public String toString() {
        return "Sys_Json_Filter{" + "sys_json_id=" + sys_json_id + ", sys_json=" + sys_json + '}';
    }

    public long getSys_json_id() {
        return sys_json_id;
    }

    public void setSys_json_id(long sys_json_id) {
        this.sys_json_id = sys_json_id;
    }

    public String getSys_json() {
        return sys_json;
    }

    public void setSys_json(String sys_json) {
        this.sys_json = sys_json;
    }

    public Sys_Json_Filter(long sys_json_id, String sys_json) {
        this.sys_json_id = sys_json_id;
        this.sys_json = sys_json;
    }
}
