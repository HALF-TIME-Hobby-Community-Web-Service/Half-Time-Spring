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
댓글 작성 
<form class="comment1">
	<div>
	<!-- rno: -->
	<input name="number" readonly type="hidden">
	
	userid:
	<input class="userid_input" name="userid" >
	
	<!-- bno: -->
	<input name="referenceid" readonly type="hidden">
	
	comment:
	<input class="comment_input" name="comment">
	
	<!-- like: -->
	<input name="like" readonly type="hidden">
	
	type: 
	<select class="type_select" name="type">
	 <option value="0" selected>commu</option>
	 <option value="1" >moment</option>
	</select>
	
	<!-- date:  -->
	<input name="time" readonly type="hidden"> 
	<button class="insertComment_btn" type="button"> 댓글입력 </button>
	</div>
</form>
</body>
</html>

<script>
$(()=>{
    // $(document).ready() 함수 내부
    const commentBtn = $('button.insertComment_btn');
    const userid = $('input.userid_input');
    const comment = $('input.comment_input');
    const type =$('select.type_select');

    //alert('댓글 보내지는 중');

    $(commentBtn).click(()=> {
        // $(commentBtn).click() 함수 내부
        alert('댓글 버튼 클릭');

        $.ajax({
            url:'http://localhost:8888/comment',
            method:'POST',
            data: {
                userid: userid.val(),
                comment: comment.val(),
                type: type.val()
            },
            dataType: 'json',
            success:(response) => {
                alert(userid.val()+' 님이 '+type.val()+'에 댓글 ['+comment.val()+'] 입력 중');
				
                if(response == 0){
                    alert('댓글 작성이 완료됐습니다');
                }else if(response ==1){
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

