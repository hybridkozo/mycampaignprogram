/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.repository;

import com.mycompany.mycampaignpro.model.Sys_Campaign;
import java.util.List;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author ikozompolis
 */
public interface Sys_Campaign_Repository extends CrudRepository<Sys_Campaign, Long>{
    
  @Override
  List<Sys_Campaign> findAll();  
  
   
  @Query("SELECT p FROM Sys_Campaign p WHERE LOWER(p.sys_campaign_name) = LOWER(:name)")
  Sys_Campaign getCampagnByName(@Param("name") String name);
  
  @Query("SELECT p.sys_campaign_id, p.sys_campaign_name, p.sys_campaign_status, p.sys_campaign_type FROM Sys_Campaign p")
  List<Sys_Campaign> findAllCampaigns();
  
  @Modifying
  @Query("UPDATE Sys_Campaign p SET p.sys_campaign_status='ACTIVE' WHERE p.sys_campaign_id= :id")
  void updateStatusByID(@Param("id") Long id);
    
}
