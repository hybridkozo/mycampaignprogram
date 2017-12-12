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
@Table(name = "i_work_info")
public class I_Work_Info implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "i_work_id_seq")
    @SequenceGenerator(name = "i_work_id_seq", sequenceName = "i_work_id_seq")
    private long i_work_id;
    @Column(name = "i_user_id")
    private long i_user_id;
    @Column(name = "i_work_employer")
    private String i_work_employer;
    @Column(name = "i_work_position")
    private String i_work_position;
    
    public I_Work_Info(){
        super();
    }
    
    public I_Work_Info(long i_user_id, String i_work_employer, String i_work_position){
        this.i_user_id = i_user_id;
        this.i_work_employer = i_work_employer;
        this.i_work_position = i_work_position;
    }

    public long getI_work_id() {
        return i_work_id;
    }

    public void setI_work_id(long i_work_id) {
        this.i_work_id = i_work_id;
    }

    public long getI_user_id() {
        return i_user_id;
    }

    public void setI_user_id(long i_user_id) {
        this.i_user_id = i_user_id;
    }

    public String getI_work_employer() {
        return i_work_employer;
    }

    public void setI_work_employer(String i_work_employer) {
        this.i_work_employer = i_work_employer;
    }

    public String getI_work_position() {
        return i_work_position;
    }

    public void setI_work_position(String i_work_position) {
        this.i_work_position = i_work_position;
    }
    
    
    
}
