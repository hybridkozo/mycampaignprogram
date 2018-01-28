/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**var indetifier;
var positionId;
var bookId;
var sportTeamId;
var eventId;
var musicId;
var pageId;
var eduSchoolId;
var eduDegreeId;
var eduYearId, locationCountryId, locationDepartmentId, locationPrefectureId, locationCityId, locationPostalCodeId;**/

var segments = {

 newSegment: function(){
        document.getElementById('segmentList').style.display ='none';
        document.getElementById('newSegment').style.display = 'block';
             
 },
 
 testFunction: function(){
     
     var i;
        var itemList = [];
        var data;
        var rootList = document.getElementById("thisid_chosen").getElementsByClassName("result-selected");
         
        vlen = rootList.length;
     
        if(vlen >0 ){
             for (i=0;i<vlen;i++){
                 alert(rootList[i].innerHTML);
                 itemList.push(rootList[i].innerHTML);
             }
            
             data = '["' + itemList.join('", "') + '"]';
             segments.addWorkPosition("positionId",data);
              
              }else{
                  data=null;
                  segments.addWorkPosition("positionId",data);
              }
     
 },
 
 findElement: function(){
        var i;
        var itemList = [];
        var data;
        var rootList = document.getElementById("thisid_chosen").getElementsByClassName("result-selected");
        var choiceList = document.getElementById("thisid_chosen").getElementsByClassName("search-choice");
         
        vlen = rootList.length;
        clen = choiceList.length;
        if (clen > 0 && vlen > 0){
        if(vlen >0 ){
             for (i=0;i<vlen;i++){
                 alert(rootList[i].innerHTML);
                 itemList.push(rootList[i].innerHTML);
             }
            
             data = '["' + itemList.join('", "') + '"]';
             segments.addWorkPosition("positionId",data);
              
              }}
              else {
                  alert("is null");
                
              }
    },

 addEmployerContent: function(indetifier){
            
                        
                             var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= '<option value="' + data[i] + '">' + data[i] + '</option>';
                                     }
                                    
                                     document.getElementById(indetifier).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctAllEmployers", true);
                         xhttp.send();
                         
                            
                           
    },
 
     addWorkPosition: function(positionId, argList){
         
         if (argList === null){
            var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                    
                                     document.getElementById(positionId).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctAllWorkPositions", true);
                            xhttp.send();
                        }else {
                                var xhr = new XMLHttpRequest();
                                var url = "http://localhost:8080/getDistinctAllWorkPositionsViaFilter";
                                xhr.open("POST", url, true);
                                xhr.setRequestHeader("Content-type", "application/json");
                                
                                xhr.onreadystatechange = function () {
                                    var data,x,z,final,i,flen; 
                                    if (xhr.readyState === 4 && xhr.status === 200) {
                                           
                                            data = JSON.parse(xhr.responseText);
                                          
                                            flen = data.length;
                                            
                                             if (data!==null){
                                                for (i=0;i<flen;i++){
                                                    x+= '<option value="' + data[i] + '">' + data[i] + '</option>';
                                                }
                                                
                                                document.getElementById("positionId").innerHTML = x;
                                             }
                                     }
                                };
                          
                                alert(argList);
                                xhr.send(argList);

                         }
    },
    
    
    addFavoriteBooks: function(bookId){
            var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                    
                                     document.getElementById(bookId).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctFavoriteBooks", true);
                            xhttp.send();
    },
    
    addFavoriteSportTeams: function(sportTeamId){
            var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                    
                                     document.getElementById(sportTeamId).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctFavoriteSportTeams", true);
                            xhttp.send();
    },
    
    
    addEventNames: function(eventId){
            var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                    
                                     document.getElementById(eventId).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctEventNames", true);
                            xhttp.send();
    },
    
    addFavoriteMusic: function(musicId){
            var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                    
                                     document.getElementById(musicId).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctFavoriteMusic", true);
                            xhttp.send();
    },
    
      addFavoritepages: function(pageId){
            var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                    
                                     document.getElementById(pageId).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctFavoritePages", true);
                            xhttp.send();
    },
    
    
    addEduSchool: function(eduSchoolId){
            var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                    
                                     document.getElementById(eduSchoolId).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctEduSchool", true);
                            xhttp.send();
    },
    
     addEduDegree: function(eduDegreeId){
            var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                    
                                     document.getElementById(eduDegreeId).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctEduDegree", true);
                            xhttp.send();
    },
    
    
         addEduYear: function(eduYearId){
            var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                    
                                     document.getElementById(eduYearId).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctEduYear", true);
                            xhttp.send();
    },
    
    
    
    
      addLocationCountryNames: function(locationCountryId){
            var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                    
                                     document.getElementById(locationCountryId).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctCountyNames", true);
                            xhttp.send();
    },
    
    
     addLocationDepartmentNames: function(locationDepartmentId){
            var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                    
                                     document.getElementById(locationDepartmentId).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctDepartmentNames", true);
                            xhttp.send();
    },
    
    
    addLocationPrefectureNames: function(locationPrefectureId){
            var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                    
                                     document.getElementById(locationPrefectureId).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctPrefectureNames", true);
                            xhttp.send();
    },
    
    
    
       addLocationCityNames: function(locationCityId){
            var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                    
                                     document.getElementById(locationCityId).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctCityNames", true);
                            xhttp.send();
    },
    
           addLocationPostalCodes: function(locationPostalCodeId){
            var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                    
                                     document.getElementById(locationPostalCodeId).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctPostalCodes", true);
                            xhttp.send();
    },
            
    getAllSegments: function(){
        
             var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<tr><td>" + data[i].sys_segment_id + "</td><td>" + data[i].sys_segment_name + "</td></tr>";
                                     }
                                    
                                     document.getElementById('demo').innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getAllSegmentsDesc", true);
                            xhttp.send();   
                
    }
    
    
    
    
    
};

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var targetwork = {
    
    selectEmployer: function(){
        document.getElementById('employerButton').style.display ='none';
        document.getElementById('employerSelect').style.display = 'block';
        document.getElementById('positionButton').style.display = 'block';
        document.getElementById('resetButton').style.display='block';
    },
    
    selectPosition: function(){
       document.getElementById('employerSelect').disabled=true; 
       var e = document.getElementById("employerSelect");
       var employerSelOpt = targetwork.getSelectValues(e);
       if (employerSelOpt !== null){
           targetwork.addWorkPosition('positionSelect',employerSelOpt);
       }else{
       }
       document.getElementById('positionButton').style.display='none';
       document.getElementById('positionSelect').style.display='block';
       
    },
   
    getSelectValues: function(select) {
        var result = [];
        var options = select && select.options;
        var opt;

        for (var i=0, iLen=options.length; i<iLen; i++) {
          opt = options[i];

          if (opt.selected) {
            result.push(opt.value || opt.text);
          }
        }
        if(result.length===0){
            return null;
        }else if(result[0]==='All'){
            return null;
        }else{
            var data ='["' + result.join('", "') + '"]';
        return data;
    }
    },
    resetWorkFilter: function(){
        document.getElementById('employerButton').style.display ='block';
        document.getElementById('employerSelect').style.display = 'none';
        document.getElementById('employerSelect').disabled=false;
        document.getElementById('positionSelect').style.display = 'none';
        document.getElementById('positionButton').style.display = 'none';
        document.getElementById('resetButton').style.display='none';
        targetwork.addEmployerContent('employerSelect');
        targetwork.addWorkPosition('positionSelect',null);
    },
    
    addEmployerContent: function(indetifier){
            
                        
                             var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= '<option value="' + data[i] + '">' + data[i] + '</option>';
                                     }
                                    
                                     document.getElementById(indetifier).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctAllEmployers", true);
                         xhttp.send();
                         
                            
                           
    },
    
    addWorkPosition: function(positionId, argList){
         
         if (argList === null){
            var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;

                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                    
                                     document.getElementById(positionId).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctAllWorkPositions", true);
                            xhttp.send();
                        }else {
                                var xhr = new XMLHttpRequest();
                                var url = "http://localhost:8080/getDistinctAllWorkPositionsViaFilter";
                                xhr.open("POST", url, true);
                                xhr.setRequestHeader("Content-type", "application/json");
                                
                                xhr.onreadystatechange = function () {
                                    var data,x,z,final,i,flen; 
                                    if (xhr.readyState === 4 && xhr.status === 200) {
                                           
                                            data = JSON.parse(xhr.responseText);
                                            flen = data.length;
                                            
                                             if (data!==null){
                                                for (i=0;i<flen;i++){
                                                    x+= '<option value="' + data[i] + '">' + data[i] + '</option>';
                                                }
                                                document.getElementById(positionId).innerHTML = x;
                                             }
                                     }
                                };
                          
                                xhr.send(argList);

                         }
    }
    
    
};


