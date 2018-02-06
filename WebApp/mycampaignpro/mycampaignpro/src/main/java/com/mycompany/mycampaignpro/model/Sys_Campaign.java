/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

/**
 *
 * @author ikozompolis
 */
@Entity
@Table(name = "sys_campaign", catalog = "program", schema = "public")
@NamedQueries({
    @NamedQuery(name = "Sys_Campaign.findAll", query = "SELECT s FROM Sys_Campaign s")})
public class Sys_Campaign implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "sys_campaign_id")
    private Long sys_campaign_id;

    @Size(max = 2147483647)
    @Column(name = "sys_campaign_type")
    private String sys_campaign_type;
    @Size(max = 2147483647)
    @Column(name = "sys_campaign_status")
    private String sys_campaign_status;
    @Size(max = 2147483647)
    @Column(name = "sys_campaign_name")
    private String sys_campaign_name;
    @Size(max = 2147483647)
    @Column(name = "sys_campaign_description")
    private String sys_campaign_description;
    @Size(max = 2147483647)
    @Column(name = "sys_json_data")
    private String sys_json_data;
    @Column(name = "sys_segment_id")
    private Long sys_segment_id;
    @JoinColumn(name = "sys_flow_node_id", referencedColumnName = "sys_flow_node_id")
    @ManyToOne
    private Sys_Flow_Node sys_flow_node_id;

    public Sys_Campaign() {
    }

    public Sys_Campaign(String sys_campaign_type, String sys_campaign_status, String sys_campaign_name, String sys_campaign_description, String sys_json_data, Long sys_segment_id) {
        this.sys_campaign_type = sys_campaign_type;
        this.sys_campaign_status = sys_campaign_status;
        this.sys_campaign_name = sys_campaign_name;
        this.sys_campaign_description = sys_campaign_description;
        this.sys_json_data = sys_json_data;
        this.sys_segment_id = sys_segment_id;
    }

    public Long getSys_segment_id() {
        return sys_segment_id;
    }

    public void setSys_segment_id(Long sys_segment_id) {
        this.sys_segment_id = sys_segment_id;
    }

    public Sys_Flow_Node getSys_flow_node_id() {
        return sys_flow_node_id;
    }

    public void setSys_flow_node_id(Sys_Flow_Node sys_flow_node_id) {
        this.sys_flow_node_id = sys_flow_node_id;
    }

    

   
    
    

    public Long getSys_campaign_id() {
        return sys_campaign_id;
    }

    public void setSys_campaign_id(Long sys_campaign_id) {
        this.sys_campaign_id = sys_campaign_id;
    }


    public String getSys_campaign_type() {
        return sys_campaign_type;
    }

    public void setSys_campaign_type(String sys_campaign_type) {
        this.sys_campaign_type = sys_campaign_type;
    }

    public String getSys_campaign_status() {
        return sys_campaign_status;
    }

    public void setSys_campaign_status(String sys_campaign_status) {
        this.sys_campaign_status = sys_campaign_status;
    }

    public String getSys_campaign_name() {
        return sys_campaign_name;
    }

    public void setSys_campaign_name(String sys_campaign_name) {
        this.sys_campaign_name = sys_campaign_name;
    }

    public String getSys_campaign_description() {
        return sys_campaign_description;
    }

    public void setSys_campaign_description(String sys_campaign_description) {
        this.sys_campaign_description = sys_campaign_description;
    }

    public String getSys_json_data() {
        return sys_json_data;
    }

    public void setSys_json_data(String sys_json_data) {
        this.sys_json_data = sys_json_data;
    }

    public Sys_Flow_Node getSysFlowNodeId() {
        return sys_flow_node_id;
    }

    public void setSysFlowNodeId(Sys_Flow_Node sysFlowNodeId) {
        this.sys_flow_node_id = sysFlowNodeId;
    }
    
    

    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (sys_campaign_id != null ? sys_campaign_id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sys_Campaign)) {
            return false;
        }
        Sys_Campaign other = (Sys_Campaign) object;
        if ((this.sys_campaign_id == null && other.sys_campaign_id != null) || (this.sys_campaign_id != null && !this.sys_campaign_id.equals(other.sys_campaign_id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.mycampaignpro.model.Sys_Campaign[ sysCampaignId=" + sys_campaign_id + " ]";
    }
    
}
