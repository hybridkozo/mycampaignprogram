/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.repository;

import com.mycompany.mycampaignpro.model.I_Fb_Books;
import com.mycompany.mycampaignpro.model.I_Fb_Events;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author ikozompolis
 */
public interface I_Fb_Events_Repository extends CrudRepository<I_Fb_Events, Long>{
    
    @Override
    List<I_Fb_Events> findAll();
    
    @Query("SELECT p FROM I_Fb_Events p WHERE p.i_user_id = :i_user_id")
    public List<I_Fb_Events> findByUserId(@Param("i_user_id") Long i_user_id);
    
    
    @Query("SELECT DISTINCT p.i_event_name FROM I_Fb_Events p WHERE p.i_event_name is not null and p.i_event_name!='' and p.i_event_name!='null'")
    public List<String> getDistinctEvents();
    
}