/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var targetlocation = {
  
  
  selectCountry: function(){
      
      var countrySel = document.getElementById('countrySelect');
      var countryButton = document.getElementById('countryButton');
      var departmentButton = document.getElementById('departmentButton');
      var resetButton = document.getElementById('resetLocationButton');
      
      countrySel.style.display='block';
      countryButton.style.display='none';
      departmentButton.style.display='block';
      resetButton.style.display='block';
  },
  selectDepartment: function(){
      
     var countrySel = document.getElementById('countrySelect'); 
     var departmentSel = document.getElementById('departmentSelect');
     var departmentButton = document.getElementById('departmentButton');
     var prefectureButton = document.getElementById('prefectureButton');
     
     targetlocation.addFilterValues('departmentSelect',targetlocation.getSelectValues(countrySel),'http://localhost:8080/getDistinctDepartmentNames','http://localhost:8080/getDistinctLocationDepartmentViaFilter');
     
     countrySel.disabled = true;
     departmentSel.style.display = 'block';
     departmentButton.style.display = 'none';
     prefectureButton.style.display = 'block';
     
     
  },
  selectPrefecture: function(){
     
     var prefectureSel = document.getElementById('prefectureSelect');
     var cityButton = document.getElementById('cityButton');
     var prefectureButton = document.getElementById('prefectureButton');
     var departmentSel = document.getElementById('departmentSelect');
     
     targetlocation.addFilterValues('prefectureSelect',targetlocation.getSelectValues(departmentSel),'http://localhost:8080/getDistinctPrefectureNames','http://localhost:8080/getDistinctLocationPrefectureViaFilter');
     
     prefectureSel.style.display = 'block';
     departmentSel.disabled = true;
     prefectureButton.style.display = 'none';
     cityButton.style.display = 'block';
     
     
      
  },
  selectCity: function(){
      
     var prefectureSel = document.getElementById('prefectureSelect');
     var citySel = document.getElementById('citySelect');
     
     var cityButton = document.getElementById('cityButton');
     var postalButton = document.getElementById('postalButton');
     
     
     targetlocation.addFilterValues('citySelect',targetlocation.getSelectValues(prefectureSel),'http://localhost:8080/getDistinctCityNames','http://localhost:8080/getDistinctLocationCityViaFilter');
     
     prefectureSel.disabled = true;
     citySel.style.display = 'block';
     
     cityButton.style.display = 'none';
     postalButton.style.display = 'block';
      
  },
  selectPostal: function(){
     var citySel = document.getElementById('citySelect');
     var postalSel = document.getElementById('postalSelect');
     var postalButton = document.getElementById('postalButton');
       
     targetlocation.addFilterValues('postalSelect',targetlocation.getSelectValues(citySel),'http://localhost:8080/getDistinctPostalCodes','http://localhost:8080/getDistinctLocationPostalViaFilter');
     
     citySel.disabled = true;
     postalSel.style.display = 'block';
     postalButton.style.display = 'none';
     
  },
  
  resetLocationFilter: function(){
      var countrySel = document.getElementById('countrySelect');
      var departmentSel = document.getElementById('departmentSelect');
      var prefectureSel = document.getElementById('prefectureSelect');
      var citySel = document.getElementById('citySelect');
      var countryButton = document.getElementById('countryButton');
      var departmentButton = document.getElementById('departmentButton');
      var resetButton = document.getElementById('resetLocationButton');
      var prefectureButton = document.getElementById('prefectureButton');
      var cityButton = document.getElementById('cityButton');
      var postalSel = document.getElementById('postalSelect');
     var postalButton = document.getElementById('postalButton');
      
      countrySel.disabled=false;
      countrySel.deselected=true;
      countrySel.style.display='none';
      departmentSel.disabled=false;
      departmentSel.deselected=true;
      departmentSel.style.display='none';
      prefectureSel.disabled=false;
      prefectureSel.style.display='none';
      prefectureSel.style.display='none';
      citySel.disabled=false;
      citySel.style.display='none';
      citySel.style.display='none';
      
      postalSel.disabled=false;
      postalSel.style.display='none';
      postalSel.style.display='none';
      
      departmentButton.style.display = 'none';
      resetButton.style.display = 'none';
      countryButton.style.display = 'block';
      prefectureButton.style.display='none';
      cityButton.style.display = 'none';
      postalButton.style.display = 'none';
      
      
      targetlocation.addFilterValues('countrySelect',null,'http://localhost:8080/getDistinctCountyNames',null);
      targetlocation.addFilterValues('departmentSelect',null,'http://localhost:8080/getDistinctDepartmentNames',null);
      targetlocation.addFilterValues('prefectureSelect',null,'http://localhost:8080/getDistinctPrefectureNames',null);
      targetlocation.addFilterValues('citySelect',null,'http://localhost:8080/getDistinctCityNames',null);
      targetlocation.addFilterValues('postalSelect',null,'http://localhost:8080/getDistinctPostalCodes',null);
  },
  getSelectValues: function(select) {
        var result = [];
        var options = select && select.options;
        var opt;

        for (var i=0, iLen=options.length; i<iLen; i++) {
          opt = options[i];

          if (opt.selected) {
            result.push(opt.value || opt.text);
          }
        }
        if(result.length===0){
            return null;
        }else if(result[0]==='All'){
            return null;
        }else{
            var data ='["' + result.join('", "') + '"]';
        return data;
    }
  },
     addFilterValues: function(itemId,selectedItems,URL,FILTER_URL){
         if (selectedItems === null){
            var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                    
                                     document.getElementById(itemId).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", URL, true);
                            xhttp.send();
                        }else{
                            var xhr = new XMLHttpRequest();
                                
                                xhr.open("POST", FILTER_URL, true);
                                xhr.setRequestHeader("Content-type", "application/json");
                                
                                xhr.onreadystatechange = function () {
                                    var data,x,z,final,i,flen; 
                                    if (xhr.readyState === 4 && xhr.status === 200) {
                                           
                                            data = JSON.parse(xhr.responseText);
                                            flen = data.length;
                                            
                                             if (data!==null){
                                                for (i=0;i<flen;i++){
                                                    x+= '<option value="' + data[i] + '">' + data[i] + '</option>';
                                                }
                                                document.getElementById(itemId).innerHTML = x;
                                             }
                                     }
                                };
                          
                               
                                xhr.send(selectedItems);

                            
                        }
    }       
            
    
};


