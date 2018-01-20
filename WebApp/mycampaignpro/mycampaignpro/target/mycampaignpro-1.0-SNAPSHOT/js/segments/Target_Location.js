/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var targetlocation = {
  
  selectCountry: function(){
      
      var countrySel = document.getElementById('countrySelect');
      var countryButton = document.getElementById('countryButton');
      var departmentButton = document.getElementById('countryButton');
      var resetButton = document.getElementById('countryButton');
      
      countrySel.style.display='block';
      countryButton.style.display='none';
      departmentButton.style.display='block';
      resetButton.style.display='block';
  }
      
  },
  selectDepartment: function(){
      
  },
  selectPrefecture: function(){
      
  },
  selectCity: function(){
      
  },
  selectPostal: function(){
      
  },
  
  resetLocationFilter: function(){
//      var selSchool = document.getElementById('schoolSelect');
//      var selDegree = document.getElementById('degreeSelect');
//      var selYear = document.getElementById('yearSelect');
//      var butSchool = document.getElementById('schoolButton');
//      var butDegree = document.getElementById('degreeButton');
//      var butYear = document.getElementById('yearButton');
//      var resetButton = document.getElementById('resetEduButton');
//      butSchool.style.display='block';
//      butDegree.style.display='none';
//      butYear.style.display='none';
//      resetButton.style.display='none';
//      selSchool.disabled=false;
//      selDegree.disabled=false;
//      selYear.deselected=true;
//      selSchool.deselected=true;
//      selDegree.deselected=true;
//      selYear.deselected=true;
//      selSchool.style.display='none';
//      selDegree.style.display='none';
//      selYear.style.display='none';
//      
//      targeteducation.addEduSchool('schoolSelect');
//      targeteducation.addEduDegree('degreeSelect',null);
//      targeteducation.addEduYear('yearSelect',null);
      
      
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
                         xhttp.open("GET", "URL", true);
                            xhttp.send();
                        }else{
                            var xhr = new XMLHttpRequest();
                                var url = FILTER_URL;
                                xhr.open("POST", url, true);
                                xhr.setRequestHeader("Content-type", "application/json");
                                
                                xhr.onreadystatechange = function () {
                                    var data,x,z,final,i,flen; 
                                    if (xhr.readyState === 4 && xhr.status === 200) {
                                           
                                            data = JSON.parse(xhr.responseText);
                                            
                                            alert("The response is:" + data);
                                            flen = data.length;
                                            
                                             if (data!==null){
                                                for (i=0;i<flen;i++){
                                                    x+= '<option value="' + data[i] + '">' + data[i] + '</option>';
                                                }
                                                alert("The x is" + x);
                                                document.getElementById(itemId).innerHTML = x;
                                             }
                                     }
                                };
                          
                                alert(selectedItems);
                                xhr.send(selectedItems);

                             
                             alert("The data passed to the other function: " + selectedItems);
                            
                        }
    }       
            
    
};
