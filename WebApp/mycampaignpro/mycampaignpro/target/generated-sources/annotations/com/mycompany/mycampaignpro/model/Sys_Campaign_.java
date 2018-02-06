package com.mycompany.mycampaignpro.model;

import com.mycompany.mycampaignpro.model.Sys_Flow_Node;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-02-06T23:39:04")
@StaticMetamodel(Sys_Campaign.class)
public class Sys_Campaign_ { 

    public static volatile SingularAttribute<Sys_Campaign, String> sys_json_data;
    public static volatile SingularAttribute<Sys_Campaign, String> sys_campaign_name;
    public static volatile SingularAttribute<Sys_Campaign, String> sys_campaign_description;
    public static volatile SingularAttribute<Sys_Campaign, Sys_Flow_Node> sys_flow_node_id;
    public static volatile SingularAttribute<Sys_Campaign, Long> sys_campaign_id;
    public static volatile SingularAttribute<Sys_Campaign, String> sys_campaign_type;
    public static volatile SingularAttribute<Sys_Campaign, String> sys_campaign_status;
    public static volatile SingularAttribute<Sys_Campaign, Long> sys_segment_id;

}