/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var targeteducation = {
    
  selectSchool: function(){
     var selSchool = document.getElementById('schoolSelect');
     var butSchool = document.getElementById('schoolButton');
     var butDegree = document.getElementById('degreeButton');
     var butReset = document.getElementById('resetEduButton');
     selSchool.style.display='block';
     butSchool.style.display='none';
     butDegree.style.display='block';
     butReset.style.display='block';
  }, 
  selectDegree: function(){
      var selSchool = document.getElementById('schoolSelect');
      var selDegree = document.getElementById('degreeSelect');
      var butDegree = document.getElementById('degreeButton');
      var butYear = document.getElementById('yearButton');
      var selectedSchoolValues = targeteducation.getSelectValues(selSchool);
     
      if(selectedSchoolValues !== null){
          
      }else{
          
      }
      
      selSchool.disabled=true;
      targeteducation.addEduDegree('degreeSelect',selectedSchoolValues);
      butDegree.style.display='none';
      butYear.style.display='block';
      selDegree.style.display='block';
      
      
  }, 
  selectYear: function(){
      
      var selDegree = document.getElementById('degreeSelect');
      var selYear = document.getElementById('yearSelect');
      var butYear = document.getElementById('yearButton');
      var selectedDegreeValues = targeteducation.getSelectValues(selDegree);
     
      if(selectedDegreeValues !== null){
          
      }else{
         
      }
      
      selDegree.disabled=true;
      targeteducation.addEduYear('yearSelect',selectedDegreeValues);
      butYear.style.display='none';
      selYear.style.display='block';
      
  }, 
  resetEduFilter: function(){
      var selSchool = document.getElementById('schoolSelect');
      var selDegree = document.getElementById('degreeSelect');
      var selYear = document.getElementById('yearSelect');
      var butSchool = document.getElementById('schoolButton');
      var butDegree = document.getElementById('degreeButton');
      var butYear = document.getElementById('yearButton');
      var resetButton = document.getElementById('resetEduButton');
      butSchool.style.display='block';
      butDegree.style.display='none';
      butYear.style.display='none';
      resetButton.style.display='none';
      selSchool.disabled=false;
      selDegree.disabled=false;
      selYear.deselected=true;
      selSchool.deselected=true;
      selDegree.deselected=true;
      selYear.deselected=true;
      selSchool.style.display='none';
      selDegree.style.display='none';
      selYear.style.display='none';
      
      targeteducation.addEduSchool('schoolSelect');
      targeteducation.addEduDegree('degreeSelect',null);
      targeteducation.addEduYear('yearSelect',null);
      
      
  },
  
  getSelectValues: function(select) {
        var result = [];
        var options = select && select.options;
        var opt;

        for (var i=0, iLen=options.length; i<iLen; i++) {
          opt = options[i];

          if (opt.selected) {
            result.push(opt.value || opt.text);
          }
        }
        if(result.length===0){
            return null;
        }else if(result[0]==='All'){
            return null;
        }else{
            var data ='["' + result.join('", "') + '"]';
        return data;
    }
},
addEduSchool: function(eduSchoolId){
            var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                    
                                     document.getElementById(eduSchoolId).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctEduSchool", true);
                            xhttp.send();
    },
    
     addEduDegree: function(eduDegreeId,selectedItems){
         if (selectedItems === null){
            var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                    
                                     document.getElementById(eduDegreeId).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctEduDegree", true);
                            xhttp.send();
                        }else{
                            var xhr = new XMLHttpRequest();
                                var url = "http://localhost:8080/getDistinctAllEduDegreeViaFilter";
                                xhr.open("POST", url, true);
                                xhr.setRequestHeader("Content-type", "application/json");
                                
                                xhr.onreadystatechange = function () {
                                    var data,x,z,final,i,flen; 
                                    if (xhr.readyState === 4 && xhr.status === 200) {
                                           
                                            data = JSON.parse(xhr.responseText);
                                       flen = data.length;
                                            
                                             if (data!==null){
                                                for (i=0;i<flen;i++){
                                                    x+= '<option value="' + data[i] + '">' + data[i] + '</option>';
                                                }
                                               
                                                document.getElementById(eduDegreeId).innerHTML = x;
                                             }
                                     }
                                };
                          
                                xhr.send(selectedItems);

                        }
    },
    
     addEduYear: function(eduYearId,selectedItems){
         if (selectedItems === null){
            var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                    
                                     document.getElementById(eduYearId).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctEduYear", true);
                            xhttp.send();
                        }else{
                            var xhr = new XMLHttpRequest();
                                var url = "http://localhost:8080/getDistinctAllEduYearViaFilter";
                                xhr.open("POST", url, true);
                                xhr.setRequestHeader("Content-type", "application/json");
                                
                                xhr.onreadystatechange = function () {
                                    var data,x,z,final,i,flen; 
                                    if (xhr.readyState === 4 && xhr.status === 200) {
                                           
                                            data = JSON.parse(xhr.responseText);

                                            flen = data.length;
                                            
                                             if (data!==null){
                                                for (i=0;i<flen;i++){
                                                    x+= '<option value="' + data[i] + '">' + data[i] + '</option>';
                                                }
                                                document.getElementById(eduYearId).innerHTML = x;
                                             }
                                     }
                                };
                          
                                
                                xhr.send(selectedItems);

                            
                        }
    }
    
};

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var extrainformation = {
    
    selectBooks: function(){
        document.getElementById('bookButton').style.display='none';
        document.getElementById('bookSelect').style.display='block';
        document.getElementById('resetExtraInfoButton').style.display='block';
    },
    
     selectTeams: function(){
        document.getElementById('teamButton').style.display='none';
        document.getElementById('teamSelect').style.display='block';
        document.getElementById('resetExtraInfoButton').style.display='block';
    },
    
     selectEvents: function(){
        document.getElementById('eventButton').style.display='none';
        document.getElementById('eventSelect').style.display='block';
        document.getElementById('resetExtraInfoButton').style.display='block';
    },
    selectMusic: function(){
        document.getElementById('musicButton').style.display='none';
        document.getElementById('musicSelect').style.display='block';
        document.getElementById('resetExtraInfoButton').style.display='block';
    },
     selectPages: function(){
        document.getElementById('pageButton').style.display='none';
        document.getElementById('pageSelect').style.display='block';
        document.getElementById('resetExtraInfoButton').style.display='block';
    },
    resetExtraInfoFilter: function(){
        var pageEl = document.getElementById('pageSelect');
        var musicEl = document.getElementById('musicSelect');
        var teamEl = document.getElementById('teamSelect');
        var eventEl = document.getElementById('eventSelect');
        var bookEl = document.getElementById('bookSelect');
        extrainformation.deselectList(pageEl);
        extrainformation.deselectList(musicEl);
        extrainformation.deselectList(teamEl);
        extrainformation.deselectList(eventEl);
        extrainformation.deselectList(bookEl);
        document.getElementById('pageButton').style.display='block';
        pageEl.style.display='none';
        document.getElementById('resetExtraInfoButton').style.display='none';
        document.getElementById('musicButton').style.display='block';
        musicEl.style.display='none';
        document.getElementById('eventButton').style.display='block';
        eventEl.style.display='none';
        document.getElementById('bookButton').style.display='block';
        bookEl.style.display='none';
        document.getElementById('teamButton').style.display='block';
        teamEl.style.display='none';
        
    },
    deselectList: function(element){
        var len = element.length;
        for(var i=0;i<len;i++){
            element[i].selected=false;
        }
    }
};

