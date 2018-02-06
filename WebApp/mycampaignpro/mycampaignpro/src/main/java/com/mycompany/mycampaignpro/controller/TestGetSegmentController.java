/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author user
 */
@RestController
public class TestGetSegmentController {
    
    @RequestMapping("/getAllSegmentUsers")
    public void getAllsegmentUsers(){
    String jdbcUrl = "jdbc:postgresql://localhost:5432/program";
    String username = "postgres";
    String password = "giannis2669";
    String sql = "select * from i_user";
    
    try (Connection conn = DriverManager.getConnection(jdbcUrl, username, password); 
        Statement stmt = conn.createStatement(); 
        ResultSet rs = stmt.executeQuery(sql);) {
      
      int row = 0;
      while (rs.next()) {
        System.out.println("----------Row " + (++row) + " ------------");
        System.out.println("EMP_ID=" + rs.getString(1));
        System.out.println("NAME=" + rs.getString(2));
        System.out.println("DOB=" + rs.getString(3));
        System.out.println("EMAIL=" + rs.getString(4));
        System.out.println("DEPT=" + rs.getString(5));
        System.out.println();
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
        
        
      }
    

