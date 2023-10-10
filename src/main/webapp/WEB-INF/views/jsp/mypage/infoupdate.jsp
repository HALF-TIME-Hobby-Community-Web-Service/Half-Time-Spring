<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="/resources/js/update_info.js"></script>
</head>
<body>

    내정보<br>
    이름 : <input id="user_name" class="form-control" value='${name}' readonly><br>
    닉네임 : <input id="user_nickName" class="form-control" value='${nickname}' readonly><br>
    아이디: <input id="user_id" class="form-control" value='${id}' readonly><br>
    비밀번호: <input id="user_pwd" class="form-control" value='${pwd}' readonly><br>
    핸드폰 번호: <input id="user_phoneNum" class="form-control" value='${pnum}' readonly><br>
    생년월일: <input id="user_birth" class="form-control" value='${birth}' readonly><br>
    <hr>
    내 정보 수정하기
    <form  id="pw_update">
        비밀번호:
        <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2" name ="pw_update">
  		<button class="btn btn-outline-secondary" type="button" id="pw_updateBtn">Button</button>       
    </form>
    <form id="pnum_update">
        핸드폰 번호:
        <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2" name="pnum_update">
  		<button class="btn btn-outline-secondary" type="button" id="pnum_updateBtn">Button</button>
    </form>

</body>
</html>