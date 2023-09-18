<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/join.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/resources/js/join.js"></script>
    <title>join page</title>
</head>

<body>
    <div class="login_container_logo">
        <a class="navbar-brand" href="#" id="logo">HALF-TIME</a>
    </div>
    <div class="join_content">
        <form class="join_container">
            <div class="join_container_border">
                <div class="join_ID_box">
                    아아디

                            <input class="join_ID_input" 
                                type="text"
                                name="join_ID"
                                maxlength="10"
                                placeholder="아이디를 입력하세요"
                                style="width: 150px;"
                                required="required">
                            <select class="join_ID_select" name="join_ID2">
                                <option value="@naver.com" selected>@naver.com</option>
                                <option value="@hanmail.net">@hanmail.net</option>
                                <option value="@kakao.com">@kakao.com</option>
                                <option value="@gmail.com">@gmail.com</option>
                                <option value="@nate.com">@nate.com</option>
                            </select>                 
                            <button class="join_id_checkbtn" type="button">중복확인</button>

                </div><br>
                <div class="join_PW_box">
                    비밀번호
                    <input class="join_PW_input"
                        type="password"
                        name="join_PW"
                        required="required"><br>
                </div><br>
                <div class="jpin_PW_box1">
                    비밀번호확인
                    <input class="join_PW2_input"
                        type="password"
                        name="join_pwcheck"
                        required="required">
                    <button class="join_PW_checkbtn">확인</button>
                </div><br>
                <div class="join_name_box">
                    이름
                    <input class="join_name_input"
                        type="text"
                        name="join_name"
                        required="required">
                </div><br>
                <div class="join_birth_box">
                    생년월일
                    <input class="join_birth_input"
                        type="date"
                        name="join_birth"
                        required="required"> 
                </div><br>
                <div class="join_gender_box">
                    성별
                    <select class="join_gender_select" name="join_gender">
                        <option value="0" selected>남</option>
                        <option value="1">여</option>
                    </select>
                </div><br>

                <div class="join_address_box">
                    주소
                    <input class="join_address_input"
                    type="text"
                    name="join_address">
                </div><br>

                <div class="join_pnum_box">
                    핸드폰 번호
                    <select class="join_pnum_select" name="join_pnum1">
                        <option value="010" selected>010</option>
                        <option value="011">011</option>
                        <option value="017">017</option>
                    </select>
                        <input class="join_pnum1_input"
                            type="tel"
                            maxlength="4"
                            name="join_pnum2"
                            oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                            required="required">
                        <input class="join_pnum2_input"
                        type="tel"
                        maxlength="4"
                        name="join_pnum3"
                        oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                        required="required">
                        <button class="join_pnum_checkbtn" type="button">인증</button>
                </div><br>
                <div class="join_nickname_box">
                    닉네임
                    <input class="join_nickname_input"
                    type="text"
                    name="join_nickname"
                    maxlength="8"
                    placeholder="최대8자리"
                    required="required">
                </div><br>
            </div>
            <button class="join_nextpagebtn1">다음</button>
        </form>
    </div>
</body>
</html>