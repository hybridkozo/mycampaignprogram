/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro;

/**
 *
 * @author user
 */
public class responder implements HelloListener{

    @Override
    public void someoneSaidHello() {
        System.out.println("I fine thank you.");
    }
    
}
