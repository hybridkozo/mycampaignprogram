package com.mycompany.mycampaignpro.model;

import com.mycompany.mycampaignpro.model.I_Education_Info;
import com.mycompany.mycampaignpro.model.I_Location;
import com.mycompany.mycampaignpro.model.I_Work_Info;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-02-06T23:39:04")
@StaticMetamodel(I_User.class)
public class I_User_ { 

    public static volatile SingularAttribute<I_User, String> i_first_name;
    public static volatile SingularAttribute<I_User, String> i_last_name;
    public static volatile SingularAttribute<I_User, String> i_username;
    public static volatile SingularAttribute<I_User, String> i_register_type;
    public static volatile SingularAttribute<I_User, Long> i_user_id;
    public static volatile SingularAttribute<I_User, String> i_email_address;
    public static volatile ListAttribute<I_User, I_Education_Info> i_Education_Infos;
    public static volatile ListAttribute<I_User, I_Location> I_Locations;
    public static volatile SingularAttribute<I_User, String> i_mobile_number;
    public static volatile SingularAttribute<I_User, String> i_password;
    public static volatile ListAttribute<I_User, I_Work_Info> i_Work_Infos;

}