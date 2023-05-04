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
        <link rel="icon" type="image/x-icon" href="/resources/assets/logo.png" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles_detail.css" rel="stylesheet" />
       <!--   <link href="/resources/css/bootstrap.min.css" rel="stylesheet" />-->
       
<!--        Bootstrap Core CSS -->
<!-- <link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">-->

<!-- MetisMenu CSS -->
<!-- <link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">-->

<!-- DataTables CSS -->
<!-- <link
	href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">-->

<!-- DataTables Responsive CSS -->
<!-- <link
	href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">-->

<!-- Custom CSS -->
<!-- <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">-->

<style>
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 3;
    color: #fff;
    cursor: default;
    background-color: #ff7851;
    border-color: #ff7851;
}
#listBtn, #modifyBtn, #addReplyBtn, #addCartBtn{
 &:hover {
      animation: jelly 0.5s;
    }
}

@keyframes jelly {
25% {
    transform: scale(0.9, 1.1);
  }
</style>
</head>
<body>
    <!-- Navigation-->
      <!--   <nav class="navbar navbar-expand-lg navbar-light bg-light">
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
        </nav> -->
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5" >
            <div class="text-center">
  		<img src='<c:out value="${recipe.image }"/>' readonly="readonly" width=800px height=600px alt="...">
  				<!-- <img src="http://file.okdab.com/UserFiles/searching/recipe/000200.jpg" width=500px height=500px  alt="..."> -->
  				<div class="row">
  					<div class="fs-5 mb-5">
  							<br>
                            
                            <div class="form-group">
                            <h1 class="p-2 fw-bolder"> <c:out value="${recipe.recipeName }"/> </h1>
						</div>
                             <div class="p-2 small mb-1">
                             
                             <span style="font-size:20px">난이도 : </span>
                             <span style="font-size:20px"><c:out value="${recipe.difficulty }"/> &nbsp &nbsp &nbsp &nbsp &nbsp</span>
                             <span style="font-size:20px">소요시간 : </span>
                             <span style="font-size:20px"><c:out value="${recipe.time }"/></span>
                             </div>
                             <!-- 사용자 그림 사진 : https://cdn-icons-png.flaticon.com/512/5393/5393061.png-->
                             <hr class="my-2" align="center" style="width: 90%; margin: 0 auto;">
                             
                             <div class="p-2"  style=" width: 50%; margin: 0 auto; text-align:left">
                             <img class="gx-1"  src="https://cdn-icons-png.flaticon.com/512/5393/5393061.png" width=20px height=20px  alt="...">
                             <span class="gx-2" style="font-size:20px"><c:out value="${recipe.id }"/></span> 
                             </div>
                            
                             <div class="p-3 small mb-1" style=" width: 50%; margin: 0 auto; text-align:left; font-size:17px;">
                             <c:out value="${recipe.recipeDescription }"/>
                             </div><br>
              
                                      
                             <!-- 재료칸(재료, 양념) -->
                      
						
                             <div class="fw-bolder" style=" width: 80%; margin: 0 auto; text-align:left; font-size:25px">재료</div>
                             <hr class="my-2" align="center" style="width: 90%; margin: 0 auto;">
                         
						<div class="container " style=" width: 90%; margin: 0 auto; text-align:center; font-size:20px;">
						 <c:set var = "count" value="true"/>
						<c:forEach items="${ingre}" var="ing">
						
						<c:if test="${ing.ingreType eq '주재료'}">
						
    						<div class="py-1 row">
    						<c:if test="${count}">
    							<div class="col fw-bolder"><c:out value="${ing.ingreType}"/></div>
    						</c:if>
    						<c:if test="${not count}">
    							<div class="col fw-bolder"></div>
    						</c:if>
								<div class="col"><c:out value="${ing.ingreName}" /></div>
								<div class="col"><c:out value="${ing.ingreMeasure}" /></div>
								<c:set var = "count" value="two"/>
							</div>
						</c:if>
					
				
						</c:forEach>
						<br>
						<c:set var = "count" value="true"/>
						<c:forEach items="${ingre}" var="ing">
						
						<c:if test="${ing.ingreType eq '부재료'}">
						
    						<div class="py-1 row">
    						<c:if test="${count}">
    							<div class="col fw-bolder"><c:out value="${ing.ingreType}"/></div>
    						</c:if>
    						<c:if test="${not count}">
    							<div class="col fw-bolder"></div>
    						</c:if>
								<div class="col"><c:out value="${ing.ingreName}" /></div>
								<div class="col"><c:out value="${ing.ingreMeasure}" /></div>
								<c:set var = "count" value="two"/>
							</div>
						</c:if>
					
				
						</c:forEach>
						<br>
						<c:set var = "count" value="true"/>
						<c:forEach items="${ingre}" var="ing">
						
						<c:if test="${ing.ingreType eq '양념'}">
						
    						<div class="py-1 row">
    						<c:if test="${count}">
    							<div class="col fw-bolder"><c:out value="${ing.ingreType}"/></div>
    						</c:if>
    						<c:if test="${not count}">
    							<div class="col fw-bolder"></div>
    						</c:if>
								<div class="col"><c:out value="${ing.ingreName}" /></div>
								<div class="col"><c:out value="${ing.ingreMeasure}" /></div>
								<c:set var = "count" value="two"/>
							</div>
						</c:if>
					
				
						</c:forEach>
						<br>
						
						
						</div><br>
							
																	
						<br><br>
						<div class="fw-bolder" style=" width: 90%; margin: 0 auto; text-align:left; font-size:30px">레시피</div>
                        <!-- <hr class="my-2" align="center" style="width: 90%; margin: 0 auto; background: #e95420; height:3px; border:0;"> -->
                        
						<div class="container" style=" width: 90%; margin: 0 auto; text-align:left">
							<div class="py-3 row">
							
							<c:forEach items="${step}" var="st">
							<c:choose>

      							<c:when test="${st.stepImage == ' ' || st.stepImage == '0' || st.stepImage == null}"> 
      							<div class="py-3 row">
      							<div class="col"><img src="/resources/assets/nonOrangelogo.png" width=350px height=300px  alt="..."></div>
								<div class="col">
								<div class="fw-bolder" style="font-size:25px; color:#e95420">Step<c:out value="${st.stepNo}" /></div>
								<hr class="my-2" align="left" style="width: 100%; margin: 0 auto;">
								<br><span style="font-size:20px"><c:out value="${st.stepDescription}" /></span>
								<c:choose>
      							<c:when test="${st.tip == ' ' || st.tip == '0' || st.tip == null}"> 
								<div style="font-size:18px"></div>
								</c:when>
								<c:otherwise>
								<div class="fw-bolder" style="font-size:15px">❈ tip <br> <c:out value="${st.tip}" /></div>
								</c:otherwise> 

							</c:choose>  
								</div>
								</div>
      							</c:when> 

      							<c:otherwise>
      							<div class="py-3 row"> 
								<div class="col"><img src='<c:out value="${st.stepImage }"/>' readonly="readonly" width=350px height=300px  alt="..."></div>
								<div class="col">
								<div class="fw-bolder" style="font-size:25px; color:#e95420">Step<c:out value="${st.stepNo}" /></div>
								<hr class="my-2" align="left" style="width: 100%; margin: 0 auto;">
								<br>
								<span style="font-size:20px"><c:out value="${st.stepDescription}" /></span>
									<c:choose>
      							<c:when test="${st.tip == ' ' || st.tip == '0' || st.tip == null}"> 
								<div style="font-size:18px"></div>
								</c:when>
								<c:otherwise>
								<br>
								<div class="fw-bolder" style="font-size:15px">❈ tip <br> <c:out value="${st.tip}" /></div>
								</c:otherwise> 

							</c:choose>  
								</div>
								</div>
      							</c:otherwise> 

							</c:choose> 
						
               
                     </c:forEach>
							
								
							
						</div>
						<div class="py-3 container " style=" width: 50%; margin: 0 auto; text-align:center; font-size:13px;">
						<c:if test="${recipe.id eq member.id || member.id eq 'admin'}">
						<%-- <button id='modifyBtn' data-oper='modify' class='py-3   btn btn-primary btn-jelly' onclick = "location.href='/recipe/modify?bno=<c:out value="${recipe.bno }"/>'" style="width:100px; height:60px; background-color: #e95420; font-size:20px; border:none; margin-left:10px">수정</button> --%>
						<button id='modifyBtn' data-oper='modify' class='py-3   btn btn-primary btn-jelly' onclick = "location.href='/recipe/modify?bno=<c:out value="${recipe.bno }"/>'" style="width:200px; height:70px; background-color: #e95420; font-size:20px; border:none; text-align:center">수정</button>
						</c:if>
						  <!-- <div class="space" style="width: 3px; height: auto; display: inline-block;"></div>
						<button id='listBtn' data-oper='list' class='py-3  btn btn-primary btn-jelly' onclick = "location.href='/recipe/get'" style="width:100px; height:60px; background-color: #e95420; border:none; font-size:20px">목록</button> -->
						</div>
						
						</div>
					
			
						<!-- 댓글 창에 부트스트랩 프레임워크의 class명을 확인한다. -->
						<br><br><br><br><br>
						
						<div class="fw-bolder" style=" width: 90%; margin: 0 auto; text-align:left">댓글</div>
						<br>
						<div class="row"></div>
						 <div class="row"  style=" width: 90%; margin: 0 auto; text-align:left">
    						<div class="col-11"><input class="form-control" rows="3" id='replybox' placeholder="댓글을 입력해주세요." style="width:95%; height:60px" ></div>
    						<div class="col-1"><button id='addReplyBtn'
											class='btn btn-primary btn-jelly' style="width:150%; height:60px; background-color: #e95420; border:none; float:right; font-size:20px">등록</button></div>
  						
						
					<%-- 	<c:if test="${not empty member.id}">
						<button id='addReplyBtn'
											class='btn btn-primary btn-jelly' style="width:80px; height:60px; background-color: #e95420; border:none; float:right; font-size:20px">등록</button>
						</c:if>	 --%>
						</div><br>
                        <!-- <hr class="my-2" align="center" style="width: 100%; margin: 0 auto;"> -->
						<div class="row">
							<div class="col-lg-12">
								<div class="panel panel-default">
									<!-- 		<div class="panel-heading">
				<i class="fa fa-comments fa=fw"></i> Reply
			</div> -->
									<!-- /.panel-heading -->
									<div class="panel-heading">
									<i class="fa fa-comments fa=fw"></i> <!-- Reply -->
									<!-- <button id='addReplyBtn' class = 'btn btn-primary btn-xs pull-right'>New Reply</button>-->
									</div>
									<div class="panel-body">
										<ul class="chat" style=" list-style:none">
											<li class="left clearfix" data-rno='12' style=" width: 90%; margin: 0 auto; text-align:left" >
												<div>
													<div class="header">
													<img src="https://cdn-icons-png.flaticon.com/512/9386/9386837.png" width=20px height=20px  alt="...">
													
														<strong style="font-size:13px"><img src="https://cdn-icons-png.flaticon.com/512/9386/9386837.png" width=20px height=20px  alt="...">user1</strong> 
														<small class="rtime"
															style="font-size:12px ">2023-03-16 10:25</small>
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
			<!-- <button id='addCartBtn' class='btn btn-primary btn-jelly' style="width:130px; height:50px; background-color: #33afe9; border:none; float:right">장바구니 담기</button>-->
<section class="py-5" style="background-clor:white">
    <div class="container px-4 px-lg-5 mt-5">
    	<div>
        <h2 class="fw-bolder mb-4 h4">이 레시피를 위한 추천 재료 <button id='addCartBtn' class='btn btn-primary btn-jelly text-center' style="font-size: 20px; width:200px; height:70px; background-color: #e95420; border:none; float:right"><img src="/resources/assets/detail/cart.png" width="30px" height="30px">&nbsp 장바구니 담기</button></h2>
        
        </div>
        <br>
        <hr class="my-2" align="center" style="margin: 0 auto;">
        <br>
        <!-- 없는 재료 -->
        <h2 class="fw-bolder mb-4 h4">없는 재료</h2>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center py-5 bg-light" style="border: 3px solid #e95420; border-radius:30px; padding: 10px">
        
        	<c:if test="${empty shopNotIn}">
				<div class="col" style="margin-bottom:30px;">
					<div class="p-7 text-center">
					    <h5 class="mb-3">레시피에 필요한 재료를 모두 가지고 있습니다!</h5>
					  </div>
				</div>
			</c:if>
        	<c:forEach items="${shopNotIn}" var="sni">
            <div class="col mb-5">
                <div class="card h-100"  style="border:none">
                    <!-- Product image-->
                    <a href="${sni.link}"><img class="card-img-top" src="${sni.image}" alt="..." style="height:200px"/></a>
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder" style="height:130px; font-size:20px">${sni.title}</h5>
                            <!-- Product price-->
                            
							<div style="color:blue; font-size:20px"><fmt:formatNumber value="${sni.lprice}" pattern="#,###"/>원</div>
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                       <div class="text-center"><input style='zoom:2.5' type='checkbox' name="chk" data-price="${sni.lprice}" data-title="${sni.title}" data-ingre="${sni.ingredient}" data-image="${sni.image}" data-pid="${sni.productId}"/></div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
        <!-- 있는 재료 -->
        <br><br>
        <h2 class="fw-bolder mb-4 h4">있는 재료</h2>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" style="border: 3px solid #e95420; border-radius:30px;  text-align : center; padding : 100px 0; text-align:center">
        	<c:if test="${empty shopIn}">
				<div class="col" style="margin-bottom:30px;">
					<div class="p-7 text-center">
					    <h5 class="mb-3" style="align-items: center">가지고 있는 재료를<br> 추가해보세요!</h5>
					  </div>
				</div>
			</c:if>
        	<c:forEach items="${shopIn}" var="si">
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Product image-->
                    <a href="${si.link}"><img class="card-img-top" src="${si.image}" alt="..." style="height:200px"/></a>
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder" style="height:130px; font-size:20px">${si.title}</h5>
                            <!-- Product price-->
                            <div style="color:blue; font-size:20px"><fmt:formatNumber value="${si.lprice}" pattern="#,###"/>원</div>
                            
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><input type='checkbox' style='zoom:2.5' name="chk" data-price="${si.lprice}" data-title="${si.title}" data-ingre="${si.ingredient}" data-image="${si.image}" data-pid="${si.productId}" /></div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</section>


        </section>
        
        
        <!-- Footer-->
        <footer class="p-3 mb-2 text-white" style="background-color: #e95420">
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
          
          <!-- Confirm Modal-->
	<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
		<div class="modal-dialog" id="addModalDialog">
			<div class="modal-content" id="addModalContent">
				<div class="modal-header">
					<h4 class="modal-title" id="confirmModalLabel">confirm</h4>
				</div>
				<div class="modal-body">
					확인 또는 취소를 눌러주세요
				</div>
				<div class="modal-footer">
					<button id='modalConfirmBtn' type="button" class="btn btn-primary" style= "background-color:#e95420; border:none">확인</button>					
					<button id='modalCloseBtn' type="button" class="btn btn-default" style="border:1px solid lightgray">취소</button>
				</div>
			</div>
		</div>
	</div>
	
<!-- Modal 장바구니에 아무것도 안담겼을 때 -->
	<div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="alertModalLabel" aria-hidden="true">
		<div class="modal-dialog" id="addModalDialog">
			<div class="modal-content" id="addModalContent">
				<div class="modal-header">
					<h3 class="modal-title" id="alertModalLabel">선택된 제품이 없습니다!</h3>
				</div>
				<div class="modal-body">
					다시 확인해주세요
				</div>
				<div class="modal-footer">
					<button id='modalAlertBtn' type="button" class="btn btn-primary" style= "background-color:#e95420; border:none">확인</button>					
				</div>
			</div>
		</div>
	</div>
	       
<!-- Modal -->
	<div class="modal fade" id="reModal" tabindex="-1" role="dialog" aria-labelledby="reModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="reModalLabel">댓글창</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>댓글</label>
						<input class="form-control" name='reply' value='New Reply!!!!'>
					</div>
					<div class="form-group">
						<label>작성자</label>
						<input class="form-control" name='id' value='user1'>
					</div>
					<div class="form-group">
						<label>등록 날짜</label>
						<input class="form-control" name='replyDate' value=''>
					</div>
				</div>
				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
					<button id='modalRegisterBtn' type="button" class="btn btn-primary" style= "background-color:#e95420; border:none">등록</button>
					
					<!-- <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>-->
				</div>
			</div>
		</div>
	</div>       
       <script type="text/javascript" src="/resources/js/reply.js"></script>
       <script>
var pageNum = 1;
var replyPageFooter = $(".panel-footer");
function showReplyPage(replyCnt) {
	var endNum = Math.ceil(pageNum / 10.0) * 10;
	var startNum = endNum - 9;
	
	var prev = startNum != 1;
	var next = false;
	
	if(endNum * 10 >= replyCnt) {
		endNum = Math.ceil(replyCnt/10.0);
	}
	
	if(endNum * 10 < replyCnt) {
		next = true;
	}
	
	var str = "<ul class='pagination pull-right'>";
	if(prev) {
		str += "<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li>";
	}
	
	for(var i=startNum ; i<=endNum; i++){
		var active = pageNum == i? "active":"";
		str+="<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
	}
	
	if(next) {
		str+= "<li class='page-item'><a class='page-link' href='"+(endNum+1) + "'>Next</a></li>";
	}

	str += "</ul></div>";
	console.log(str);
	
	replyPageFooter.html(str);
}
</script>
        <script>
$(document).ready(function(){
	var bnoValue = '<c:out value="${recipe.bno}"/>';
	var writer = '<c:out value="${member.id}"/>';
	var replyUL = $(".chat");
//함수를 만드는 function() 익명함수이고 function showList(page) 함수명이 showList이고 매개변수는 page	
	showList(1);
	function showList(page){
		console.log("show list " + page);
		//함수호출(매개값, list함수매개값{})
		replyService.getList({bno:bnoValue, page: page||1}, 
				function(replyCnt, list){
			
			console.log("replyCnt : " + replyCnt);
			console.log("list : " + list);
			console.log(list);
			
			if(page == -1) {
				pageNum = Math.ceil(replyCnt/10.0);
				showList(pageNum);
				return;
			}
			
			var str="";
			if(list == null || list.length==0){
				replyUL.html("");
				return;
			}
			for (var i=0, len=list.length || 0; i<len; i++){
				str += "<li class='left clearfix' data-rno='"+list[i].rno+"' style='width: 90%; margin: 0 auto; text-align:left'>";
				//str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
				//str+= "<div><div class='header'><strong class='primary-font'>[" + list[i].rno + "] " + list[i].id + "</strong>";
				//str+= "<div><div class='header'><strong class='primary-font'>[" + list[i].rno + "] " + "<img src='https://cdn-icons-png.flaticon.com/512/9386/9386837.png' width='25px' height='25px'> &nbsp"+list[i].id + "</strong>";
				str+= "<div align='left'><div class='header'><strong class='primary-font' style='color:#e95420'>" + "<img src='/resources/assets/detail/user.png' width='25px' height='25px'> &nbsp"+list[i].id + "</strong>";
				str+="<small class='rtime' style='font-size:15px'>&nbsp" + replyService.displayTime(list[i].replyDate)+"</small></div>";
				str+="<p>" + list[i].reply+"</p></div></li>";
				str+="<hr class='my-2' align='left' style='width: 93%; margin: 0 auto;'>";
			}
			replyUL.html(str);
			showReplyPage(replyCnt);
		}); //end function
	}// end showList
	var modal = $("#reModal");
	var modalInputReply = modal.find("input[name='reply']");
	var modalInputReplyer = modal.find("input[name='id']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");
	
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	var replybox = document.getElementById("replybox").value;
var confirmModal = $("#confirmModal");
var alertModal = $("#alertModal");

	
	var modalCloseBtn = $("#modalCloseBtn");
	modalCloseBtn.on("click", function(e){
		confirmModal.modal("hide");
	});
	
	$("#modalAlertBtn").on("click", function(e){
		alertModal.modal("hide");
	});
	
	
	/* $("#addReplyBtn").on("click", function(e) {
		modal.find("input").val("");
		modalInputReplyer.closest("div").hide();
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id!='modalCloseBtn']").hide();
		
		modalRegisterBtn.show();
		modal.modal("show");
	}); */
	
	 $("#addReplyBtn").on("click", function(e) {

		if (writer.length > 0){
		if (document.getElementById("replybox").value.length > 0){
		var reply ={
				reply: document.getElementById("replybox").value,
				/*id: modalInputReplyer.val(),*/
				id : writer,
				bno: bnoValue
		};
		replyService.add(reply, function (result){
			//alert(result);
			modal.find("input").val("");
			modal.modal("hide");
			
			//showList(1);
			showList(-1);
		});
		parent.document.getElementById('replybox').value='';
		/*parent.document.location.reload();*/
		/*window.location.reload(true);*/ 
		} else{
			$(".modal-title").html("댓글 등록 오류")
   		    $(".modal-body").html("댓글을 남겨주세요!")
   		 	alertModal.modal("show");
		}
		} else{
			$(".modal-title").html("로그인을 해주세요!") 
   		    $(".modal-body").html("로그인 페이지로 이동하시겠습니까?")
			confirmModal.modal("show");
			
			$("#modalConfirmBtn").on("click", function(e){
				  
				   $.ajax({

					    success : function(){
					    	console.log("페이지 이동 성공");
					    	location.href = "/member/login.do";
					    }
					});
				});
				
		}
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
        if(reply.id==writer || writer=='admin'){
    		modalModBtn.show();
	        modalRemoveBtn.show();
    	
   		}else{
   			modal.find("button[id !='modalRemoveBtn']").hide();
	   		modal.find("button[id !='modalModBtn']").hide();    
   		}
        modal.modal("show");
            
      });

    });
	
    modalModBtn.on("click", function(e) {
		var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
		replyService.update(reply, function(result) {
			//alert(result);
			modal.modal("hide");
			showList(pageNum);
		});
	});
	
	modalRemoveBtn.on("click", function(e) {
		var rno = modal.data("rno");
		replyService.remove(rno, function(result) {
			//alert(result);
			modal.modal("hide");
			showList(pageNum);
		});
	});
	
	replyPageFooter.on("click", "li a", function(e) {
		e.preventDefault();
		console.log("page click");
		var targetPageNum = $(this).attr("href");
		console.log("targetPageNum : " + targetPageNum);
		pageNum = targetPageNum;
		showList(pageNum);
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

	var alertModal = $("#alertModal");
	var confirmModal = $("#confirmModal");
	
	var modalCloseBtn = $("#modalCloseBtn");
	modalCloseBtn.on("click", function(e){
		confirmModal.modal("hide");
	});
	
	$("#modalAlertBtn").on("click", function(e){
		alertModal.modal("hide");
	});
	
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
/*  alert("선택된 제품이 없습니다."); */
	 alertModal.modal("show");
 
 }else{
 /* var confirm_val = confirm("장바구니에 추가하시겠습니까?"); */

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
	  /* alert("장바구니에 추가 되었습니다."); */
	  $(".modal-title").html("🛒 장바구니에 추가되었습니다!")
	  $(".modal-body").html("장바구니로 이동하시겠습니까?")
	  confirmModal.modal("show");
	  
	  $("#modalConfirmBtn").on("click", function(e){
		  console.log(ingreArr);
		   $.ajax({

			    success : function(){
			    	console.log("페이지 이동 성공");
			    	location.href = "/mypage/cart";
			    }
			});
		});
	  
	  
	  
	  }
	 });

 
 } //else end
});
});
</script>
	
</body>
</html>