var save = {
    
    onSave: function(){
        
        var name = document.getElementById('segmentName');
        var description = document.getElementById('segmentDescription');
        var country = document.getElementById('countrySelect');
        var department = document.getElementById('departmentSelect');
        var prefecture = document.getElementById('prefectureSelect');
        var city = document.getElementById('citySelect');
        var postal = document.getElementById('postalSelect');
        var employer = document.getElementById('employerSelect');
        var position = document.getElementById('positionSelect');
        var school = document.getElementById('schoolSelect');
        var degree = document.getElementById('degreeSelect');
        var year = document.getElementById('yearSelect');
        var books = document.getElementById('bookSelect');
        var teams = document.getElementById('teamSelect');
        var events = document.getElementById('eventSelect');
        var music = document.getElementById('musicSelect');
        var pages = document.getElementById('pageSelect');
        
        var js='{"name":';
        if (name.value==='' || name.value === null){
           js+= '""' + ', "description": ';
        }else{
            js+= '"' + name.value + '"' + ', "description": ';
        }
        if (description.value === '' || description.value === null){
            js+= '""' + ', "country": ';
        } else{
            js+= '"' + description.value + '"' + ', "country": ';
        }
        
        js+= targeteducation.getSelectValues(country) + ', ';
        js+= '"department":' + targeteducation.getSelectValues(department) + ', ';
        js+= '"prefecture":' + targeteducation.getSelectValues(prefecture) + ', ';
        js+= '"city":' + targeteducation.getSelectValues(city) + ', ';
        js+= '"postal":' + targeteducation.getSelectValues(postal) + ', ';
        js+= '"employer":' + targeteducation.getSelectValues(employer) + ', ';
        js+= '"position":' + targeteducation.getSelectValues(position) + ', ';
        js+= '"school":' + targeteducation.getSelectValues(school) + ', ';
        js+= '"degree":' + targeteducation.getSelectValues(degree) + ', ';
        js+= '"year":' + targeteducation.getSelectValues(year) + ', ';
        js+= '"books":' + targeteducation.getSelectValues(books) + ', ';
        js+= '"teams":' + targeteducation.getSelectValues(teams) + ', ';
        js+= '"events":' + targeteducation.getSelectValues(events) + ', ';
        js+= '"music":' + targeteducation.getSelectValues(music) + ', ';
        js+= '"pages":' + targeteducation.getSelectValues(pages) + '}';
        
        save.callTheBackToSave(js);
   
        
      
    },
    callTheBackToSave: function(json){
        var data;
        var xhr = new XMLHttpRequest();
        var url = "http://localhost:8080/saveNewSegment";
        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-type", "application/json"); 
        xhr.onreadystatechange = function () {
        
        if (xhr.readyState === 4 && xhr.status === 200) {
                                           
            data = JSON.parse(xhr.responseText);
            if(data.status==='success'){
               
                 
                 var successVal = document.getElementById('successMessage'); 
                
                 document.getElementById('errorMessage').style.display='none';
                 successVal.innerHTML = '<strong>Success! </strong> The segment has been saved successfully.';
                 successVal.style.display='block';
                 segments.getAllSegments();
                 document.getElementById('newSegment').style.display='none';
                 document.getElementById('segmentList').style.display='block';
                 
                
            }else{
                var errorVal = document.getElementById('errorMessage');
                errorVal.style.display='block';
                document.getElementById('successMessage').style.display='none';
                errorVal.innerHTML = '<strong>Warning!</strong>' + data.object.description;
            }                            
            
                                     }
                                };
                          
                                
                                xhr.send(json);
    }
    
    
    
};
    
    
    
    
   


   







