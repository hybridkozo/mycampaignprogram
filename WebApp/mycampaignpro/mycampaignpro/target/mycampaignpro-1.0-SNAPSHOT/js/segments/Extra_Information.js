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

