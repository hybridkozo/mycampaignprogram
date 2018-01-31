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

