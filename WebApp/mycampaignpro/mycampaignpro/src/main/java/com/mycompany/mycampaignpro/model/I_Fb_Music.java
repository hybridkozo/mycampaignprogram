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
@Table(name = "i_fb_music")
public class I_Fb_Music implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "i_fb_music_id_seq")
    @SequenceGenerator(name = "i_fb_music_id_seq", sequenceName = "i_fb_music_id_seq")
    private long i_fb_music_id;
    @Column(name = "i_user_id")
    private long i_user_id;
    @Column(name = "i_music_title")
    private String i_music_title;

    public I_Fb_Music() {
    }

    public I_Fb_Music(long i_user_id, String i_music_title) {
        this.i_user_id = i_user_id;
        this.i_music_title = i_music_title;
    }

    public long getI_fb_music_id() {
        return i_fb_music_id;
    }

    public void setI_fb_music_id(long i_fb_music_id) {
        this.i_fb_music_id = i_fb_music_id;
    }

    public long getI_user_id() {
        return i_user_id;
    }

    public void setI_user_id(long i_user_id) {
        this.i_user_id = i_user_id;
    }

    public String getI_music_title() {
        return i_music_title;
    }

    public void setI_music_title(String i_music_title) {
        this.i_music_title = i_music_title;
    }
    
    
}
