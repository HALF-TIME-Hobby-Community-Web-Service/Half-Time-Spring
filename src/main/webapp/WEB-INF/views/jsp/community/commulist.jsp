<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
  <jsp:include page="./commu_join_modal.jsp"/>  	
  <jsp:include page="./commulist_modal.jsp"/>
  <jsp:include page="./commu_make.jsp"/>

  <link rel="stylesheet" href="/resources/css/commulist.css" />
  <script src="/resources/js/commulist.js"></script>  


	  
  <div class="commuevery">    
    <div class="list community" id="community">
      <div class="commuBox_clone">
        <p class="commuName"></p>
        <hr style="width: 90%; margin-left: 5%;" >
        <img src="" class="img" onerror="this.src='/resources/items/commu_preview_default.png'">
      </div>
    </div>    
  </div>
  

  
  <script>
  $('.fab_container').html('');
  $('.fab_container').append('<div class="fab clist-float">'
  						 + '<img src="/resources/items/floatitem/close.png" alt="">'
  						 + '</div>');
  </script>