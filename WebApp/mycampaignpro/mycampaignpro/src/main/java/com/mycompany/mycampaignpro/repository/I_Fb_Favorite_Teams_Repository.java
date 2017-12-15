/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.repository;

import com.mycompany.mycampaignpro.model.I_Fb_Favorite_Teams;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author ikozompolis
 */
public interface I_Fb_Favorite_Teams_Repository extends CrudRepository<I_Fb_Favorite_Teams, Long>{
    
    @Override
    List<I_Fb_Favorite_Teams> findAll();
    
    @Query("SELECT p FROM I_Fb_Favorite_Teams p WHERE p.i_user_id = :i_user_id")
    public List<I_Fb_Favorite_Teams> findByUserId(@Param("i_user_id") Long i_user_id);
    
}
