<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    
  <link rel="stylesheet" href="/resources/css/modal.css">  
  <link rel="stylesheet" href="/resources/css/commu_make.css">
  
  <script src="/resources/js/commu_make.js"></script>
    
</head>
<body>
  <div class="cmake_content modal_content ">
    <div class="modal_title"> 
	   	⚡커뮤니티 개설
    <span class="modal_closebtn cmake_closebtn">&times;</span>
	  </div>
    
    <div class="cmake_container">      
      <form class="cmake_form" method="post" action="">         
        <div class="cmake_left">
          <div class="modal_subtitle">커뮤니티 기본 정보</div>
          <input class="form-control" name="communame" placeholder="커뮤니티 이름" />
          <textarea  placeholder="커뮤니티 소개" class="form-control" name="commuintro" style="width: 90%; height: 200px; max-height: 400px;"></textarea>
          
          <div class="form-floating selectBox">
            <select class="form-select lcate">
              <option>카테고리 대분류</option>            
            </select>
            <select class="form-select scate" name="commucategory">
              <option>카테고리 소분류</option>            
            </select>
          </div>
          <input class="form-control" name="commulocation" placeholder="커뮤니티 지역" />
          <hr>
          <div class="buttonBox">
            <button type="button" class="btn btn-primary next">다음</button>          
          </div>
        </div>
        <div class="cmake_center">
          <div class="modal_subtitle">커뮤니티 대표 이미지</div>
          <img class="commu_img" src="/resources/items/moment/moment_default.png" />
          <input type="file" class="form-control commu_file" name="img" /> 
          <hr>
          <div class="buttonBox">
            <button type="button" class="btn btn-danger back">이전</button>
            <button type="button" class="btn btn-primary next">다음</button>
          </div>
        </div>
        <div class="cmake_right">
          <div class="modal_subtitle">커뮤니티 설정</div>
          <input class="form-control" name="capacity" type="number" placeholder="커뮤니티 총원 (기본: 50)"/>  

          <div class="form-check form-switch mtop30px">
            <input class="form-check-input age_check" type="checkbox" role="switch" id="flexSwitchCheckDefault">
            <label class="form-check-label" for="flexSwitchCheckDefault">나이제한</label>
          </div>          
          <div class="age_box">
            <input class="form-control age" name="agelimitmin" type="number"  placeholder="최소" />
            <input class="form-control age" name="agelimitmax" type="number"  placeholder="최대" />
          </div>
          <div class="form-check form-switch mtop30px">
            <input class="form-check-input gender_check" type="checkbox" role="switch" id="flexSwitchCheckDefault">
            <label class="form-check-label" for="flexSwitchCheckDefault">성별제한</label>
          </div>
          <div class="form-floating genderbox" >
            <select class="form-select" name="gender">
              <option value="all">성별 - 모두</option>
              <option value="man">남자만</option>
              <option value="woman">여자만</option>
            </select>
          </div>
          <hr>
          <div class="buttonBox">
            <button type="button" class="btn btn-danger back">이전</button>
            <button type="button" class="btn btn-primary next">다음</button>
          </div>

        </div>
      	<div class="cmake_rightright">
      	  <div class="modal_subtitle">커뮤니티 닉네임</div>
	      <input class="form-control" name="cnickname" placeholder="커뮤니티에서 활동할 닉네임을 적어주세요." required/>
          <div class="buttonBox">
            <button type="button" class="btn btn-danger back">이전</button>
            <button type="submit" class="btn btn-success create">커뮤니티 생성</button>
          </div>
      	</div>
      </form>      
    </div>
  </div>
  

</body>