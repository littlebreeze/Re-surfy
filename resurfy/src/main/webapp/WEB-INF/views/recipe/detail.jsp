<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<%-- <%@include file="../includes/header.jsp"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
<title>Resurfy - <c:out value="${recipe.recipeName }"/></title>
<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/resources/assets/logo.jpg" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles_detail.css" rel="stylesheet" />
       <!--   <link href="/resources/css/bootstrap.min.css" rel="stylesheet" />-->
       
<!--        Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
</head>
<body>
    <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5" >
            <div class="text-center">
  		<img src='<c:out value="${recipe.image }"/>' readonly="readonly" width=500px height=500px  alt="...">
  				<!-- <img src="http://file.okdab.com/UserFiles/searching/recipe/000200.jpg" width=500px height=500px  alt="..."> -->
  				<div class="row">
  					<div class="fs-5 mb-5">
  							<br>
                            
                            <div class="form-group">
                            <h5 class="p-2 fw-bolder"> <c:out value="${recipe.recipeName }"/> </h5>
						</div>
                             <div class="p-2 small mb-1">
                             
                             <span style="font-size:13px">난이도 : </span>
                             <span style="font-size:13px"><c:out value="${recipe.difficulty }"/> &nbsp &nbsp &nbsp &nbsp &nbsp</span>
                             <span style="font-size:13px">소요시간 : </span>
                             <span style="font-size:13px"><c:out value="${recipe.time }"/></span>
                             </div>
                             <!-- 사용자 그림 사진 : https://cdn-icons-png.flaticon.com/512/5393/5393061.png-->
                             <hr class="my-2" align="center" style="width: 60%; margin: 0 auto;">
                             
                             <div class="p-2"  style=" width: 50%; margin: 0 auto; text-align:left">
                             <img class="gx-1"  src="https://cdn-icons-png.flaticon.com/512/5393/5393061.png" width=20px height=20px  alt="...">
                             <span class="gx-2" style="font-size:13px"><c:out value="${recipe.id }"/></span> 
                             </div>
                            
                             <div class="p-3 small mb-1" style=" width: 50%; margin: 0 auto; text-align:left; font-size:13px;">
                             <c:out value="${recipe.recipeDescription }"/>
                             </div><br>
              
                                      
                             <!-- 재료칸(재료, 양념) -->
                             <div class="fw-bolder" style=" width: 50%; margin: 0 auto; text-align:left">재료</div>
                             <hr class="my-2" align="center" style="width: 60%; margin: 0 auto;">
						<div class="container " style=" width: 50%; margin: 0 auto; text-align:left; font-size:13px;">
						
						<c:forEach items="${ingre}" var="ing">
						<c:if test="${ing.ingreType eq '주재료' || ing.ingreType eq '부재료'}">
    						<div class="row">
								<div class="col"><c:out value="${ing.ingreName}" /></div>
								<div class="col"><c:out value="${ing.ingreMeasure}" /></div>
							</div>
						</c:if>
						</c:forEach>
						</div><br>
                  
                  
                  <div class="fw-bolder" style=" width: 50%; margin: 0 auto; text-align:left">양념</div>
                             <hr class="my-2" align="center" style="width: 60%; margin: 0 auto;">
						<div class="container " style=" width: 50%; margin: 0 auto; text-align:left; font-size:13px;">
						
						<c:forEach items="${ingre}" var="ing">
						<c:if test="${ing.ingreType eq '양념'}">
    						<div class="row">
								<div class="col"><c:out value="${ing.ingreName}" /></div>
								<div class="col"><c:out value="${ing.ingreMeasure}" /></div>
							</div>
						</c:if>
						</c:forEach>
						</div><br>
						<!-- 재료, 양념 end -->
							
																	
						<br><br>
						<div class="fw-bolder" style=" width: 50%; margin: 0 auto; text-align:left">레시피</div>
                        <hr class="my-2" align="center" style="width: 60%; margin: 0 auto;">
						<div class="container" style=" width: 50%; margin: 0 auto; text-align:left">
							<div class="py-3 row">
							
							<c:forEach items="${step}" var="st">
							<c:choose>

      							<c:when test="${st.stepImage == ' ' || st.stepImage == '0'}"> 
      							<div class="py-2 row">
      							<div class="col"><img src="/resources/assets/logo.jpg" width=200px height=200px  alt="..."></div>
								<div class="col">
								<div class="fw-bolder">Step<c:out value="${st.stepNo}" /></div>
								<span style="font-size:13px"><c:out value="${st.stepDescription}" /></span>
								<c:choose>
      							<c:when test="${st.tip == ' ' || st.stepImage == '0'}"> 
								<div style="font-size:13px"></div>
								</c:when>
								<c:otherwise>
								<div class="fw-bolder" style="font-size:13px">❈ tip <br> <c:out value="${st.tip}" /></div>
								</c:otherwise> 

							</c:choose>  
								</div>
								</div>
      							</c:when> 

      							<c:otherwise>
      							<div class="py-2 row"> 
								<div class="col"><img src='<c:out value="${st.stepImage }"/>' readonly="readonly" width=200px height=200px  alt="..."></div>
								<div class="col">
								<div class="fw-bolder">Step<c:out value="${st.stepNo}" /></div>
								<span style="font-size:13px"><c:out value="${st.stepDescription}" /></span>
									<c:choose>
      							<c:when test="${st.tip == ' ' || st.stepImage == '0'}"> 
								<div style="font-size:13px"></div>
								</c:when>
								<c:otherwise>
								<div class="fw-bolder" style="font-size:13px">❈ tip <br> <c:out value="${st.tip}" /></div>
								</c:otherwise> 

							</c:choose>  
								</div>
								</div>
      							</c:otherwise> 

							</c:choose> 
						
               
                     </c:forEach>
							
								
							
						</div>
						<div class="py-3 container " style=" width: 50%; margin: 0 auto; text-align:left; font-size:13px;">
						<button id='modifyBtn' data-oper='modify' class='py-3  btn btn-primary btn-xs pull-right' onclick = "location.href='/recipe/modify?bno=<c:out value="${recipe.bno }"/>'">Modify</button>
						<button id='listBtn' data-oper='modify' class='py-3  btn btn-primary btn-xs pull-right' onclick = "location.href='/recipe/get'">List</button>
						</div>
						
						</div>
						
						<%-- <!-- 레시피 과정 start -->
						<br><br>
						<div class="fw-bolder" style=" width: 50%; margin: 0 auto; text-align:left">레시피</div>
                        <hr class="my-2" align="center" style="width: 60%; margin: 0 auto;">
						<div class="container" style=" width: 50%; margin: 0 auto; text-align:left">
							<div class="py-2 row">
								<div class="col"><img src="http://file.okdab.com/UserFiles/searching/recipe/000200_p01.jpg" width=200px height=200px  alt="..."></div>
								<div class="col">
								<div class="fw-bolder">Step1</div><br>
								<span style="font-size:13px">양지머리로 육수를 낸 후 식혀 기름을 걷어낸 후, 불린 쌀을 넣어 고슬고슬하게 밥을 짓는다.</span>
								</div>
							</div>
							<div class="py-3 row">
								<div class="col"><img src='<c:out value="${step[0].stepImage }"/>' width=200px height=200px  alt="..."></div>
								<div class="col">
								<div class="fw-bolder">Step2</div><br>
								<span style="font-size:13px">안심은 불고기 양념하여 30분간 재워 국물 없이 구워 한 김 식으면 한입 크기로 자른다.</span>
								</div>
							</div>
							<div class="py-3 row">
								<div class="col"><img src="https://cdn-icons-png.flaticon.com/512/8346/8346088.png" width=200px height=200px  alt="..."></div>
								<div class="col"><div class="fw-bolder">Step3</div><br>
								<span style="font-size:13px">밥을 참기름으로 무쳐 그릇에 담고 준비한 재료를 고루 얹는다.</span></div>
							</div>
							<div class="py-3 row">
								<div class="col"><img src="https://cdn-icons-png.flaticon.com/512/8346/8346088.png" width=200px height=200px  alt="..."></div>
								<div class="col"><div class="fw-bolder">Step4</div><br>
								<span style="font-size:13px">콩나물과 숙주, 미나리는 데쳐서 국간장과 참기름으로 간하고, 고사리와 도라지는 참기름을 두른 프라이팬에 살짝 볶아놓는다.</span>
								</div>
							</div>
							<div class="py-3 row">
								<div class="col"><img src="https://cdn-icons-png.flaticon.com/512/8346/8346088.png" width=200px height=200px  alt="..."></div>
								<div class="col"><div class="fw-bolder">Step5</div><br>
								<span style="font-size:13px">청포묵은 고기와 비슷한 크기로 잘라 끓는 물에 데쳐내고 계란은 노른자와 흰자를 분리해 지단부쳐 곱게 채썬다.</span>
								</div>
							</div>
						</div> --%>
					
			
						<!-- 댓글 창에 부트스트랩 프레임워크의 class명을 확인한다. -->
						<br><br><br><br><br>
						
						<div class="fw-bolder" style=" width: 50%; margin: 0 auto; text-align:left">댓글
						<!-- <button id='addReplyBtn'
											class='btn btn-primary btn-xs pull-right'>등록</button> -->
						</div>
                        <hr class="my-2" align="center" style="width: 60%; margin: 0 auto;">
						<div class="row">
							<div class="col-lg-12">
								<div class="panel panel-default">
									<!-- 		<div class="panel-heading">
				<i class="fa fa-comments fa=fw"></i> Reply
			</div> -->
									<!-- /.panel-heading -->
									<div class="panel-heading">
									<i class="fa fa-comments fa=fw"></i> Reply
									<button id='addReplyBtn' class = 'btn btn-primary btn-xs pull-right'>New Reply</button>
									</div>
									<div class="panel-body">
										<ul class="chat">
											<li class="left clearfix" data-rno='12' style=" list-style:none; width: 50%; margin: 0 auto; text-align:left" >
												<div>
													<div class="header">
													<img src="https://cdn-icons-png.flaticon.com/512/9386/9386837.png" width=20px height=20px  alt="...">
													
														<strong style="font-size:13px">user1</strong> 
														<small class="rtime"
															style="font-size:12px">2023-03-16 10:25</small>
													</div>
													<p style="font-size:15px">Good job!</p>
												</div>
											</li>
										</ul>
									</div>
									<div class="panel-footer"></div>
								</div>
							</div>
						</div>


					</div>
                     <!-- <hr align="center" style="border: solid 1px gray; width: 50%;"> -->
                     
  				</div> <!-- 전체 end -->
			</div>
			<button id='addCartBtn' class='btn btn-primary btn-xs pull-right'>장바구니 담기</button>
