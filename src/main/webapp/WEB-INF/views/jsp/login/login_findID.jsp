<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/login_find.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	
    <script src="/resources/js/login_findID.js"></script>
    <title>Login find_ID page</title>
    
     <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
    
</head>

<body>
    <div class="login_findID_class">
        <div class="login_container_logo">
            <a class="navbar-brand" href="./login" id="logo">HALF-TIME</a>
        </div>
   
        <div class="login_container_findID">
            <div class="login_container_border">
                <h2>아이디 찾기</h2>
                <h3>회원정보에 등록한 휴대전화로 인증</h3>
            <br>
                <form class="login_findID_form">
                    <div class="login_findID_box">
                    이름
                    <input class="form-control login_findID_input"
                        type="text"
                        name="login_findID"
                        max="10"
                        placeholder="이름을 입력하세요"
                        required="required"
                        id="exampleFormControlInput1">
                    </div><br>

                    <div class="login_findpnum_box">
                        핸드폰 번호
                        <br>
                        <select class="form-select form-select-lg mb-3 login_findpnum_select" name="login_pnum1" style="width:100%">
                            <option value="010" selected>010</option>
                            <option value="011">011</option>
                            <option value="017">017</option>
                        </select>
                            <input class="form-control login_findpnum1_input"
                                type="tel"
                                maxlength="4"
                                name="login_pnum2"
                                oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                                required="required">
                            <input class="form-control login_findpnum2_input"
                            type="tel"
                            maxlength="4"
                            name="login_pnum3"
                            oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                            required="required">
                            <br>
                            <button class="btn btn-light login_findpnum_checkbtn" type="button">아이디 찾기</button>
                    </div><br>
                </form>
            </div>
        </div>
    </div>

</body>
