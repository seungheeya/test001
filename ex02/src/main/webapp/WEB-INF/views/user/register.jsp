<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<html>
<head>

</head>
<style>
	.form-control{
		width: 300px;
	}
	
	.row{
		margin-top: 30px;
	}
</style>
<body>

<div class="row" style="padding-top: 20px;">
	<div class="col-lg-12">
		<h2 class="m-0 font-weight-bold text-primary">회원가입</h2>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<form role="form" action="/user/register" method="post">
					<div class="form-group">
						<label>ID</label>
						<input class="form-control" name="id">
					</div>
					<div class="form-group">
						<label>E-Mail</label>
						<input class="form-control" name="email">
					</div>
					<div class="form-group">
						<label>Password</label>
						<input class="form-control" name="password" type="password">
					</div>
					<div class="form-group" style="margin-bottom: 30px;">
						<label>Name</label>
						<input class="form-control" name="name">
					</div>
		
					<button class="btn btn-primary" type="submit">회원가입</button>
					<button class="btn btn-primary" type="reset">Reset</button>
					<button id="btnBack" class="btn btn-primary" type="button">뒤로 가기</button>
		
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../includes/footer.jsp" %>
	
</body>
<script type="text/javascript">
	$(function(){
		$('#btnBack').on("click", function(e){
			window.location.href = "/board/list";
		});
	});
</script>
</html>