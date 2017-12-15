/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.repository;

import com.mycompany.mycampaignpro.model.I_Interest_Fb_Pages;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author ikozompolis
 */
public interface I_Interest_Fb_Pages_Repository extends CrudRepository<I_Interest_Fb_Pages, Long>{
    
    @Override
    List<I_Interest_Fb_Pages> findAll();
    
    @Query("SELECT p FROM I_Interest_Fb_Pages p WHERE p.i_user_id = :i_user_id")
    public List<I_Interest_Fb_Pages> findByUserId(@Param("i_user_id") Long i_user_id);
    
}
