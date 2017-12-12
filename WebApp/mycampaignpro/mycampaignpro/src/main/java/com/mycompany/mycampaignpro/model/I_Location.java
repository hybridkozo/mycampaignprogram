/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 * @author user
 */
@Entity
@Table(name = "i_location")
public class I_Location implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "i_location_id_seq")
    @SequenceGenerator(name = "i_location_id_seq", sequenceName = "i_location_id_seq")
    private long i_location_id;
    @Column(name = "i_user_id")
    private long i_user_id;
    @Column(name = "i_country_code")
    private String i_country_code;
    @Column(name = "i_country_name")
    private String i_country_name;
    @Column(name = "i_city_name")
    private String i_city_name;
    @Column(name = "i_prefecture")
    private String i_prefecture;
    @Column(name = "i_department")
    private String i_department;
    @Column(name = "i_street_address")
    private String i_street_address;
    @Column(name = "i_postal_code")
    private String i_postal_code;
    
    
    
    public I_Location(){
        super();
    }
    
    public I_Location(long i_user_id, String i_country_code, String i_country_name, String i_city_name, String i_prefecture, String i_department, String i_street_address,String i_postal_code){
        super();
        this.i_user_id = i_user_id;
        this.i_country_code = i_country_code;
        this.i_country_name = i_country_name;
        this.i_city_name = i_city_name;
        this.i_prefecture = i_prefecture;
        this.i_department = i_department;
        this.i_street_address = i_street_address;
        this.i_postal_code = i_postal_code;
        
    }

    public long getI_location_id() {
        return i_location_id;
    }

    public void setI_location_id(long i_location_id) {
        this.i_location_id = i_location_id;
    }

    public long getI_user_id() {
        return i_user_id;
    }

    public void setI_user_id(long i_user_id) {
        this.i_user_id = i_user_id;
    }

    public String getI_country_code() {
        return i_country_code;
    }

    public void setI_country_code(String i_country_code) {
        this.i_country_code = i_country_code;
    }

    public String getI_country_name() {
        return i_country_name;
    }

    public void setI_country_name(String i_country_name) {
        this.i_country_name = i_country_name;
    }

    public String getI_city_name() {
        return i_city_name;
    }

    public void setI_city_name(String i_city_name) {
        this.i_city_name = i_city_name;
    }

    public String getI_prefecture() {
        return i_prefecture;
    }

    public void setI_prefecture(String i_prefecture) {
        this.i_prefecture = i_prefecture;
    }

    public String getI_street_address() {
        return i_street_address;
    }

    public void setI_street_address(String i_street_address) {
        this.i_street_address = i_street_address;
    }

    public String getI_postal_code() {
        return i_postal_code;
    }

    public void setI_postal_code(String i_postal_code) {
        this.i_postal_code = i_postal_code;
    }
  
    
    
}
