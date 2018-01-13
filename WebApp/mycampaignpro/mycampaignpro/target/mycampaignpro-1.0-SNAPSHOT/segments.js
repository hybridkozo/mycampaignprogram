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
var indetifier;
var positionId;
var bookId;
var sportTeamId;
var eventId;
var musicId;
var pageId;
var eduSchoolId;
var eduDegreeId;
var eduYearId;


 function addEmployerContent(indetifier){
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
                                    
                                     document.getElementById(indetifier).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctAllEmployers", true);
                            xhttp.send();
    }
    
    
     function addWorkPosition(positionId){
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
    }
    
    
    function addFavoriteBooks(bookId){
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
    }
    
    function addFavoriteSportTeams(sportTeamId){
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
    }
    
    
     function addEventNames(eventId){
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
    }
    
     function addFavoriteMusic(musicId){
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
    }
    
       function addFavoritepages(pageId){
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
    }
    
    
    function addFavoritepages(eduSchoolId){
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
    }
    
    
    

    
    
    
    
    
    
    
   


function newSegment(){
    document.getElementById('segmentList').style.display ='none';
    document.getElementById('newSegment').style.display = 'block';
    //addEmployerContent("empl");
    var indetifier;
    function addEmployerContent(indetifier){
           var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 x='<select id="employer" data-placeholder="Employer" multiple class="chosen-select" tabindex="-1" style="display: none">';
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                     x+='</select><div class="chosen-container chosen-container-multi" style="width: 0px;" title=""><ul class="chosen-choices"><li class="search-field"><input type="text" value="Employer" class="default" autocomplete="off" style="width: 71px;" tabindex="8"></li></ul><div class="chosen-drop"><ul class="chosen-results"></ul></div></div>';
                                     document.getElementById(indetifier).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctAllEmployers", true);
                            xhttp.send();
    }
}

function newSegment(){
    document.getElementById('segmentList').style.display ='none';
    document.getElementById('newSegment').style.display = 'block';
    //addEmployerContent("empl");
    var indetifier;
    function addEmployerContent(indetifier){
           var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function() {
                            var data,x = "",i,flen; 
                            if (this.readyState === 4 && this.status === 200) {
                                 data = JSON.parse(this.responseText);
                               flen = data.length;
                                 x='<select id="employer" data-placeholder="Employer" multiple class="chosen-select" tabindex="-1" style="display: none">';
                                 if (data!==null){
                                     for (i=0;i<flen;i++){
                                      x+= "<option>" + data[i] + "</option>";
                                     }
                                     x+='</select><div class="chosen-container chosen-container-multi" style="width: 0px;" title=""><ul class="chosen-choices"><li class="search-field"><input type="text" value="Employer" class="default" autocomplete="off" style="width: 71px;" tabindex="8"></li></ul><div class="chosen-drop"><ul class="chosen-results"></ul></div></div>';
                                     document.getElementById(indetifier).innerHTML = x;
                                 }
                                 
                            }
                         };
                         xhttp.open("GET", "http://localhost:8080/getDistinctAllEmployers", true);
                            xhttp.send();
    }
}




