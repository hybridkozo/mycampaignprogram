/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


/**
 *
 * @author ikozompolis
 */
@Entity
@Table(name = "i_user")
public class I_User implements Serializable{
    
    //private static final long serialVersionUID = -3009157732242241606L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "i_user_i_user_id_seq")
    @SequenceGenerator(name = "i_user_i_user_id_seq", sequenceName = "i_user_i_user_id_seq")
    private long i_user_id;
    @Column(name="i_first_name")
    private String i_first_name;
    @Column(name="i_last_name")
    private String i_last_name;
    @Column(name="i_mobile_number")
    private String i_mobile_number;
    @Column(name="i_username")
    private String i_username;
    @Column(name="i_password")
    private String i_password;
    @Column(name="i_email_address")
    private String i_email_address;
    @Column(name="i_register_type")
    private String i_register_type;
    
    //@OneToMany( targetEntity=I_Location.class )
    @OneToMany(targetEntity=I_Location.class)
    @JoinColumn(name="i_user_id") // join column is in table for Order
    private List I_Locations;
    
    @OneToMany(targetEntity=I_Work_Info.class)
    @JoinColumn(name="i_user_id") // join column is in table for Order
    private List i_Work_Infos;
    
    @OneToMany(targetEntity=I_Education_Info.class)
    @JoinColumn(name="i_user_id") // join column is in table for Order
    private List i_Education_Infos;
    
    
    
    public I_User(){
        
    }
    
    public I_User(String i_username, String i_password){
        this.i_username=i_username;
        this.i_password=i_password;
    }
    public I_User(String i_first_name, String i_last_name, String i_mobile_number, String i_username, String i_password, String i_email_address,String i_register_type){
        this.i_username=i_username;
        this.i_password=i_password;
        this.i_email_address=i_email_address;
        this.i_first_name=i_first_name;
        this.i_last_name=i_last_name;
        this.i_mobile_number=i_mobile_number;
        this.i_register_type = i_register_type;
   
    }

    public long getI_user_id() {
        return i_user_id;
    }

    public void setI_user_id(long i_user_id) {
        this.i_user_id = i_user_id;
    }

    public String getI_first_name() {
        return i_first_name;
    }

    public void setI_first_name(String i_first_name) {
        this.i_first_name = i_first_name;
    }

    public String getI_last_name() {
        return i_last_name;
    }

    public void setI_last_name(String i_last_name) {
        this.i_last_name = i_last_name;
    }

    public String getI_mobile_number() {
        return i_mobile_number;
    }

    public void setI_mobile_number(String i_mobile_number) {
        this.i_mobile_number = i_mobile_number;
    }

    public String getI_username() {
        return i_username;
    }

    public void setI_username(String i_username) {
        this.i_username = i_username;
    }

    public String getI_password() {
        return i_password;
    }

    public void setI_password(String i_password) {
        this.i_password = i_password;
    }

    public String getI_email_address() {
        return i_email_address;
    }

    public void setI_email_address(String i_email_address) {
        this.i_email_address = i_email_address;
    }
    
    public String getI_register_type(){
        return i_register_type;
    }
    
    
    
    
    
}
