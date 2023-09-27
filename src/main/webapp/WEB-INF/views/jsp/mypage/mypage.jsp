<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<script src="/resources/js/mypage.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
    <div class="mypageContent" style="border: 1px solid; height: 700px; background-color: rgb(247, 237, 224);">
        <div style="border: 1px solid;">가입된 커뮤니티 </div>
        <div class="mypageContainer_myCommu" style="width: 80%; height:45%; margin-left:  10%; border: 1px solid;">
            커뮤니티 띄워주세용 여기에~
        </div>
        <div class="mypageContainer_updateInfo" style="border: 1px solid; height: 5%;">
            <button class="update_info">개인정보 수정하기</button>
        </div>
        <div class="mypageContainer_resign" style="border: 1px solid; height: 5%;">
            <div>
                <button type="button" onclick="removeMember();">탈퇴하기</button>
            </div>
        </div>         

        <div class="mypageContainer_1" style="border: 1px solid; height: 5%;" >

           

        </div>
    </div>

</body>

</html>