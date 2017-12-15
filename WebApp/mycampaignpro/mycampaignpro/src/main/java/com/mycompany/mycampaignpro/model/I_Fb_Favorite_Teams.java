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
@Table(name = "i_fb_favorite_teams")
public class I_Fb_Favorite_Teams implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "i_fb_favorite_teams_id_seq")
    @SequenceGenerator(name = "i_fb_favorite_teams_id_seq", sequenceName = "i_fb_favorite_teams_id_seq")
    private long i_fb_favorite_teams_id;
    @Column(name = "i_user_id")
    private long i_user_id;
    @Column(name = "i_team_name")
    private String i_team_name;

    public I_Fb_Favorite_Teams() {
    }

    public I_Fb_Favorite_Teams(long i_user_id, String i_team_name) {
        this.i_user_id = i_user_id;
        this.i_team_name = i_team_name;
    }

    public long getI_fb_favorite_teams_id() {
        return i_fb_favorite_teams_id;
    }

    public void setI_fb_favorite_teams_id(long i_fb_favorite_teams_id) {
        this.i_fb_favorite_teams_id = i_fb_favorite_teams_id;
    }

    public long getI_user_id() {
        return i_user_id;
    }

    public void setI_user_id(long i_user_id) {
        this.i_user_id = i_user_id;
    }

    public String getI_team_name() {
        return i_team_name;
    }

    public void setI_team_name(String i_team_name) {
        this.i_team_name = i_team_name;
    }    
    
}
