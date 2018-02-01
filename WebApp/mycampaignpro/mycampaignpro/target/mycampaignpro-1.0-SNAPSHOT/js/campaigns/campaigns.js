/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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


var data = {
    
    onSave : function(){
        
    }
    
};


