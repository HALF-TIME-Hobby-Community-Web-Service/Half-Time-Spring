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

	유저아이디:
	<input class="userid_input" name="userid" >
	<br>
	
	페이지: 
	<select class="type_select" name="type">
	 <option value="0" selected>commu</option>
	 <option value="1" >moment</option>
	</select>
	<br>
	
	글번호: 
	<select class="num_select" name="num">
	<option value="1" selected>1번</option>
	<option value="2" >2번</option>
	<option value="3" >3번</option>
	<option value="4" >4번</option>
	</select>
	<br>
	
	댓글:
	<input class="comment_input" name="comment">
	<br>
	
	<br>
	<button class="insertComment_btn" type="button"> 댓글입력 </button>
	</div>
</form>

<!-- 보일것 userid : 댓글내용 [작성날짜:  ] -->
<!-- 안보이지만 구성할 것  -->
<h3>커뮤페이지 댓글목록</h3>

<div class="commupage">
<ul id="commucomments"></ul>
</div>

<h3>모먼트페이지 댓글목록</h3>
<div class="momentpage">
<ul id="momentcomments"></ul>
</div>

<h2> 댓글 보기</h2>
<div>
페이지: 
	<select class="type_select1" name="type">
	 <option value="0" selected>commu</option>
	 <option value="1" >moment</option>
	</select>
	<br>

글번호: 
	<select class="referenceid_select1" name="referenceid">
	<option value="1" selected>1번 글</option>
	<option value="2" >2번 글</option>
	<option value="3" >3번 글</option>
	<option value="4" >4번 글</option>
	</select>
	<br>
	
<button class="selectComment_btn" type="button"> 댓글보기 </button>
</div>

<h2>댓글목록</h2>
<ul id="commentsList"></ul>

</body>
</html>

<script>
$(()=>{
    // 실제로 써서 보내는 것들 
    const commentBtn = $('button.insertComment_btn');
    const userid = $('input.userid_input');
    const commenttext = $('input.comment_input');
    const commenttype = $('select.type_select');
    const referenceid = $('select.num_select');
    
  
    $(commentBtn).click(() => {
        alert('댓글 버튼 클릭');
      
        $.ajax({
            url: 'http://localhost:8888/comment',
            method: 'POST',
            data: {
                userid: userid.val(),
                commenttext: commenttext.val(),
                commenttype: commenttype.val(),
                referenceid: referenceid.val()
            },
            dataType: 'json',
            success: (response) => {
               // alert(userid.val() + ' 님이 ' + commenttype.val() + '페이지 '+referenceid.val()+' 번 글에 댓글 [' + commenttext.val() + '] 입력 중');
                if (response == 0) {
                    alert('댓글 작성이 완료됐습니다');
                
                    const newComment = $('<li></li>');
                    if (commenttype.val() == 0) {
                        
                        //alert('날짜받으러 갑니다');
                        $.ajax({
                            url: 'http://localhost:8888/commentGet',
                            method: 'POST',
                            data: {
                                userid: userid.val(),
                                commenttext: commenttext.val(),
                                commenttype: commenttype.val(),
                                referenceid: referenceid.val()
                            },
                            dataType: 'text',
                            success: (response) => {
                            	  newComment.text(userid.val() + '님의 댓글 (커뮤니티): ' + commenttext.val()+' (댓글작성시간:' + response+')');
                                  $('#commucomments').append(newComment);
 
                            },
                            error: (jqXhr, status) => {
                                alert(`실패: ${status}\n오류명:${jqXhr.statusCode}`);
                            },
                        });
                        
                    } else if (commenttype.val() == 1) {
                        
                       // alert('날짜받으러 갑니다');
                        $.ajax({
                            url: 'http://localhost:8888/commentGet',
                            method: 'POST',
                            data: {
                                userid: userid.val(),
                                commenttext: commenttext.val(),
                                commenttype: commenttype.val(),
                                referenceid: referenceid.val()
                            },
                            dataType: 'text',
                            success: (response) => {
                            	newComment.text(userid.val() + '님의 댓글 (모먼트): ' + commenttext.val() + ' (댓글작성시간:' + response+')');
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

// 댓글보기
$(()=>{

    const commenttype = $('select.type_select1');
    const pageNum = $('select.referenceid_select1');
    const commentBtn = $('button.selectComment_btn');

    $(commentBtn).click(()=>{
        alert('댓글보기 버튼클릭');
        alert(commenttype.val()+' 페이지'+ pageNum.val() +' 번째 글의 댓글을 가져옵니다.');
        
        $.ajax({
            url:'http://localhost:8888/commentSelect',
            method:'post',
            data:{
                referenceid:pageNum.val(),
                commenttype:commenttype.val()
            },
            //dataType:'text',
            dataType:'json',
            success:(response) =>{
               // alert('댓글 확인후 돌아오는 거 성공');
                
                const commentsList = $("#commentsList");
                commentsList.empty();
                
                for(var i = 0; i<response.length; i++){
                	commentsList.append("<li>" +response[i].userid+"님의 댓글[ "+ response[i].commenttext+" ] (댓글작성시간"+response[i].commenttime+")"+"</li>");
                }
            },
            error: (jqXhr, status) => {
                alert(`실패: ${status}\n오류명:${jqXhr.statusCode}`);
            },

        })
    })


});
</script>


