/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.model.responseObject;

/**
 *
 * @author user
 */
public class ResponseObject {
    private String status;
    private Object object;
    
    public ResponseObject(){
        
    }
    
    public ResponseObject(String status, Object object){
        this.status=status;
        this.object=object;
    }
    
    public ResponseObject(String status){
        this.status=status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }
    
    
    
}
