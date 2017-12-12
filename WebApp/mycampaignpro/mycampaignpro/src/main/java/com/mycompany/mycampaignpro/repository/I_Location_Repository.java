/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.repository;

import com.mycompany.mycampaignpro.model.I_Location;
import java.util.List;
import org.springframework.data.repository.CrudRepository;

/**
 *
 * @author user
 */
public interface I_Location_Repository extends CrudRepository<I_Location, Long>{
    
    @Override
    List<I_Location> findAll();
    
}