<section class="py-5 bg-light">
    <div class="container px-4 px-lg-5 mt-5">
        <h2 class="fw-bolder mb-4 h4">이 레시피를 위한 추천 재료</h2>
        <!-- 없는 재료 -->
        <h2 class="fw-bolder mb-4 h4">없는 재료</h2>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        	<c:forEach items="${shopNotIn}" var="sni">
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Product image-->
                    <a href="${sni.link}"><img class="card-img-top" src="${sni.image}" alt="..." /></a>
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">${sni.title}</h5>
                            <!-- Product price-->
                            ${sni.lprice}
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                       <div class="text-center"><input type='checkbox' name="chk" data-price="${sni.lprice}" data-title="${sni.title}" data-ingre="${sni.ingredient}" data-image="${sni.image}" data-pid="${sni.productId}"/></div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
        <!-- 있는 재료 -->
        <h2 class="fw-bolder mb-4 h4">있는 재료</h2>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        	<c:forEach items="${shopIn}" var="si">
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Product image-->
                    <a href="${si.link}"><img class="card-img-top" src="${si.image}" alt="..." /></a>
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">${si.title}</h5>
                            <!-- Product price-->
                            ${si.lprice}
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><input type='checkbox' name="chk" data-price="${si.lprice}" data-title="${si.title}" data-ingre="${si.ingredient}" data-image="${si.image}" data-pid="${si.productId}" /></div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</section>


        </section>
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4 h4">이 레시피를 위한 추천 재료</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Fancy Product</h5>
                                    <!-- Product price-->
                                    $40.00 - $80.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Special Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Sale Item</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Popular Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    $40.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Footer-->
        <footer class="p-3 mb-2 bg-info text-white">
            <div class="container"><br><p class="m-0 text-center text-white">Copyright &copy; Resurfy 2023</p><br>
           <!--  저작권 표기 문제 고민
            <a href="https://www.flaticon.com/kr/free-icons/github" title="github 아이콘">Github 아이콘  제작자: Pixel perfect - Flaticon</a> -->
            <p class="m-0 text-center text-white"><img src ="https://cdn-icons-png.flaticon.com/512/733/733609.png" width=30px height=30px/>&nbsp Github Address : <a href="https://github.com/barcataeeon/Re-surfy" class="m-0 text-center text-white"> https://github.com/barcataeeon/Re-surfy</a></p><br>
             </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
       <!--  <script src="js/scripts.js"></script> -->
