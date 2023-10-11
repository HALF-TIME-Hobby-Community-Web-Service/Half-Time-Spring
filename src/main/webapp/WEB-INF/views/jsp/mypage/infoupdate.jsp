<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<script src="/resources/js/update_info.js"></script>

	<div class="update_content" style="margin:20px;">
	    <div style="margin-bottom: 20px;">
	    	<span style="font-weight: bolder; font-size: 24px;">내정보</span>
	    	<button class="closebtn btn" style="float:right;">X</button>
    	</div>
    	<div style="background-color: #fffae5; border: 1px solid; border-radius: 5px; padding:10px;">
		    이름 : <input id="user_name" class="form-control" value='${name}' readonly>
		    닉네임 : <input id="user_nickName" class="form-control" value='${nickname}' readonly><br>
		    아이디: <input id="user_id" class="form-control" value='${id}' readonly>
		    비밀번호: <input id="user_pwd" class="form-control" value='${pwd}' readonly><br>
		    핸드폰 번호: <input id="user_phoneNum" class="form-control" value='${pnum}' readonly>
		    생년월일: <input id="user_birth" class="form-control" value='${birth}' readonly><br>
		    <hr>
		    <span style="font-weight: bolder; font-size: 24px;">내 정보 수정하기</span>
		    <form  id="pw_update">
		        비밀번호: &nbsp;&nbsp;&nbsp;&nbsp;
		        <input type="text" class="form-control" name ="pw_update" style="margin-left:5%; width:50%; display: inline;">
		  		<button class="btn btn-outline-secondary" type="button" id="pw_updateBtn">Button</button>       
		    </form>
		    <form id="pnum_update">
		        핸드폰 번호:
		        <input type="text" class="form-control" name="pnum_update" style="margin-left:5%; width:50%; display: inline;">
		  		<button class="btn btn-outline-secondary" type="button" id="pnum_updateBtn">Button</button>
		    </form>
	    </div>
    </div>
    
    <script>
   	  $('.closebtn').click(()=>{
		  $('.mypageContent').css('display','none');
	  })
	</script>