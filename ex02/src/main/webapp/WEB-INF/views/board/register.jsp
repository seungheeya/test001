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
		<h2 class="m-0 font-weight-bold text-primary">글 등록</h2>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<form role="form" action="/board/register" method="post">
					<div class="form-group">
						<label>제목</label>
						<input class="form-control" name="title">
					</div>
					
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="10" name="content"></textarea>
					</div>
					
					<div class="form-group">
						<label>작성자</label>
						<input class="form-control" name="writer">
					</div>
					
					<button class="btn btn-primary" type="submit" style="font-size: 14pt;">등록</button>
					<button class="btn btn-primary" type="reset" style="font-size: 14pt; background-color: #CC0000;">리셋</button>
				</form>
			</div>
		</div>
	</div>
</div>


<%@ include file="../includes/footer.jsp" %>