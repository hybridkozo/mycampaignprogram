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
 * @author ikozompolis
 */
@Entity
@Table(name = "i_interest_fb_pages")
public class I_Interest_Fb_Pages implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "i_interest_pages_id_seq")
    @SequenceGenerator(name = "i_interest_pages_id_seq", sequenceName = "i_interest_pages_id_seq")
    private long i_interest_pages_id;
    @Column(name = "i_user_id")
    private long i_user_id;
    @Column(name = "i_page_name")
    private String i_page_name;
    @Column(name = "i_page_description")
    private String i_page_description;

    public I_Interest_Fb_Pages() {
    }

    public I_Interest_Fb_Pages(long i_user_id, String i_page_name, String i_page_description) {
        this.i_user_id = i_user_id;
        this.i_page_name = i_page_name;
        this.i_page_description = i_page_description;
    }

    public long getI_interest_pages_id() {
        return i_interest_pages_id;
    }

    public void setI_interest_pages_id(long i_interest_pages_id) {
        this.i_interest_pages_id = i_interest_pages_id;
    }

    public long getI_user_id() {
        return i_user_id;
    }

    public void setI_user_id(long i_user_id) {
        this.i_user_id = i_user_id;
    }

    public String getI_page_name() {
        return i_page_name;
    }

    public void setI_page_name(String i_page_name) {
        this.i_page_name = i_page_name;
    }

    public String getI_page_description() {
        return i_page_description;
    }

    public void setI_page_description(String i_page_description) {
        this.i_page_description = i_page_description;
    }
    
    
    
}
