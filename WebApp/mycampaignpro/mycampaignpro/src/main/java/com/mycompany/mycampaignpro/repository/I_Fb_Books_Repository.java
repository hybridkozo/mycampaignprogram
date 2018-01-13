/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.repository;

import com.mycompany.mycampaignpro.model.I_Fb_Books;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author ikozompolis
 */
public interface I_Fb_Books_Repository extends CrudRepository<I_Fb_Books, Long>{
    
    @Override
    List<I_Fb_Books> findAll();
    
    
    @Query("SELECT p FROM I_Fb_Books p WHERE p.i_user_id = :i_user_id")
    public List<I_Fb_Books> findByUserId(@Param("i_user_id") Long i_user_id);
    
    @Query("SELECT DISTINCT p.i_book_name FROM I_Fb_Books p WHERE p.i_book_name is not null")
    public List<String> getDistinctFavoriteBooks();
    
}
