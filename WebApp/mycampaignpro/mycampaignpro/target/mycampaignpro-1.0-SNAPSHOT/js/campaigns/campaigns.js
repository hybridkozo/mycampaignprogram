/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var campaign = {
  
    getAllCampaigns: function(){
        
             var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= '<tr><td>' + data[i][0] + '</td><td>' + data[i][1] + '</td><td>' + data[i][2] + '</td><td>' + data[i][3] + '</td>';
                                      if(data[i][2]==="INACTIVE"){
                                          x+='<td>' + '<button type="button" class="btn btn-outline-dark" onclick="alert(' + data[i][0] +')">Edit</button><button type="button" class="btn btn-outline-primary" onclick="campaign.activate(' + data[i][0] +')">Activate</button><button type="button" class="btn btn-outline-dark" onclick="campaign.showDetails(' + data[i][0] +')">Details</button></td></tr>';
                                      }else{
                                          x+='<td>' + '<button type="button" class="btn btn-outline-dark" onclick="campaign.showDetails(' + data[i][0] +')">Details</button></td></tr>';
                                      }
                                     }
                                    
                                     document.getElementById('campaignsTable').innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getAllCampaigns", true);
                            xhttp.send();   
                
    },
    activate: function(id){
        
        var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var campaignTime,campaignTimeMili, sysdate, sysdateMili;
                            if (this.readyState === 4 && this.status === 200) {
                               campaignTime = new Date(this.responseText);
                               campaignTimeMili = Date.parse(campaignTime);
                               campaignTimeMili += 100000;
                               sysdate = new Date();
                               sysdateMili = Date.parse(sysdate);
                               if(sysdateMili > campaignTimeMili){
                                   document.getElementById('errorMessage').innerHTML = '<strong>Warning!</strong>' + 'Invalid excecution date';
                                   document.getElementById('errorMessage').style.display = 'block';
                               }else{
                                   
                                   campaign.triggerSimpleNotification(campaignTime,id);
                               }
                               
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getStartDateOfCampaign?id=" + id, true);
                            xhttp.send(); 
        
       
         
    },
    triggerSimpleNotification: function(date,id){
        var month = parseInt(date.getMonth());
                               month++;
        var json = '{ "name": "Simple Notification ' + id + '", "id" : ' + id + ', "triggers":[ { "name": "Simple Notification ' + id + '", "group": "simplenotification", "cron": "0 ' + date.getMinutes() + ' ' + date.getHours() + ' ' + date.getDate() + ' ' + month + ' ? ' + date.getFullYear() + '"} ]}';
        alert(json);
        var xhr = new XMLHttpRequest();
        var url = "http://localhost:8080/simple/notification/api/v1.0/groups/simplenotification/jobs";
        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-type", "application/json"); 
        xhr.onreadystatechange = function () {
        
        if (xhr.readyState === 4 && xhr.status === 200) {
            
            alert("Campaign activated!!!");
                                           
            campaign.changeActivateStatusOnDatabase(id);
            
                                     }
                                };
                          
                                
                                xhr.send(json);
                                campaign.changeActivateStatusOnDatabase(id);
        
        
    },
    changeActivateStatusOnDatabase: function(id){
        var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            
                            if (this.readyState === 4 && this.status === 200) {
                             alert("Campaign avtivated");
                               window.location.replace("/campaigns.html");   
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/updateCampaignStatus?id=" + id, true);
                            xhttp.send();  
    },
    showDetails: function(id){
        sessionStorage.setItem("campaignid",id);
        window.location.replace("/simplenotificationdetails.html");
    },
    writeDetails: function(){
        
        var id = sessionStorage.getItem("campaignid");
    
        campaign.getCampaignDetailsById(id);
       
        
    },
    getCampaignDetailsById: function(id){
        
          var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen,json; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                                 json = JSON.parse(data.sys_json_data);
         
                                 document.getElementById("campaignName").value=json.campaignName;
                                 document.getElementById("campaignDescription").value=json.campaignDescription;
                                 var segmentObject = document.getElementById('selectSegment');
                                 var opts = segmentObject.options;
                                 for (var opt, i=0;opt = opts[i];i++){
                                     if (opt.value == json.segmentId){
                                         segmentObject.selectedIndex = i;
                                         break;
                                     }
                                 }
                                 document.getElementById("notificationDatetime").value=json.datetime;
                                 document.getElementById("notificationTitle").value=json.notificationTitle;
                                 document.getElementById("notificationBody").value=json.notificationBody;
                                 
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getCampaignDataById?id=" + id, true);
                            xhttp.send(); 
        
    }
    
};

var simplenot = {
  
    getAllSegments: function(){
        
             var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= '<option value="' + data[i].sys_segment_id + '">' + data[i].sys_segment_name + '</option>';
                                     }
                                    
                                     document.getElementById('selectSegment').innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getAllSegmentsDesc", true);
                            xhttp.send();   
                
    }
    
};


