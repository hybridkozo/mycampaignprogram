package com.mycompany.mycampaignpro.model;

import com.mycompany.mycampaignpro.model.Sys_Campaign;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-02-06T23:39:04")
@StaticMetamodel(Sys_Flow_Node.class)
public class Sys_Flow_Node_ { 

    public static volatile SingularAttribute<Sys_Flow_Node, String> sys_json_flow;
    public static volatile SingularAttribute<Sys_Flow_Node, Long> sys_flow_node_id;
    public static volatile ListAttribute<Sys_Flow_Node, Sys_Campaign> sysCampaignList;

}