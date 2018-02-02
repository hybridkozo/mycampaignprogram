/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author ikozompolis
 */
@Entity
@Table(name = "sys_flow_node", catalog = "program", schema = "public")
@NamedQueries({
    @NamedQuery(name = "Sys_Flow_Node.findAll", query = "SELECT s FROM Sys_Flow_Node s")})
public class Sys_Flow_Node implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "sys_flow_node_id")
    private Long sys_flow_node_id;
    @Size(max = 2147483647)
    @Column(name = "sys_json_flow")
    private String sys_json_flow;
    @OneToMany(mappedBy = "sys_flow_node_id")
    private List<Sys_Campaign> sysCampaignList;

    public Sys_Flow_Node() {
    }

    public Sys_Flow_Node(Long sysFlowNodeId) {
        this.sys_flow_node_id = sysFlowNodeId;
    }

    public Long getSysFlowNodeId() {
        return sys_flow_node_id;
    }

    public void setSysFlowNodeId(Long sysFlowNodeId) {
        this.sys_flow_node_id = sysFlowNodeId;
    }

    public String getSysJsonFlow() {
        return sys_json_flow;
    }

    public void setSysJsonFlow(String sysJsonFlow) {
        this.sys_json_flow = sysJsonFlow;
    }

    public List<Sys_Campaign> getSysCampaignList() {
        return sysCampaignList;
    }

    public void setSysCampaignList(List<Sys_Campaign> sysCampaignList) {
        this.sysCampaignList = sysCampaignList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (sys_flow_node_id != null ? sys_flow_node_id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sys_Flow_Node)) {
            return false;
        }
        Sys_Flow_Node other = (Sys_Flow_Node) object;
        if ((this.sys_flow_node_id == null && other.sys_flow_node_id != null) || (this.sys_flow_node_id != null && !this.sys_flow_node_id.equals(other.sys_flow_node_id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.mycampaignpro.model.Sys_Flow_Node[ sysFlowNodeId=" + sys_flow_node_id + " ]";
    }
    
}
