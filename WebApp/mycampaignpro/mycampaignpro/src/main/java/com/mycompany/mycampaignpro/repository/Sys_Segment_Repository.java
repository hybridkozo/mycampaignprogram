/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.repository;

import com.mycompany.mycampaignpro.model.I_Work_Info;
import com.mycompany.mycampaignpro.model.Sys_Segment;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author user
 */
public interface Sys_Segment_Repository extends CrudRepository<Sys_Segment, Long>{
    
    @Override
    List<Sys_Segment> findAll();
    
     @Query("SELECT p FROM Sys_Segment p WHERE p.sys_segment_name = :name")
    public Sys_Segment findSegmentByName(@Param("name") String name);
   
    
}
