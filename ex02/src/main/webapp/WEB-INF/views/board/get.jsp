<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>

<style>
	label{
		font-size: 15pt;
		font-weight: bold;
	}
</style>


<div class="row" style="padding-top: 20px;">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
			
					<div class="form-group">
						<label>No.</label>
						<input class="form-control" value='<c:out value="${board.bno }"/>' name="bno" readonly="readonly">
					</div>
					<div class="form-group">
						<label>제목</label>
						<input class="form-control" value='<c:out value="${board.title }"/>' name="title" readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="10" name="content" readonly="readonly"><c:out value="${board.content }"/></textarea>
					</div>
					
					<div class="form-group">
						<label>작성자</label>
						<input class="form-control" name="writer" value='<c:out value="${board.writer }"/>' readonly="readonly">
					</div>
					
					<button data-oper='modify' class="btn btn-primary" style="font-size: 14pt; background-color: #CC0000;">수정</button>
					<button data-oper='list' class="btn btn-primary" style="font-size: 14pt;">List</button>
					
					<form id='operForm' action="/board/modify" method="get">
						<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno }"/>'>
						<input type="hidden" id="pageNum" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
						<input type="hidden" id="amount" name="amount" value='<c:out value="${cri.amount }"/>'>
					</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function(){
		//operForm 변수에 operForm이라는 id를 가진 form을 넣는다.
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e){
			operForm.attr("action", "/board/modify").submit();
		});
		
		$("button[data-oper='list']").on("click", function(e){
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/list");
			operForm.submit();
		});
	});
</script>


<%@ include file="../includes/footer.jsp" %>