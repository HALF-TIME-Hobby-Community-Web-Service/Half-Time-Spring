<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">게시글 내용 페이지</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="form-group">
					<label>글번호</label> <input class="form-control" name='bno'
						value="${board.bno }" readonly="readonly">
				</div>
				<div class="form-group">
					<label>글제목</label> <input class="form-control" name='title'
						value="${board.title }" readonly="readonly">
				</div>
				<div class="form-group">
					<label>글내용</label>
					<textarea class="form-control" name='content' row="3"
						readonly="readonly">${board.content}</textarea>
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name='writer'
						value="${board.writer }" readonly="readonly">
				</div>
				<button data-oper='modify' class="btn btn-default">수정하기</button>
				<button data-oper='list' class="btn btn-info">리스트로</button>
				<form id='operForm' action="/boad/modify" method="get">
					<input type='hidden' id='bno' name='bno' value="${board.bno}">
					<input type='hidden' name='pageNum' value="${cri.pageNum}">
					<input type='hidden' name='amount' value="${cri.amount}"> <input
						type='hidden' name='type' value="${cri.type}"> <input
						type='hidden' name='keyword' value="${cri.keyword}">
				</form>


			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				댓글
				<button id='addReplyBtn' class="btn pull-right btn-primary btn">댓글
					달기</button>
			</div>

			<div class="panel-body">
				<ul class="chat">
					<li>1</li>
					<li>2</li>					
				</ul>

			</div>
			<!-- /.panel-body -->
			<div class="panel-footer">
				
			</div>
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">┏(゜ω゜)=👉ヾ♪댓글창</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>내용</label><input class="form-control" type="text"
						name="reply"></input>
				</div>
				<div class="form-group">
					<label>작성자</label><input class="form-control" type="text"
						name="replyer"></input>
				</div>
				<div class="form-group">
					<label>작성일</label><input class="form-control" type="text"
						name="replyDate"></input>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-warning" id="modalModBtn">수정</button>
				<button type="button" class="btn btn-primary" id="modalRegisterBtn">저장</button>
				<button type="button" class="btn btn-danger" id="modalRemoveBtn">삭제</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script type="text/javascript">
$(document).ready(function() {
     function showList(page){ 
    	 console.log("page:" + page);
         replyService.getList(
              {bno:${board.bno}, page:page || 1},
              function(replyCnt, list){
              	console.log("count:" + replyCnt);
              	console.log("list:" + list);
              	if(page == -1){
              		pageNum = Math.ceil(replyCnt/10.0);
              		showList(pageNum);
              		return;
              	}
                var str = "" ;
                if(list ==null || list.length ==0){
                    replyUL.html("");
                    return;
                 }
                 for(var i=0, len=list.length; i<len; i++){
                    list[i].rno
                    str += "<li class='left clearfix' data-rno='" + list[i].rno +"'>";
                    str += list[i].replyer + ":" + list[i].reply+ "(" 
                          +replyService.displayTime(list[i].replyDate) + ")";
                    str += "</li>";
                  
                 }
                 replyUL.html(str);
                 showReplyPage(replyCnt);
              }
          );
      }
   
     $("button[data-oper='modify']").on("click", function(){
          
        $("#operForm").attr("action","/board/modify").submit();
          
        });
     $("button[data-oper='list']").on("click", function(){ //그냥 location.href로 해도 됨
          
        $("#operForm").find("#bno").remove();
        $("#operForm").attr("action","/board/list").submit();
          
        });      

  
        
         var replyUL = $(".chat");
         showList(1);
           
     
         var modalDiv = $('#myModal');
         var modalInputReply = modalDiv.find("input[name='reply']");
         var modalInputReplyer = modalDiv.find("input[name='replyer']");
         var modalInputReplyDate = modalDiv.find("input[name='replyDate']");
         var modalModBtn = $("#modalModBtn");
         var modalRemoveBtn = $("#modalRemoveBtn");
         var modalRegisterBtn = $("#modalRegisterBtn");
          
        
    $("#addReplyBtn").on('click', function(e){
        modalInputReplyDate.closest("div").hide();
        //    modalInputReply.val("");
        //    modalInputReplyer.val("");
        modalDiv.find("input").val("");
        modalModBtn.hide();
        modalRemoveBtn.hide();     
        modalRegisterBtn.show();
        modalDiv.modal("show");
    });
           
	$("#modalRegisterBtn").on('click', function(e) {
     	var reply ={
           reply : modalInputReply.val(),
           replyer : modalInputReplyer.val(),
           bno : ${board.bno}  
        };
     	alert(reply);
        replyService.add(reply, function(result){
          alert("댓글달기: ["+result+"]");
          modalDiv.modal("hide");
          showList(-1);
        });
    });  
        
	$(".chat").on("click", "li", function(e) {
		var rno = $(this).data("rno");
		replyService.get(rno, function(reply) {
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			modalInputReplyDate.val(replyService.displayTime(reply.replyDate))
				.attr("readonly", "readonly");
			modalDiv.data("rno", reply.rno);
			modalModBtn.show();
			modalRemoveBtn.show();
			modalRegisterBtn.hide();			
			modalDiv.modal("show");
		});
	});            
	
	
	modalModBtn.on("click", function(e){
		var reply ={
			rno : modalDiv.data("rno"),
			reply : modalInputReply.val()
		};
		
		replyService.update(reply, function(result){
			alert(result);
			modalDiv.modal('hide');
			showList(pageNum);
		});
	});
	
	modalRemoveBtn.on("click", function(e) {
		replyService.remove(
			modalDiv.data("rno"), 
			function(result){
				alert(result);
				modalDiv.modal('hide');
				showList(pageNum);
			}
		);
	});	
	
	var replyPageFooter = $(".panel-footer");
	var pageNum = 1;
	
	function showReplyPage(replyCnt){
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum - 9;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= replyCnt){
		   endNum = Math.ceil(replyCnt/10.0);
		}
		
		if(endNum * 10 < replyCnt){
			next = true;
		}
		
		var str = "<ul class='pagination pull-right'>";
		if(prev){
			str += "<li class='page-item'><a class='page-link' href='" 
			+ (startNum - 1) + "'>이전</a></li>";
		}
		for(var i = startNum; i <= endNum; i++){
			var active = pageNum == i ? "active" : "";
			str += "<li class='page-item " + active + "'><a class='page-link' href='" 
				+ i + "'>" + i ;
			str += "</a></li>";
		}
		if(next){
			str += "<li class='page-item'><a class='page-link' href='" 
			+ (endNum + 1) + "'>다음</a></li>";
		}
		str += "</ul>";
		
		replyPageFooter.html(str);		
	}
	
	replyPageFooter.on("click", "li a", function(e) {		
		e.preventDefault();
		pageNum = $(this).attr("href")
		showList(pageNum);
	});
		
});
					
			/**
			replyService.add(
				 {bno:57, reply:'자바스크립트 테스트', replyer:'test겨운'},
				 function(result){
					 alert("결과:" +result);
				 }
			);     


			replyService.getList(
			{bno:${board.bno}, page:1},
			function(list){
				for(var i=0, len=list.length; i < len; i++){
					console.log(list[i]);
				}
			}
		);
							
							
			replyService.remove(20, function(result){
			 console.log(result);    	 
			});     
					 
						 
			 replyService.update(
				{
					rno: 14,
					reply: '3333~~'
				},
				function(result){
					alert(result);
				}    		  
			 );
				 */

</script>
<%@include file="../includes/footer.jsp"%>