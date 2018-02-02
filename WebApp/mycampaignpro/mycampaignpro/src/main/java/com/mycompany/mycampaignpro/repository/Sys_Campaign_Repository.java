/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.repository;

import com.mycompany.mycampaignpro.model.Sys_Campaign;
import java.util.List;
import org.springframework.data.repository.CrudRepository;

/**
 *
 * @author ikozompolis
 */
public interface Sys_Campaign_Repository extends CrudRepository<Sys_Campaign, Long>{
    
  @Override
  List<Sys_Campaign> findAll();  
    
}
