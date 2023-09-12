<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
			게시글 수정 페이지		
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			<form action="/board/modify" method="post">
					<div class="form-group">
					<label>글번호</label>
					<input class="form-control" name='bno' value="${board.bno }" readonly="readonly">
					</div>
					<div class="form-group">
					<label>글제목</label>
					<input class="form-control" name='title' value="${board.title }">
					</div>
					<div class="form-group">
					<label>글내용</label>
					<textarea class="form-control" name='content' row="3" >${board.content}</textarea> 
					</div>
					<div class="form-group">
					<label>작성자</label>
					<input class="form-control" name='writer' value="${board.writer }" readonly="readonly">
					</div>
					<input type="hidden" name="pageNum" value="${cri.pageNum }">
					<input type="hidden" name="amount" value="${cri.amount }">
					<input type="hidden" name="pageNum" value="${cri.pageNum }">
					<input type="hidden" name="amount" value="${cri.amount }">
				<button type="submit" data-oper='modify' class="btn btn-default">수정하기</button>
				<button type="submit" data-oper='remove' class="btn btn-danger">삭제하기</button>
				</form>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<script type="text/javascript">
$(document).ready(function() {
	 var formObj = $("form");
	 $('button').on("click", function(e){
		 e.preventDefault();
		 var operation = $(this).data("oper");
		 //alert(operation);
		  if(operation == 'remove'){
		      formObj.attr("action", "/board/delete");
		      
		    }
		  formObj.submit();
	 });
	
})
</script>
<%@include file="../includes/footer.jsp"%>