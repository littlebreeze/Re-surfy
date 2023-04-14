<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
      							<div class="col"><img src="https://cdn-icons-png.flaticon.com/512/8346/8346088.png" width=200px height=200px  alt="..."></div>
								<div class="col">
								<div class="fw-bolder">Step<c:out value="${st.stepNo}" /></div>
								<span style="font-size:13px"><c:out value="${st.stepDescription}" /></span>
								<c:choose>
      							<c:when test="${st.tip == ' ' || st.stepImage == '0'}"> 
								<div style="font-size:13px"></div>
								</c:when>
								<c:otherwise>
								<div class="fw-bolder" style="font-size:13px">tip : <c:out value="${st.tip}" /></div>
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
								<div class="fw-bolder" style="font-size:13px">tip : <c:out value="${st.tip}" /></div>
								</c:otherwise> 

							</c:choose>  
								</div>
								</div>
      							</c:otherwise> 

							</c:choose> 
						
               
                     </c:forEach>
							
								
							
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
						<br><br>
						<div class="fw-bolder" style=" width: 50%; margin: 0 auto; text-align:left">댓글
						<button id='addReplyBtn'
											class='btn btn-primary btn-xs pull-right'>등록</button>
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
										
									</div>
									<div class="panel-body">
										<ul class="chat">
											<li class="left clearfix" data-rno='12' style=" list-style:none; width: 50%; margin: 0 auto; text-align:left" >
												<div>
													<div class="header">
													<img src="https://cdn-icons-png.flaticon.com/512/9386/9386837.png" width=20px height=20px  alt="...">
													
														<strong style="font-size:13px">user1</strong> 
														<small
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
       
</body>
</html>