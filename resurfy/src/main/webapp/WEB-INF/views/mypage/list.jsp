<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link href="../resources/css/mypageGrid.css" rel="stylesheet">
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">마이 페이지</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" style="font-weight:bold; font-size:1.2rem;" href="/mypage/list">작성 글 모아보기</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/mypage/cart">장바구니</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/mypage/own">가진 재료</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Page content-->
                <div class="container-fluid">
					<div class="col-lg-12">
						<button class="btn mypageBtn" id="sidebarToggle">></button>
						<h2 class="page-header">작성 글 모아보기</h2>
					<br></div>
					<div class="container">
					    <div class="row d-flex justify-content-center align-items-center h-100">
					      <div class="col col-md-12 col-lg-7 col-xl-5">
					        <div class="card" style="border-radius: 15px;">
					          <div class="card-body p-4">
					            <div class="d-flex text-black">
					              <div class="flex-shrink-0">
					                <img src="/resources/assets/logo.png"
					                  alt="Generic placeholder image" class="img-fluid"
					                  style="width: 180px; border-radius: 10px;">
					              </div>
					              <div class="flex-grow-1 ms-3">
					                <h5 class="mb-1">${member.nickname }</h5>
					                <p class="mb-2 pb-1" style="color: #2b2a2a;">${member.id }</p>
					                <div class="d-flex justify-content-start rounded-3 p-2 mb-2"
					                  style="background-color: #efefef;">
					                  <div>
					                    <p class="small text-muted mb-1">작성글</p>
					                    <p class="mb-0">41</p>
					                  </div>
					                  <div class="px-3">
					                    <p class="small text-muted mb-1">댓글</p>
					                    <p class="mb-0">976</p>
					                  </div>
					                  <div>
					                    <p class="small text-muted mb-1">-</p>
					                    <p class="mb-0">8.5</p>
					                  </div>
					                </div>
					                <div class="d-flex pt-1">
					                  <p class="mb-2 pb-1" style="color: #2b2a2a;">${member.phone }</p>
					                </div>
					              </div>
					            </div>
					          </div>
					        </div>
					      </div>
					    </div>
					</div>
					<br><br>
					<div class="container">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<!-- /.panel-heading -->
								<div class="panel-body">
									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>#번호</th>
												<th>제목</th>
												<th>작성일</th>
												<th>수정일</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty relist}">
												<div class="col" style="margin-bottom:30px;">
													<div class="p-5 text-center">
													    <h4 class="mb-3">레시피를 공유해보세요!</h4>
													  </div>
												</div>
											</c:if>
											<c:forEach items="${relist}" var="board">
												<tr>
													<td><c:out value="${board.bno }" /></td>
													<td>
														<a class='move' href='<c:out value="${board.bno}"/>'>
																<c:out value="${board.recipeName}" />
														</a>
													</td>
													<td><fmt:formatDate pattern="yyyy-MM-dd"
															value="${board.recipeDate }" /></td>
													<td><fmt:formatDate pattern="yyyy-MM-dd"
															value="${board.recipeUpdateDate }" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- start Paging -->
									<div class='pull-right'>
										<ul class="pagination">
											<c:if test="${pageMaker.prev}">
												<li class="paginate_button previous">
												<a href="${pageMaker.startPage -1 }">Previous</a>
												</li>
											</c:if>
											<c:forEach var="num" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
												<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
													<a href="${num}">${num}</a>
												</li>
											</c:forEach>
											<c:if test="${pageMaker.next}">
												<li class="paginate_button next"><a
													href="${pageMaker.endPage +1}">Next</a>
												</li>
											</c:if>
										</ul>
									</div>
									<!-- end paging -->
								</div>
							</div>
						</div>
					</div>
				</div>				
					<form id='actionForm' action="/mypage/list" method='get'>
						<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
						<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

						<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
						<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
					</form>
			</div>
		</div>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
				var result = '<c:out value="${result}"/>';
        		
        		var actionForm = $("#actionForm");
				
				//게시글 제목 눌렀을 때 이벤트 처리
				$(".move").on("click", function(e){
					e.preventDefault();
					actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+"'>");
					actionForm.attr("action","/recipe/detail");
					actionForm.submit();
					});
				
				$(".paginate_button a").on("click",	function(e) {
					e.preventDefault();
					console.log('click');
					actionForm.find("input[name='pageNum']").val($(this).attr("href"));
					actionForm.submit();
				});
				
				if(('<c:out value="${member.id}"/>')=='') {
       			    console.log("로그인 안됨");
       			 	actionForm.find("input").remove();
       			    actionForm.attr("action","/member/login.do");
       				actionForm.submit();
       		  }

			});
</script>

    </body>
</html>

<%@include file="../includes/footer.jsp"%>