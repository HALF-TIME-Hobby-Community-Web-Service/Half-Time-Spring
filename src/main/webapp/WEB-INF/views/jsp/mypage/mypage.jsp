<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>

<jsp:include page="../header.jsp" />
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
                <button>탈퇴하기</button>
            </div>
        </div>
        <div class="mypageContainer_logout" style="border: 1px solid; height: 5%;" >
        	<button id=logoutBtn>Logout</button>            
        </div>
    </div>

</body>
</html>