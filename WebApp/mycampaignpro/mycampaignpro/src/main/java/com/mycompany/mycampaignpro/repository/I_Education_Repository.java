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
    
    @Query("SELECT DISTINCT p.i_edu_school FROM I_Education_Info p WHERE p.i_edu_school is not null")
    public List<String> getDistinctEduSchool();
    
    @Query("SELECT DISTINCT p.i_edu_degree FROM I_Education_Info p WHERE p.i_edu_degree is not null")
    public List<String> getDistinctEduDegree();
    
    @Query("SELECT DISTINCT p.i_edu_year FROM I_Education_Info p WHERE p.i_edu_year is not null")
    public List<String> getDistinctEduYear();
    
    
    @Query("SELECT DISTINCT p.i_edu_degree FROM I_Education_Info p WHERE p.i_edu_degree is not null and p.i_edu_school in(:data)")
    public List<String> returnDistinctEduDegreeViaFilter(@Param("data") List<String> data);
    
     @Query("SELECT DISTINCT p.i_edu_year FROM I_Education_Info p WHERE p.i_edu_year is not null and p.i_edu_degree in(:data)")
    public List<String> returnDistinctEduYearViaFilter(@Param("data") List<String> data);
    
    
    
}
