/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.repository;

import com.mycompany.mycampaignpro.model.I_Education_Info;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author user
 */
public interface I_Education_Repository extends CrudRepository<I_Education_Info, Long>{
    
    
    @Override
    List<I_Education_Info> findAll();
    
    @Query("SELECT p FROM I_Education_Info p WHERE p.i_user_id = :i_user_id")
    public List<I_Education_Info> findByUserId(@Param("i_user_id") Long i_user_id);
    
    
}
