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
