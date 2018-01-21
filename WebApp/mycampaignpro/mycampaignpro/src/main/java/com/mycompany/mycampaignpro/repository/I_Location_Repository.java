/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.repository;

import com.mycompany.mycampaignpro.model.I_Location;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author user
 */
public interface I_Location_Repository extends CrudRepository<I_Location, Long>{
    
    @Override
    List<I_Location> findAll();
    
    @Query("SELECT p FROM I_Location p WHERE p.i_user_id = :i_user_id")
    public List<I_Location> findByUserId(@Param("i_user_id") Long i_user_id);
    
    @Query("SELECT DISTINCT p.i_country_name FROM I_Location p WHERE p.i_country_name!='null' and p.i_country_name is not null")
    public List<String> getDistinctCountyNames();
    
     @Query("SELECT DISTINCT p.i_department FROM I_Location p WHERE p.i_department!='null' and p.i_department is not null")
    public List<String> getDistinctDepartmentNames();
    
     @Query("SELECT DISTINCT p.i_prefecture FROM I_Location p WHERE p.i_prefecture!='null' and p.i_prefecture is not null")
    public List<String> getDistinctPrefectureNames();
    
    @Query("SELECT DISTINCT p.i_city_name FROM I_Location p WHERE p.i_city_name!='null' and p.i_city_name is not null")
    public List<String> getDistinctCityNames();
    
     @Query("SELECT DISTINCT p.i_postal_code FROM I_Location p WHERE p.i_postal_code!='null' and p.i_postal_code is not null")
    public List<String> getDistinctPostalCodes();
    
    @Query("SELECT DISTINCT p.i_department FROM I_Location p WHERE p.i_department is not null and p.i_country_name in(:data)")
    public List<String> returnDistinctLocationDepartmentViaFilter(@Param("data") List<String> data);
    
    @Query("SELECT DISTINCT p.i_prefecture FROM I_Location p WHERE p.i_prefecture is not null and p.i_department in(:data)")
    public List<String> returnDistinctLocationPrefectureViaFilter(@Param("data") List<String> data);
    
    @Query("SELECT DISTINCT p.i_city_name FROM I_Location p WHERE p.i_city_name is not null and p.i_prefecture in(:data)")
    public List<String> returnDistinctLocationCityViaFilter(@Param("data") List<String> data);
    
    @Query("SELECT DISTINCT p.i_postal_code FROM I_Location p WHERE p.i_postal_code is not null and p.i_city_name in(:data)")
    public List<String> returnDistinctLocationPostalViaFilter(@Param("data") List<String> data);
    
}
