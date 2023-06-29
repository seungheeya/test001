<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>

                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h2 class="m-0 font-weight-bold text-primary" style="float: left; padding-top: 7px;">Board List</h2>
                            <form id="loginForm" action="/user/login" method="post" style="float: left; width: 550px; margin-left: 1000px; padding-top: 5px;">
                            	<label>아이디</label>
                            	<input type="text" id="id" name="id" style="width: 200px;">
                            	<label>비밀번호</label>
                            	<input type="password" id="password" name="password" style="width: 200px;">
                            </form>
                            <button id="btnUserLogin" class="btn btn-primary" type="button" style="font-size: 16pt;">로그인</button>
                            <button id="btnUserReg" class="btn btn-primary" type="button" style="font-size: 16pt;">회원가입</button>
                            <button id="regBtn" class="btn btn-primary" type="button" style=" font-size: 16pt; margin-left: 70px;">Register New Board</button>
                        </div>
                  
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" width="100%" cellspacing="0" style="text-align: center;">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>수정일</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${list }" var="board">
                                    <tr>
                                    	<td><c:out value="${board.bno }" /></td>
                                    	<td><a class="move" href='<c:out value="${board.bno }"/>'><c:out value="${board.title }" /></a></td>
                                    	<td><c:out value="${board.writer }"/></td>
                                    	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.cdate }"/></td>
                                    	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.udate }"/></td>
                                    </tr>
                                    </c:forEach>
                                    
                                </table>
                                
                                <nav aria-label="..." style="float: right;">
                                	<ul class="pagination">
                                	
                                	<c:if test="${pageMaker.prev }">
                                		<li class="paginate_button previous">
                                			<a class="page-link" href="${pageMaker.startPage-1 }">Previous</a>
                                		</li>
                                	</c:if>
                                	
                                	<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                                		<li class='paginate_button ${pageMaker.cri.pageNum == num ? "active" : "" }'>
                                			<a class="page-link" href="${num }">${num }</a>
                                		</li>
                                	</c:forEach>
                                	
                                	<c:if test="${pageMaker.next }">
                                		<li class="paginate_button next">
                                			<a class="page-link" href="${pageMaker.endPage+1}">Next</a>
                                		</li>
                                	</c:if>
                                	
                                	</ul>
                                	
                                </nav>
                                
                                <form id="actionForm" action="/board/list" method="get">
                                	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                                	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                                </form>
                                
                                <!-- modal 추가 -->
                                <div class="modal" id="myModal" tabindex="-1">
                                	<div class="modal-dialog">
                                		<div class="modal-content">
                                			<div class="modal-header">
                                				<h5 class="modal-title">Modal title</h5>
                                				<button class="btn-close" type="button" data-dismiss="modal" aria-label="Close"></button>
                                			</div>
                                			<div class="modal-body">
                                				<p class="modal-text">처리가 완료되었습니다.</p>
                                			</div>
                                			<div class="modal-footer">
                                				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                				<button type="button" class="btn btn-primary">Save Changes</button>
                                			</div>
                                		</div>
                                	</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <script type="text/javascript">
                    //$(document).ready() -->
                    	$(function(){
                    		var result = '<c:out value="${result}"/>';
                    		checkModal(result);
                    		
                    		//window의 history 객체는 스택 구조로 동작하기 때문에
                    		//뒤로가기 시 모달창이 반복해서 나오는 걸 방지
                    		history.replaceState({}, null, null);
                    		
                    		function checkModal(result){
                    			if(result === '' || history.state){
                    				return;
                    			}
                    			
                    			if(parseInt(result) > 0){
                    				$(".modal-text").html("게시글 " + parseInt(result) + "번이 등록되었습니다.");
                    			}
                    			
                    			$("#myModal").modal("show");
                    		}
                    		
                    		$("#regBtn").on("click", function(){
                    			self.location = "/board/register";
                    		});
                    		
                    		var actionForm = $("#actionForm");
                    		$(".paginate_button a").on("click", function(e){
                    			e.preventDefault();
                    			console.log('click');
                    			
                    			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
                    			actionForm.submit();
                    		});
                    		
                    		$(".move").on("click", function(e){
                    			e.preventDefault();
                    			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
                    			actionForm.attr("action", "/board/get");
                    			actionForm.submit();
                    		});
                    		
                    		$('#btnUserReg').on("click", function(e){
                    			window.location.href = "/user/register";
                    		});
                    		
                    		var loginForm = $("loginForm")
                    		$("#btnUserLogin").on("click", function(e){
                    			e.preventDefault();
                    			
                    			loginForm.attr("action", "/user/login");
                    		});
                    		
                    		
                    	});
                    </script>

                <%@ include file="../includes/footer.jsp" %>