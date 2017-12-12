/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.services;

import com.mycompany.mycampaignpro.model.responseObject.ResponseObject;

/**
 *
 * @author ikozompolis
 */
public interface UserService {
    String getUsernameValidation(String username);
    String getPasswordValidation(String password);
    ResponseObject validateAccount(String username, String password);
}
