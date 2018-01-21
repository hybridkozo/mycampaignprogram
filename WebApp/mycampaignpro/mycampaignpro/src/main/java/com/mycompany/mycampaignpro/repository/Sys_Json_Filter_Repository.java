/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.repository;

import com.mycompany.mycampaignpro.model.Sys_Json_Filter;
import java.util.List;
import org.springframework.data.repository.CrudRepository;

/**
 *
 * @author user
 */
public interface Sys_Json_Filter_Repository extends CrudRepository<Sys_Json_Filter, Long>{
    
    @Override
    List<Sys_Json_Filter> findAll();
    
}
