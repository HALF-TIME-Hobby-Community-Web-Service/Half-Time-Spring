<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="/resources/js/update_info.js"></script>
<script src="/resources/js/mypage.js"></script>
</head>
<body>

    내정보<br>
    이름 : <input id="user_name" value='${name}' readonly><br>
    닉네임 : <input id="user_nickName" value='${nickname}' readonly><br>
    아이디: <input id="user_id" value='${id}' readonly><br>
    비밀번호: <input id="user_pwd" value='${pwd}' readonly><br>
    핸드폰 번호: <input id="user_phoneNum" value='${pnum}' readonly><br>
    생년월일: <input id="user_birth" value='${birth}' readonly><br>
    <hr>
    내 정보 수정하기
    <form  id="pw_update">
        비밀번호:
        <input  type="password" name ="pw_update">
        <button id="pw_updateBtn">변경하기</button><br>
    </form>
    
    
    <form id="pnum_update">
        핸드폰 번호:
        <input name="pnum_update">
        <button id="pnum_updateBtn">변경하기</button>
    </form>




</body>



	


</html>