var save = {
    
  onSave: function(){
        var js="";
        var name = document.getElementById('campaignName').value;
        var description = document.getElementById('campaignDescription').value;
        var segmentObject = document.getElementById('selectSegment');
        var segmentId = segmentObject.options[segmentObject.selectedIndex].value;
        var datetime = document.getElementById('notificationDatetime').value;
        var notificationTitle = document.getElementById('notificationTitle').value;
        var notificationBody = document.getElementById('notificationBody').value;
        var errorMessageName = document.getElementById('errorMessageName');
        var errorMessageDescription = document.getElementById('errorMessageDescription');
        var errorMessageDatetime = document.getElementById('errorMessageDatetime');
        var errorMessageNotificationTitle = document.getElementById('errorMessageNotificationTitle');
        var errorMessageNotificationBody = document.getElementById('errorMessageNotificationBody');
       errorMessageName.style.display='none';
       errorMessageDescription.style.display='none';
       errorMessageDatetime.style.display='none';
       errorMessageNotificationTitle.style.display='none';
       errorMessageNotificationBody.style.display='none';
       
        if(name===""){
            name=null;
           errorMessageName.style.display='block';
        }
        
        if(description===""){
            description=null;
            errorMessageDescription.style.display='block';
        }
        if(datetime===""){
            datetime=null;
           errorMessageDatetime.style.display='block';
        }
        if (notificationTitle===""){
            notificationTitle=null;
           errorMessageNotificationTitle.style.display='block';
        }
        if (notificationBody===""){
            notificationBody=null;
           errorMessageNotificationBody.style.display='block';
        }
        
       if(name!==null && description!==null && datetime!==null && notificationTitle!==null && notificationBody!==null){
           js+='{';
           js+='"campaignName" : "' + name + '",';
           js+='"campaignDescription" : "' + description + '",';
           js+='"segmentId" : "' + segmentId + '",';
           js+='"datetime" : "' + datetime + '",';
           js+='"notificationTitle" : "' + notificationTitle + '",';
           js+='"notificationBody" : "' + notificationBody + '"';
           js+='}';
           
            save.callTheBackToSave(js);
       } 
   },
   callTheBackToSave: function(json){
        var data;
        var xhr = new XMLHttpRequest();
        var url = "http://localhost:8080/saveNewCampaign";
        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-type", "application/json"); 
        xhr.onreadystatechange = function () {
        
        if (xhr.readyState === 4 && xhr.status === 200) {
                                           
            data = JSON.parse(xhr.responseText);
            if(data.status==='success'){
               window.location.replace("/campaigns.html"); 
                
            }else{
                var errorVal = document.getElementById('errorMessage');
                errorVal.style.display='block';
                errorVal.innerHTML = '<strong>Warning!</strong>' + data.object.description;
            }                            
            
                                     }
                                };
                          
                                
                                xhr.send(json);
    }
};


