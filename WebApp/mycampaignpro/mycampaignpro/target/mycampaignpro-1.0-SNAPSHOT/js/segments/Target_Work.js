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
           alert('THe all has been selected....');
       }
       document.getElementById('positionButton').style.display='none';
       document.getElementById('positionSelect').style.display='block';
       alert(employerSelOpt);
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
                                            
                                            alert("The response is:" + data);
                                            flen = data.length;
                                            
                                             if (data!==null){
                                                for (i=0;i<flen;i++){
                                                    x+= '<option value="' + data[i] + '">' + data[i] + '</option>';
                                                }
                                                alert("The x is" + x);
                                                document.getElementById(positionId).innerHTML = x;
                                             }
                                     }
                                };
                          
                                alert(argList);
                                xhr.send(argList);

                             
                             alert("The data passed to the other function: " + argList);
                         }
    }
    
    
};
