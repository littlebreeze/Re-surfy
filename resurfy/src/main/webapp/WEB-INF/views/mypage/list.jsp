<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Simple Sidebar - Start Bootstrap Template</title>
		<link href="../resources/css/pagingButton.css" rel="stylesheet">
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/mypageStyles.css" rel="stylesheet" />
        <link href="../resources/css/mypageGrid.css" rel="stylesheet">
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">마이 페이지</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/mypage/list">작성 글 모아보기</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/mypage/cart">장바구니</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/mypage/own">가진 재료</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Page content-->
                <div class="container-fluid">
					<div class="col-lg-12"><br><br>
						<h1 class="page-header">사용자 정보</h1>
					<br><br></div>
					<div class="container">
						    <div class="row d-flex justify-content-center align-items-center h-100">
						      <div class="col col-md-12 col-lg-7 col-xl-5">
						        <div class="card" style="border-radius: 15px;">
						          <div class="card-body p-4">
						            <div class="d-flex text-black">
						              <div class="flex-shrink-0">
						                <img src="/resources/assets/favicon.png"
						                  alt="Generic placeholder image" class="img-fluid"
						                  style="width: 180px; border-radius: 10px;">
						              </div>
						              <div class="flex-grow-1 ms-3">
						                <h5 class="mb-1">닉네임</h5>
						                <p class="mb-2 pb-1" style="color: #2b2a2a;">아이디</p>
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
						                  <p class="mb-2 pb-1" style="color: #2b2a2a;">전화번호</p>
						                </div>
						              </div>
						            </div>
						          </div>
						        </div>
						      </div>
						    </div>
					</div>
					<div class="container">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<button id='allBtn' type="button" class="btn btn-xs pull-right" style="margin-bottom: 1rem !important;">> 작성 글 전체 보기</button>
								</div>
								<!-- /.panel-heading -->
								<div class="panel-body">
									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>#번호</th>
												<th>제목</th>
												<th>작성자</th>
												<th>작성일</th>
												<th>수정일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${relist}" var="board">
												<tr>
													<td><c:out value="${board.bno }" /></td>
													<td>
														<a class='move' href='<c:out value="${board.bno}"/>'>
																<c:out value="${board.recipeName}" />
														</a>
													</td>
													<td><c:out value="${board.id }" /></td>
													<td><fmt:formatDate pattern="yyyy-MM-dd"
															value="${board.recipeDate }" /></td>
													<td><fmt:formatDate pattern="yyyy-MM-dd"
															value="${board.recipeUpdateDate }" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>				
					<form id='actionForm' action="/recipe/get" method='get'>
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
					actionForm.attr("action","/board/get");
					actionForm.submit();
					});
				
				$("#allBtn").on("click", function() {
					actionForm.submit();
				});

			});
</script>

    </body>
</html>