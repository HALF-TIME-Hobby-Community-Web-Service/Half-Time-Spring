<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">등록 페이지</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form method="post" action="/board/register">
					<input type="text" name="title"><br>
					<textarea name="content" rows="3"></textarea>
					<br> <input type="text" name="writer"><br>
					<button type="submit">전송</button>
					<button type="reset">초기화</button>
				</form>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->


<%@include file="../includes/footer.jsp"%>
