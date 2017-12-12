/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.repository;

import com.mycompany.mycampaignpro.model.I_Work_Info;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

/**
 *
 * @author user
 */
public interface I_Work_Info_Repository extends CrudRepository<I_Work_Info, Long>{
    
   @Override
   List<I_Work_Info> findAll();
    
}
