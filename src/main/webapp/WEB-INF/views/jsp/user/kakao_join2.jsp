<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/join2.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/resources/js/join2.js"></script>
    <title>join page2</title>
</head>

<body>
    <div class="login_container_logo">
        <a class="navbar-brand" href="./login" id="logo">HALF-TIME</a>
    </div>
    <div class="join_content">
        <form class="join_container" action="../html/navbar.html">
            <div class="join_container_border">
                <div class="join_userlocation_box">
                    관심지역
                    <input class="join_userlocation_input" 
                        type="text"
                        name="join_userlocation"
                        maxlength="15"
                        placeholder="관심지역(집/회사)"
        
                        required="required">
                    <button class="join_userlocation_addbtn">추가</button>
                    <br>
                </div><br>

                <div class="join_category_box">
                    관심취미
                    <input class="join_category_input" 
                        type="text"
                        name="join_category"
                        maxlength="15"
                        placeholder="관심취미"
                        required="required">
                    <button class="join_category_addbtn">추가</button>
                    <br>
                </div><br>
            </div>
            <button class="join_pagebtn">회원가입 완료</button>
        </form>
    </div>
</body>
</html>