/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.repository;


import com.mycompany.mycampaignpro.model.I_User;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author ikozompolis
 */
public interface I_User_Repository extends CrudRepository<I_User, Long>{
     
    @Override
    List<I_User> findAll();
    
    @Query("SELECT p FROM I_User p WHERE LOWER(p.i_username) = LOWER(:username)")
    public I_User find(@Param("username") String username);
        
}
