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
    <script src="/resources/js/login_findPW.js"></script>
    <title>Login find_PW page</title>
    
      <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
</head>

<body>
    <div class="login_findPW_class">
        <div class="login_container_logo">
            <a class="navbar-brand" href="./login" id="logo">HALF-TIME</a>
        </div>
   
        <div class="login_container_findPW">
            <h2>비밀번호 찾기</h2>
            <h3>회원정보에 등록한 휴대전화로 인증</h3>
            <br>
        
            <form class="login_findPW_form">

                <form class="login_findPW_ID_form">
                    <div class="login_findPW_box">
                        아이디
                    <input class="form-control login_findPW_input"
                        type="text"
                        name="login_findPW_ID"
                        max="10"
                        placeholder="아이디를 입력하세요"
                        required="required">
                        <br>
                    <button class="btn btn-light login_findPW_ID_checkbtn" type="button">확인</button>
                    </div><br>
                </form>

                <div class="login_findPW_name_box">
                    이름
                    <input class="form-control login_findPW_name_input"
                    type="text"
                    name="login_findPW_name"
                    max="10"
                    required="required"
                    >
                </div><br>

                <div class="login_findPW_gender_box">
                    성별
                    <select class="form-select form-select-lg mb-3 login_findPW_gender_select"
                    name="login_findPW_gender" style="width:100%">
                        <option value="0" selected>남</option>
                        <option value="1">여</option>
                    </select>
                </div><br>

                <div class="login_findPW_birth_box">
                    생년월일
                    <br>
                    <input class="form-control login_findPW_birth_input"
                        type="date"
                        name="login_findPW_birth"
                        required="required"> 
                </div><br>

                <div class="login_findPW_pnum_box">
                    핸드폰 번호
                    <br>
                    <select class="form-select form-select-lg mb-3 login_findPW_pnum_select" name="login_findPW_pnum" style="width:100%">
                        <option value="010" selected>010</option>
                        <option value="011">011</option>
                        <option value="017">017</option>
                    </select>
                        <input class="form-control login_findPW_pnum1_input"
                            type="tel"
                            maxlength="4"
                            name="login_findPW_pnum1"
                            oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                            required="required"
                            >
                        <input class="form-control login_findPW_pnum2_input"
                        type="tel"
                        maxlength="4"
                        name="login_findPW_pnum2"
                        oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                        required="required"
                       >
                        <br>
                        <button class="btn btn-light login_findPW_pnum_checkbtn" type="button">비밀번호 찾기</button>
                </div><br>
            </form>
        </div>
    </div>

</body>

<footer>
아이디가 기억나지 않는다면? 
<button class="login_findPW_findIDbtn" onclick="location.href='http://localhost:8888/user/findid'">아이디 찾기</button>
</footer>

