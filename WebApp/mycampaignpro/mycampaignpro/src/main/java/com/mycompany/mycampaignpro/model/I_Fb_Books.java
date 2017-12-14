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
@Table(name = "i_fb_books")
public class I_Fb_Books implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "i_fb_books_id_seq")
    @SequenceGenerator(name = "i_fb_books_id_seq", sequenceName = "i_fb_books_id_seq")
    private long i_fb_books_id;
    @Column(name = "i_user_id")
    private long i_user_id;
    @Column(name = "i_book_name")
    private String i_book_name;
    @Column(name = "i_book_description")
    private String i_book_description;

    public I_Fb_Books() {
        super();
    }
    
    public I_Fb_Books(long i_user_id, String i_book_name, String i_book_description) {
      
        this.i_user_id = i_user_id;
        this.i_book_name = i_book_name;
        this.i_book_description = i_book_description;
    }

    public long getI_fb_books_id() {
        return i_fb_books_id;
    }

    public void setI_fb_books_id(long i_fb_books_id) {
        this.i_fb_books_id = i_fb_books_id;
    }

    public long getI_user_id() {
        return i_user_id;
    }

    public void setI_user_id(long i_user_id) {
        this.i_user_id = i_user_id;
    }

    public String getI_book_name() {
        return i_book_name;
    }

    public void setI_book_name(String i_book_name) {
        this.i_book_name = i_book_name;
    }

    public String getI_book_description() {
        return i_book_description;
    }

    public void setI_book_description(String i_book_description) {
        this.i_book_description = i_book_description;
    }
        
}
