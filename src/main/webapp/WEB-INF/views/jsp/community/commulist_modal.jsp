<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
  <div id="modalWrap">
    <div id="modalBody">
      <div class="cmodal_title_box">
	      <h3 class="modaltitle"></h3>
	      <div class="modalaround"></div>
      </div>
	  <hr>
      <div class="cmodal_container">
		  <img class="modalimg" src="" onerror="this.src='/resources/items/commu_preview_default.png'">
	      <div class="modalintro">
	        <span class="modalintro2"></span>
	      </div>
      </div>
	  <div class="btns">
	      <button class="modalbtn btn btn-primary" id="commuSignup">가입하기</button>
	      <button class="modalclose btn btn-danger ">닫기</button>
	  </div>
    </div>
  </div>
</body>