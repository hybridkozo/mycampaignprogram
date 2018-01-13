/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.repository;

import com.mycompany.mycampaignpro.model.I_Work_Info;
import java.util.List;
import org.springframework.data.jpa.repository.Query;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author user
 */
public interface I_Work_Info_Repository extends CrudRepository<I_Work_Info, Long>{
    
   @Override
   List<I_Work_Info> findAll();
   
   
   @Query("SELECT p FROM I_Work_Info p WHERE p.i_user_id = :i_user_id")
    public List<I_Work_Info> findByUserId(@Param("i_user_id") Long i_user_id);
    
    @Query("SELECT DISTINCT p.i_work_employer FROM I_Work_Info p WHERE p.i_work_employer is not null")
    public List<String> returnDistinctWorkEmployers();
    
    
   @Query("SELECT DISTINCT p.i_work_position FROM I_Work_Info p WHERE p.i_work_position is not null")
    public List<String> returnDistinctWorkPositions();
    
}
