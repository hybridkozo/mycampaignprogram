/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycampaignpro.jsontoquery;


import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author ikozompolis
 */
public class JsonToQuery {
    
    
    private String country, department, prefecture, city, postal, employer, position, school, degree, year, books, teams, events, music, pages;
    private String query;
    
    public JsonToQuery(){
        
    }
    
    public String getSegmentUsers(String jsonData) throws JSONException{
        int len;
        JSONObject jsonObject = new JSONObject(jsonData);
        JSONArray jsonArray;
        
        this.country = jsonObject.getString("country");
        
        if("null".equals(this.country)){
            this.country=null;
        }else{
            this.country = "";
            jsonArray = jsonObject.getJSONArray("country");
            len = jsonArray.length();
            for(int i=0;i<len;i++){
                if (len==1){
                   this.country="'" + jsonArray.getString(i) + "'";
                }else{
                    if(i+1>=len){
                        this.country+="'" + jsonArray.getString(i) + "'";
                    
                    }else{
                        this.country+="'" + jsonArray.getString(i) + "', ";
                    }
                }
            }
        }
        
        this.department = jsonObject.getString("department");
        
        if("null".equals(this.department)){
            this.department=null;
        }else{
            this.department = "";
            jsonArray = jsonObject.getJSONArray("department");
            len = jsonArray.length();
            for(int i=0;i<len;i++){
                if (len==1){
                   this.department="'" + jsonArray.getString(i) + "'";
                }else{
                    if(i+1>=len){
                        this.department+="'" + jsonArray.getString(i) + "'";
                    
                    }else{
                        this.department+="'" + jsonArray.getString(i) + "', ";
                    }
                }
            }
        }
            
        this.prefecture = jsonObject.getString("prefecture");
        
         if("null".equals(this.prefecture)){
            this.prefecture=null;
        }else{
            this.prefecture = "";
            jsonArray = jsonObject.getJSONArray("prefecture");
            len = jsonArray.length();
            for(int i=0;i<len;i++){
                if (len==1){
                   this.prefecture="'" + jsonArray.getString(i) + "'";
                }else{
                    if(i+1>=len){
                        this.prefecture+="'" + jsonArray.getString(i) + "'";
                    
                    }else{
                        this.prefecture+="'" + jsonArray.getString(i) + "', ";
                    }
                }
            }
        }
         
         
        this.city = jsonObject.getString("city");
        
        if("null".equals(this.city)){
            this.city=null;
        }else{
            this.city = "";
            jsonArray = jsonObject.getJSONArray("city");
            len = jsonArray.length();
            for(int i=0;i<len;i++){
                if (len==1){
                   this.city="'" + jsonArray.getString(i) + "'";
                }else{
                    if(i+1>=len){
                        this.city+="'" + jsonArray.getString(i) + "'";
                    
                    }else{
                        this.city+="'" + jsonArray.getString(i) + "', ";
                    }
                }
            }
        }
        
        this.postal = jsonObject.getString("postal");
        
        if("null".equals(this.postal)){
            this.postal=null;
        }else{
            this.postal = "";
            jsonArray = jsonObject.getJSONArray("postal");
            len = jsonArray.length();
            for(int i=0;i<len;i++){
                if (len==1){
                   this.postal="'" + jsonArray.getString(i) + "'";
                }else{
                    if(i+1>=len){
                        this.postal+="'" + jsonArray.getString(i) + "'";
                    
                    }else{
                        this.postal+="'" + jsonArray.getString(i) + "', ";
                    }
                }
            }
        }
        
        this.employer = jsonObject.getString("employer");
        
        if("null".equals(this.employer)){
            this.employer=null;
        }else{
            this.employer = "";
            jsonArray = jsonObject.getJSONArray("employer");
            len = jsonArray.length();
            for(int i=0;i<len;i++){
                if (len==1){
                   this.employer="'" + jsonArray.getString(i) + "'";
                }else{
                    if(i+1>=len){
                        this.employer+="'" + jsonArray.getString(i) + "'";
                    
                    }else{
                        this.employer+="'" + jsonArray.getString(i) + "', ";
                    }
                }
            }
        }
        
        this.position = jsonObject.getString("position");
        
        if("null".equals(this.position)){
            this.position=null;
        }else{
            this.position = "";
            jsonArray = jsonObject.getJSONArray("position");
            len = jsonArray.length();
            for(int i=0;i<len;i++){
                if (len==1){
                   this.position="'" + jsonArray.getString(i) + "'";
                }else{
                    if(i+1>=len){
                        this.position+="'" + jsonArray.getString(i) + "'";
                    
                    }else{
                        this.position+="'" + jsonArray.getString(i) + "', ";
                    }
                }
            }
        }
        
        
        this.school = jsonObject.getString("school");
        
        if("null".equals(this.school)){
            this.school=null;
        }else{
            this.school = "";
            jsonArray = jsonObject.getJSONArray("school");
            len = jsonArray.length();
            for(int i=0;i<len;i++){
                if (len==1){
                   this.school="'" + jsonArray.getString(i) + "'";
                }else{
                    if(i+1>=len){
                        this.school+="'" + jsonArray.getString(i) + "'";
                    
                    }else{
                        this.school+="'" + jsonArray.getString(i) + "', ";
                    }
                }
            }
        }
        
        
        this.degree = jsonObject.getString("degree");
        
        if("null".equals(this.degree)){
            this.degree=null;
        }else{
            this.degree = "";
            jsonArray = jsonObject.getJSONArray("degree");
            len = jsonArray.length();
            for(int i=0;i<len;i++){
                if (len==1){
                   this.degree="'" + jsonArray.getString(i) + "'";
                }else{
                    if(i+1>=len){
                        this.degree+="'" + jsonArray.getString(i) + "'";
                    
                    }else{
                        this.degree+="'" + jsonArray.getString(i) + "', ";
                    }
                }
            }
        }
        
        
        this.year = jsonObject.getString("year");
        
        if("null".equals(this.year)){
            this.year=null;
        }else{
            this.year = "";
            jsonArray = jsonObject.getJSONArray("year");
            len = jsonArray.length();
            for(int i=0;i<len;i++){
                if (len==1){
                   this.year="'" + jsonArray.getString(i) + "'";
                }else{
                    if(i+1>=len){
                        this.year+="'" + jsonArray.getString(i) + "'";
                    
                    }else{
                        this.year+="'" + jsonArray.getString(i) + "', ";
                    }
                }
            }
        }
        
        this.books = jsonObject.getString("books");
        
        if("null".equals(this.books)){
            this.books=null;
        }else{
            this.books = "";
            jsonArray = jsonObject.getJSONArray("books");
            len = jsonArray.length();
            for(int i=0;i<len;i++){
                if (len==1){
                   this.books="'" + jsonArray.getString(i) + "'";
                }else{
                    if(i+1>=len){
                        this.books+="'" + jsonArray.getString(i) + "'";
                    
                    }else{
                        this.books+="'" + jsonArray.getString(i) + "', ";
                    }
                }
            }
        }
        
        
        this.teams = jsonObject.getString("teams");
        
        if("null".equals(this.teams)){
            this.teams=null;
        }else{
            this.teams = "";
            jsonArray = jsonObject.getJSONArray("teams");
            len = jsonArray.length();
            for(int i=0;i<len;i++){
                if (len==1){
                   this.teams="'" + jsonArray.getString(i) + "'";
                }else{
                    if(i+1>=len){
                        this.teams+="'" + jsonArray.getString(i) + "'";
                    
                    }else{
                        this.teams+="'" + jsonArray.getString(i) + "', ";
                    }
                }
            }
        }
        
        
        this.events = jsonObject.getString("events");
        
        if("null".equals(this.events)){
            this.events=null;
        }else{
            this.events = "";
            jsonArray = jsonObject.getJSONArray("events");
            len = jsonArray.length();
            for(int i=0;i<len;i++){
                if (len==1){
                   this.events="'" + jsonArray.getString(i) + "'";
                }else{
                    if(i+1>=len){
                        this.events+="'" + jsonArray.getString(i) + "'";
                    
                    }else{
                        this.events+="'" + jsonArray.getString(i) + "', ";
                    }
                }
            }
        }
        
        this.music = jsonObject.getString("music");
        
        if("null".equals(this.music)){
            this.music=null;
        }else{
            this.music = "";
            jsonArray = jsonObject.getJSONArray("music");
            len = jsonArray.length();
            for(int i=0;i<len;i++){
                if (len==1){
                   this.music="'" + jsonArray.getString(i) + "'";
                }else{
                    if(i+1>=len){
                        this.music+="'" + jsonArray.getString(i) + "'";
                    
                    }else{
                        this.music+="'" + jsonArray.getString(i) + "', ";
                    }
                }
            }
        }
        
        
        this.pages = jsonObject.getString("pages");
        
         if("null".equals(this.pages)){
            this.pages=null;
        }else{
            this.pages = "";
            jsonArray = jsonObject.getJSONArray("pages");
            len = jsonArray.length();
            for(int i=0;i<len;i++){
                if (len==1){
                   this.pages="'" + jsonArray.getString(i) + "'";
                }else{
                    if(i+1>=len){
                        this.pages+="'" + jsonArray.getString(i) + "'";
                    
                    }else{
                        this.pages+="'" + jsonArray.getString(i) + "', ";
                    }
                }
            }
        }
        
        this.query = "SELECT a.* FROM i_user a \n";
        
        if(this.country==null && this.department==null && this.prefecture==null && this.city==null && this.postal==null && this.employer==null && this.position==null && this.school==null && this.degree==null && this.year==null && this.books==null && this.events==null && this.music==null && this.teams==null && this.pages==null){
           this.query = "SELECT a.* FROM i_user a \n"; 
        }else{
            
            if(this.country!=null || this.department!=null || this.prefecture!=null || this.city!=null || this.postal!=null){
                this.query+="INTERSECT SELECT a.* FROM \n" +
                        "i_user a, i_location b WHERE a.i_user_id=b.i_user_id \n";
                    if(this.country!=null){
                        this.query+="AND b.i_country_name in (" + this.country + ") \n";
                    }

                    if(this.department!=null){
                        this.query+="AND b.i_department in (" + this.department + ") \n";
                    }
                    if(this.prefecture!=null){
                        this.query+="AND b.i_prefecture in (" + this.prefecture + ") \n";
                    }
                    if(this.city!=null){
                        this.query+="AND b.i_city_name in (" + this.city + ") \n";
                    }
                    if(this.postal!=null){
                        this.query+="AND b.i_postal_code in (" + this.postal + ") \n";
                    }
                    
            }
            
            if(this.employer!=null || this.position!=null){
                this.query+="INTERSECT SELECT a.* FROM \n" +
                        "i_user a, i_work_info c WHERE a.i_user_id=c.i_user_id \n";
                if(this.employer!=null){
                    this.query+="AND c.i_work_employer in (" + this.employer + ") \n";             
                }
                if(this.position!=null){
                    this.query+="AND c.i_work_position in (" + this.position + ") \n";             
                }   
            }
            
            if(this.school!=null || this.degree!=null || this.year!=null){
               this.query+="INTERSECT SELECT a.* FROM \n" +
                        "i_user a, i_education_info c WHERE a.i_user_id=c.i_user_id \n";
                if(this.school!=null){
                    this.query+="AND c.i_edu_school in (" + this.school + ") \n";             
                }
                if(this.degree!=null){
                    this.query+="AND c.i_edu_degree in (" + this.degree + ") \n";             
                } 
                if(this.year!=null){
                    this.query+="AND c.i_edu_year in (" + this.year + ") \n";             
                } 
            }
            if(this.books!=null){
                this.query+="INTERSECT SELECT a.* FROM \n" +
                        "i_user a, i_fb_books c WHERE a.i_user_id=c.i_user_id \n" +
                        "AND c.i_book_name in (" + this.books + ") \n";
            }
            if(this.events!=null){
                this.query+="INTERSECT SELECT a.* FROM \n" +
                        "i_user a, i_fb_events c WHERE a.i_user_id=c.i_user_id \n" +
                        "AND c.i_event_name in (" + this.events + ") \n";
            }
            if(this.teams!=null){
                this.query+="INTERSECT SELECT a.* FROM \n" +
                        "i_user a, i_fb_favorite_teams c WHERE a.i_user_id=c.i_user_id \n" +
                        "AND c.i_team_name in (" + this.teams + ") \n";
            }
            if(this.music!=null){
                this.query+="INTERSECT SELECT a.* FROM \n" +
                        "i_user a, i_fb_music c WHERE a.i_user_id=c.i_user_id \n" +
                        "AND c.i_music_title in (" + this.music + ") \n";
            }
            if(this.pages!=null){
                this.query+="INTERSECT SELECT a.* FROM \n" +
                        "i_user a, i_interest_fb_pages c WHERE a.i_user_id=c.i_user_id \n" +
                        "AND c.i_page_name in (" + this.pages + ") \n";
            }
        }
        
        return query;
        
    }
    
}
