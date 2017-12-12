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
import static org.hibernate.type.TypeFactory.serializable;

/**
 *
 * @author user
 */
@Entity
@Table(name="i_education_info")
public class I_Education_Info implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "i_education_id_seq")
    @SequenceGenerator(name = "i_education_id_seq", sequenceName = "i_education_id_seq")
    private long i_education_id;
    @Column(name = "i_user_id")
    private long i_user_id;
    @Column(name = "i_edu_degree")
    private String i_edu_degree;
    @Column(name = "i_edu_school")
    private String i_edu_school;
    @Column(name = "i_edu_type")
    private String i_edu_type;
    @Column(name = "i_edu_year")
    private String i_edu_year;
    
    
    public I_Education_Info(){
        super();
    }
    
      public I_Education_Info(long i_user_id, String i_edu_degree, String i_edu_school,String i_edu_type, String i_edu_year){
        
        this.i_user_id = i_user_id;
        this.i_edu_degree = i_edu_degree;
        this.i_edu_school = i_edu_school;
        this.i_edu_type = i_edu_type;
        this.i_edu_year = i_edu_year;
    }

    public long getI_education_id() {
        return i_education_id;
    }

    public void setI_education_id(long i_education_id) {
        this.i_education_id = i_education_id;
    }

    public long getI_user_id() {
        return i_user_id;
    }

    public void setI_user_id(long i_user_id) {
        this.i_user_id = i_user_id;
    }

    public String getI_edu_degree() {
        return i_edu_degree;
    }

    public void setI_edu_degree(String i_edu_degree) {
        this.i_edu_degree = i_edu_degree;
    }

    public String getI_edu_school() {
        return i_edu_school;
    }

    public void setI_edu_school(String i_edu_school) {
        this.i_edu_school = i_edu_school;
    }

    public String getI_edu_type() {
        return i_edu_type;
    }

    public void setI_edu_type(String i_edu_type) {
        this.i_edu_type = i_edu_type;
    }

    public String getI_edu_year() {
        return i_edu_year;
    }

    public void setI_edu_year(String i_edu_year) {
        this.i_edu_year = i_edu_year;
    }
    
}
