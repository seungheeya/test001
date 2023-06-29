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
				<form role="form" action="/board/modify" method="post">
				
				<input type="hidden" name="pageNum" value="<c:out value="${cri.pageNum }"/>">
				<input type="hidden" name="amount" value="<c:out value="${cri.amount }"/>">
				
					<div class="form-group">
						<label>No.</label>
						<input class="form-control" value='<c:out value="${board.bno }"/>' name="bno" readonly="readonly">
					</div>
					<div class="form-group">
						<label>제목</label>
						<input class="form-control" value='<c:out value="${board.title }"/>' name="title">
					</div>
					
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="10" name="content"><c:out value="${board.content }"/></textarea>
					</div>
					
					<div class="form-group">
						<label>작성자</label>
						<input class="form-control" name="writer" value='<c:out value="${board.writer }"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>작성일</label>
						<input class="form-control" name="cdate" value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${board.cdate }" />' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>수정일</label>
						<input class="form-control" name="udate" value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${board.udate }" />' readonly="readonly">
					</div>
					
					<button type="submit" data-oper="modify" class="btn btn-primary" style="font-size: 14pt;">수정</button>
					<button type="submit" data-oper='remove' class="btn btn-primary" style="font-size: 14pt; background-color: #CC0000;">삭제</button>
					<button type="submit" data-oper='list' class="btn btn-primary" style="font-size: 14pt;">List</button>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function(){
		var formObj = $("form");
		$('button').on("click", function(e){
			//form태그 내의 모든 버튼은 기본적으로 submit을 수행하기 때문에 e.preventDefault()로 기본 동작을
			//막고 마지막에 직접 submit()을 수행.
			e.preventDefault();
			
			//button 태그의 data-oper의 속성값이 operation에 들어간다. (modify, remove, list 등)
			var operation = $(this).data("oper");
			console.log(operation);
			
			if(operation === 'remove'){
				formObj.attr("action" , "/board/remove");
			}
			else if(operation === 'list'){
				//move to list
				formObj.attr("action", "/board/list").attr("method", "get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
			}
			
			formObj.submit();
		});
	});
</script>


<%@ include file="../includes/footer.jsp" %>