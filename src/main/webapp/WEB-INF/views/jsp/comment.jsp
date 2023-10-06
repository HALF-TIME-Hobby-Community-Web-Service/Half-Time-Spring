<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h2>댓글 작성</h2>
<form class="comment" id="comment" >
	<div>
	<!-- rno: -->
	<input class="number_input" name="number" readonly type="hidden">
	<!--type="hidden"-->
	
	유저아이디:
	<input class="userid_input" name="userid" >
	
	<!-- bno: -->
	<input name="referenceid" readonly type="hidden">
	<br>
	댓글:
	<input class="comment_input" name="comment">
	
	<!-- like: -->
	<input name="like" readonly type="hidden">
	<br>
	페이지: 
	<select class="type_select" name="type">
	 <option value="0" selected>commu</option>
	 <option value="1" >moment</option>
	</select>
	
	<!-- date:  -->
	<input class="time_input" name="time" readonly> 
	<br>
	<button class="insertComment_btn" type="button"> 댓글입력 </button>
	</div>
</form>

<!-- 보일것 userid : 댓글내용 [작성날짜:  ] -->
<!-- 안보이지만 구성할 것  -->
<h2>커뮤페이지 댓글목록</h2>

<div class="commupage">
<ul id="commucomments"></ul>
</div>

<h2>모먼트페이지 댓글목록</h2>
<div class="momentpage">
<ul id="momentcomments"></ul>
</div>

</body>
</html>

<script>
$(()=>{
    // 실제로 써서 보내는 것들 
    const commentBtn = $('button.insertComment_btn');
    const userid = $('input.userid_input');
    const comment = $('input.comment_input');
    const type =$('select.type_select');

    $(commentBtn).click(() => {
        alert('댓글 버튼 클릭');

        $.ajax({
            url: 'http://localhost:8888/comment',
            method: 'POST',
            data: {
                userid: userid.val(),
                comment: comment.val(),
                type: type.val()
            },
            dataType: 'json',
            success: (response) => {
                alert(userid.val() + ' 님이 ' + type.val() + '에 댓글 [' + comment.val() + '] 입력 중');
                if (response == 0) {
                    alert('댓글 작성이 완료됐습니다');
                   
                    const newComment = $('<li></li>');
                    if (type.val() == 0) {
                        
                        alert('날짜받으러 갑니다');
                        $.ajax({
                            url: 'http://localhost:8888/commentGet',
                            method: 'POST',
                            data: {
                                userid: userid.val(),
                                comment: comment.val(),
                                type: type.val()
                            },
                            dataType: 'text',
                            success: (response) => {
                            	  newComment.text(userid.val() + '님의 댓글 (커뮤니티): ' + comment.val()+' (댓글작성시간:' + response+')');
                                  $('#commucomments').append(newComment);
 
                            },
                            error: (jqXhr, status) => {
                                alert(`실패: ${status}\n오류명:${jqXhr.statusCode}`);
                            },
                        });
                        
                    } else if (type.val() == 1) {
                        
                        alert('날짜받으러 갑니다');
                        $.ajax({
                            url: 'http://localhost:8888/commentGet',
                            method: 'POST',
                            data: {
                                userid: userid.val(),
                                comment: comment.val(),
                                type: type.val()
                            },
                            dataType: 'text',
                            success: (response) => {
                            	newComment.text(userid.val() + '님의 댓글 (모먼트): ' + comment.val() + ' (댓글작성시간:' + response+')');
                                $('#momentcomments').append(newComment);
  
                            },
                            error: (jqXhr, status) => {
                                alert(`실패: ${status}\n오류명:${jqXhr.statusCode}`);
                            },
                        });                     
                    }                             
                } else if (response == 1) {
                    alert('댓글 작성이 실패됐습니다');
                }
            },
            error: (jqXhr, status) => {
                alert(`실패: ${status}\n오류명:${jqXhr.statusCode}`);
            },
        });
    });
    
    
});
</script>

