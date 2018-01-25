/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author user
 */
public class initier {
    private List<HelloListener> listeners = new ArrayList<HelloListener>();
    public void addListeners(HelloListener lis){
        
        listeners.add(lis);
        
    }
    
    public void sayHello(){
        System.out.println("Hello John. How are you?");
        
        for(HelloListener h1 : listeners){
            h1.someoneSaidHello();
        }
    }
}
