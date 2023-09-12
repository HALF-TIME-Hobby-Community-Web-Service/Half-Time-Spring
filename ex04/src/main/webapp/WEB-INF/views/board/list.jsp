<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">


		<div class="panel panel-default">
			<div class="panel-heading">
				게시판 리스트
				<button id="regBtn" type="button" class="btn btn-xs pull-right">
					새 게시물 등록</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="board">
							<tr>
								<td>${board.bno}</td>
								<td><a class="move" href="${board.bno}">${board.title} <b>[${board.replyCnt}]</a></td>
								<td>${board.writer}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<form id="searchForm" method="get" action="/board/list">
					<select name="type">
						<option value="" ${pageMaker.cri.type==null   ?'selected':''  }>--</option>
						<option value="T" ${pageMaker.cri.type eq 'T'  ?'selected':''  }>제목</option>
						<option value="C" ${pageMaker.cri.type eq 'C'  ?'selected':''  }>내용</option>
						<option value="W" ${pageMaker.cri.type eq 'W'  ?'selected':''  }>작성자</option>
						<option value="TC" ${pageMaker.cri.type eq 'TC' ?'selected':''  }>제목
							+ 내용</option>
						<option value="TW" ${pageMaker.cri.type eq 'TW' ?'selected':''  }>제목
							+ 작성자</option>
						<option value="CW" ${pageMaker.cri.type eq 'CW' ?'selected':''  }>내용
							+ 작성자</option>
						<option value="TCW" ${pageMaker.cri.type eq 'TCW'?'selected':''  }>제목
							+내용 + 작성자</option>

					</select> <input type="text" name="keyword" value="${pageMaker.cri.keyword}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					<button>검색</button>
				</form>
				<div class='pull-right'>
					<ul class="pagination">
						<c:if test="${pageMaker.prev }">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage-1 }">Prev</a></li>
						</c:if>
						<c:forEach var="num" begin="${ pageMaker.startPage}"
							end="${pageMaker.endPage }">
							<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : "" } ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage+1 }">Next</a></li>
						</c:if>
						 
					</ul>
				</div>
				<!--  end Pagination -->
			</div>
			<form id="actionForm" method="get" action="/board/list">
				<input type="hidden" name="pageNum"
					value="${pageMaker.cri.pageNum }"> <input type="hidden"
					name="amount" value="${pageMaker.cri.amount  }"> <input
					type="hidden" name="type" value="${pageMaker.cri.type    }">
				<input type="hidden" name="keyword"
					value="${pageMaker.cri.keyword }">
			</form>


			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-hidden="true" aria-labelledby="myModalLabel">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								Changes</button>
						</div>
					</div>
				</div>
			</div>

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
		var origin = '${origin}'
		checkModal(origin);
		function checkModal(origin) {
			if (origin == '')
				return;
			var result = parseInt('${result}');
			if (origin == "register") {
					if (result > 0) {
					$(".modal-body").html(
					"게시글 " + result + " 번이 등록되었습니다.");
				}
			} else if (origin == "modify") {
				if (result > 0) {
				$(".modal-body").html("게시글 " + result + " 번이 수정되었습니다.");
				} else {
				$(".modal-body").html("게시글 수정에 실패하였습니다");
					}
				} else if (origin == "delete") {
						if (result > 0) {
							$(".modal-body").html(
									"게시글 " + result + " 번이 삭제되었습니다.");
						} else {
						$(".modal-body").html("게시글 삭제에 실패하였습니다");
					}
				} else
					return;
			$("#myModal").modal("show");
		}
		
			$("#regBtn").on("click", function() {
			self.location = "/board/register";
		});
			$(".paginate_button a").on("click",	function(e) {
				e.preventDefault(); //기본 동작 제한

				if ($("#actionForm").find("input[name='pageNum']")
					.val() == $(this).attr("href"))
					return;

					$("#actionForm").find("input[name='pageNum']")
					.val($(this).attr("href")); //이동하고 싶은 페이지 링크로 속성변경
					$("#actionForm").submit(); //속성변경한 다음에 섭밋

										});
		$(".move").on("click",function(e) {	//클릭이벤트객채의 기본동작 막기
			e.preventDefault();
			var actionForm = $("#actionForm")
			alert($(this).attr("href"))	//this는 클릭 이벤트 핸들러가 연결된 요소(여기서는 .move 클래스를 가진 링크)를 나타낸다.
			actionForm.append("<input type='hidden' name='bno' value='"
				+ $(this).attr("href")+ "'>")
		actionForm.attr("action","/board/get");
		actionForm.submit();
	})

		$("#searchForm button").on("click",	function(e) {
			if (!$("#searchForm").find(
					"option:selected").val()) {
				alert("검색 종류를 선택하세요.");
				return false;
			}
			if (!$("#searchForm").find(
					"input[name='keyword']").val()) {
				alert("키워드를 입력하세요.");
				return false;
			}
			$("#searchForm").find(
					"input[name='pageNum']").val("1");
			e.preventDefault();
			$("#searchForm").submit();
		});
	});
</script>
<%@include file="../includes/footer.jsp"%>