<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Reply</label>
						<input class="form-control" name='reply' value='New Reply!!!!'>
					</div>
					<div class="form-group">
						<label>Replyer</label>
						<input class="form-control" name='id' value='user1'>
					</div>
					<div class="form-group">
						<label>Reply Date</label>
						<input class="form-control" name='replyDate' value=''>
					</div>
				</div>
				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
					<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
					
					<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
				</div>
			</div>
		</div>
	</div>       
       <script type="text/javascript" src="/resources/js/reply.js"></script>
       <script>
$(document).ready(function(){
	var bnoValue = '<c:out value="${recipe.bno}"/>';
	var replyUL = $(".chat");
//함수를 만드는 function() 익명함수이고 function showList(page) 함수명이 showList이고 매개변수는 page	
	showList(1);
	function showList(page){
		//console.log("show list " + page);
		//함수호출(매개값, list함수매개값{})
		replyService.getList({bno:bnoValue, page: page||1}, 
				function(list){
		
			var str="";
			if(list == null || list.length==0){
				replyUL.html("");
				return;
			}
			for (var i=0, len=list.length || 0; i<len; i++){
				str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
				str+= "<div><div class='header'><strong class='primary-font'>" + list[i].id + "</strong>";
				str+="<small class='rtime'>" + replyService.displayTime(list[i].replyDate)+"</small></div>";
				str+="<p>" + list[i].reply+"</p></div></li>";
			}
			replyUL.html(str);
			//showReplyPage(replyCnt);
		}); //end function
	}// end showList
	var modal = $(".modal");
	var modalInputReply = modal.find("input[name='reply']");
	var modalInputReplyer = modal.find("input[name='id']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");
	
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	
	$("#addReplyBtn").on("click", function(e) {
		modal.find("input").val("");
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id!='modalCloseBtn']").hide();
		
		modalRegisterBtn.show();
		$(".modal").modal("show");
	});
	
	modalRegisterBtn.on("click", function(e) {
		var reply ={
				reply: modalInputReply.val(),
				id: modalInputReplyer.val(),
				bno: bnoValue
		};
		replyService.add(reply, function (result){
			alert(result);
			modal.find("input").val("");
			modal.modal("hide");
			
			//showList(1);
			showList(-1);
		});
});
	
	//댓글 조회 클릭 이벤트 처리 
    $(".chat").on("click", "li", function(e){
      
      var rno = $(this).data("rno");
      
      replyService.get(rno, function(reply){
      
        modalInputReply.val(reply.reply);
        modalInputReplyer.val(reply.id);
        modalInputReplyDate.val(replyService.displayTime( reply.replyDate))
        .attr("readonly","readonly");
        modal.data("rno", reply.rno);
        
        modal.find("button[id !='modalCloseBtn']").hide();
        modalModBtn.show();
        modalRemoveBtn.show();
        
        $(".modal").modal("show");
            
      });
    });
	
    modalModBtn.on("click", function(e) {
		var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
		replyService.update(reply, function(result) {
			alert(result);
			modal.modal("hide");
			showList(1);
			//showList(pageNum);
		});
	});
    
	modalRemoveBtn.on("click", function(e) {
		var rno = modal.data("rno");
		replyService.remove(rno, function(result) {
			alert(result);
			modal.modal("hide");
			showList(-1);
			//showList(pageNum);
		});
	});
	
	
});
</script>
		<script>
		 
		console.log("===============");
		console.log("JS TEST");
		 
		var bnoValue = '<c:out value="${recipe.bno}"/>';
		
		/*replyService.add(
				{reply:"JS Test", id:"user1", bno:bnoValue}
				,
				function(result){
					alert("RESULT : " + result);
				}
		);*/
		/*replyService.getList({bno:bnoValue, page:1}, function(list){
			  var bnoValue='<c:out value="${board.bno}"/>';
		    for(var i = 0,  len = list.length||0; i < len; i++ ){
		      console.log(list[i]);
		    }
		});*/
		/*
		replyService.remove(22, function(count) {
			console.log(count);
			if(count==="success") {
				alert("REMOVED");
			}
		}, function(err) {
			alert('ERROR....');
		
			});
		*/
		/*var bnoValue='<c:out value="${recipe.bno}"/>';
		replyService.update({
			  rno : 3,
			  bno : bnoValue,
			  reply : "너무 맛있어요!..."
			}, function(result) {
			 
			  alert("수정 완료...");
			 
			});  */
		
		replyService.get(7, function(data){
		    console.log(data);
		});
		 
		</script>
	<script type="text/javascript">
		$(document).ready(function() {
			console.log(replyService);
		  var operForm = $("#operForm"); 
		  
		  $("button[data-oper='modify']").on("click", function(e){
		    
		    operForm.attr("action","/board/modify").submit();
		    
		  });
		</script>
		
		<!-- <script type="text/javascript">
		$(document).ready(function() {
			console.log(replyService);
		});
		</script>-->
		
		<script>
$(document).ready(function() {
$("#addCartBtn").on("click", function(e){
var priceArr = new Array();
var titleArr = new Array();
var ingreArr = new Array();
var imageArr = new Array();
var pIdArr = new Array();
 
 $("input[name=chk]:checked").each(function(){
 priceArr.push($(this).attr("data-price"));
 titleArr.push($(this).attr("data-title"));
 ingreArr.push($(this).attr("data-ingre"));
 imageArr.push($(this).attr("data-image"));
 pIdArr.push($(this).attr("data-pid"));
 });
 
 console.log(priceArr);
 console.log(titleArr);
 console.log(ingreArr);
 console.log(imageArr);
 console.log(pIdArr);
 
 if(priceArr.length == 0){
 alert("선택된 제품이 없습니다.");
 }else{
 var confirm_val = confirm("장바구니에 추가하시겠습니까?");
 
 if(confirm_val) {
 $.ajax({
 url : "/mypage/addCart",
 method : "post",
 data : { pArr : priceArr,
 tArr : titleArr,
 igArr : ingreArr,
 imArr : imageArr,
 pIdArr : pIdArr },
 success : function(){
 console.log("장바구니 추가 성공");
 alert("장바구니에 추가 되었습니다.");
 }
});
 } 
 }
});
});
</script>
	
</body>
</html>