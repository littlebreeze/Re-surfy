<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/mypage/list">작성 글 모아보기</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" style="font-weight:bold; font-size:1.2rem;" href="/mypage/cart">장바구니</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/mypage/own">가진 재료</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Page content-->
                <div class="container-fluid">
                    <div class="col-lg-12">
						<h2 class="page-header">
							<button class="btn mypageBtn" id="sidebarToggle">></button>
							장바구니
						</h2>
					<br></div>
                    <div class="container">
                    	<div class="row mb-3 text-center">
					      <div class="col-md-2 themed-grid-col" id="div_chkAll">
					      	<input type="checkbox" class="form-check-input flex-shrink-0" id="cbx_chkAll" style="margin-right:30px;">전체 선택
					      </div>
					    </div>
					    <div class="row mb-3 text-center">
					      <div class="col-md-1 themed-grid-col"></div>
					      <div class="col-md-7 themed-grid-col">상품 정보</div>
					      <div class="col-md-2 themed-grid-col">가격</div>
					      <div class="col-md-2 themed-grid-col">수량</div>
					    </div>
					<c:if test="${empty list}">
						<div class="col" style="margin-bottom:30px;">
							<div class="p-5 text-center">
								<img src="/resources/assets/fadefadeBlueLogo.png" alt="Generic placeholder image" class="img-fluid" style="width: 160px; margin-bottom:20px;">
							    <h1 class="mb-3">장바구니가 비어있습니다!</h1>
							    <h4 class="mb-3">레시피를 살펴보고 장바구니에 담아보세요</h4>
							  </div>
						</div>
					</c:if>
					<c:forEach items="${list}" var="cart">
					    <div class="row mb-3 text-center" id="cartGroup">
					      <div class="col-md-1 themed-grid-col" id="cartVerticalP">
					      	<input type="checkbox" id="cartVertical" class="form-check-input flex-shrink-0" name="chk" data-cno="${cart.cno}" data-ingre="${cart.iname}" data-price="${cart.price}" data-count="${cart.count}">
					      </div>
					      <div class="col-md-7 themed-grid-col"><img src="${cart.pimage}" width=100px style="margin-right:30px;" >${cart.pname}</div>
					      <div class="col-md-2 themed-grid-col" id="calCount"><div id="cartVertical"><fmt:formatNumber value="${cart.price*cart.count}" pattern="#,###"/>원</div></div>
					      <div class="col-md-2 themed-grid-col" id="cartVerticalP">
					      	<input class="col-md-2" type="number" id="cartVertical" value="${cart.count}" data-cno="${cart.cno}" data-price="${cart.price}" min="1">
					      </div>
					    </div>
					</c:forEach>
					
					<div class="row mb-3 text-center">
				      <div class="col-md-1 themed-grid-col"></div>
				      <div class="col-md-7 themed-grid-col"></div>
				      <div class="col-md-2 themed-grid-col" id="sumPrice">가격</div>
				      <div class="col-md-2 themed-grid-col" id="sumCount">수량</div>
				    </div>
					
					<div style="text-align: center;">
						<input type="button" value="선택삭제" id="deleteBtn" class="btn mypageBtn">
						<input type="button" value="구매하기" id="buyBtn" class="btn mypageBtn">
					</div>
					<br><br><br>
										
					 </div>
                </div>
            </div>
    <!-- Modal -->
	<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
		<div class="modal-dialog" id="addModalDialog">
			<div class="modal-content" id="addModalContent">
				<div class="modal-header">
					<h4 class="modal-title confirm-title" id="confirmModalLabel">confirm</h4>
				</div>
				<div class="modal-body confirm-body">
					확인 또는 취소를 눌러주세요
				</div>
				<div class="modal-footer">
					<button id='modalConfirmBtn' type="button" class="btn btn-primary">확인</button>					
					<button id='modalCloseBtn' type="button" class="btn btn-default">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
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
					<button id='modalAlertBtn' type="button" class="btn btn-primary">확인</button>					
				</div>
			</div>
		</div>
	</div>
        </div>
        <form id='actionForm' action="/member/login.do" method='get'>
		</form>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/mypageScripts.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
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
		
		$("#cbx_chkAll").click(function() {
			if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
			else $("input[name=chk]").prop("checked", false);
		});
		
		$("input[name=chk]").click(function() {
			var total = $("input[name=chk]").length;
			var checked = $("input[name=chk]:checked").length;
			
			if(total != checked) $("#cbx_chkAll").prop("checked", false);
			else $("#cbx_chkAll").prop("checked", true); 
		});	
		
		$.numberWithCommas = function (x) {
			  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		}
		
		$("input[type=checkbox]").click(function() {	//합계금액 변경하기
			var sumP=0;
			var sumC=0;
			$("input[name=chk]:checked").each(function(){
			    sumC = sumC + Number($(this).attr("data-count"));
			    sumP = sumP + $(this).attr("data-count")*$(this).attr("data-price");
			});
			
			sumP = $.numberWithCommas(parseInt(sumP));
			$("#sumPrice").html(sumP +" 원");
			$("#sumCount").html(sumC +" 개");
		});	
		
		
		$("#deleteBtn").click(function(){
			var checkArr = new Array();
			   
		   $("input[name=chk]:checked").each(function(){
		    checkArr.push($(this).attr("data-cno"));
		   });
		   
		   if(checkArr.length == 0){
			   alertModal.modal("show");
		   }else{
			   $(".confirm-title").html("정말 삭제하시겠습니까?")
			   $(".confirm-body").html("확인을 누르면 삭제됩니다.")
			  confirmModal.modal("show");
			  
			  $("#modalConfirmBtn").on("click", function(e){
				  console.log(checkArr);
				   $.ajax({
					    url : "/mypage/deleteCart",
					    method : "post",
					    data : { chbox : checkArr },
					    success : function(){
					    	console.log("삭제 성공");
					    	location.href = "/mypage/cart";
					    }
					});
				});
		   }
		});	//end click
		
		$("#buyBtn").click(function(){
			var ingreArr = new Array();
			var cnoArr = new Array();
			   
		   $("input[name=chk]:checked").each(function(){
		    ingreArr.push($(this).attr("data-ingre"));
		    cnoArr.push($(this).attr("data-cno"));
		   });
		   
		   if(ingreArr.length == 0){
			   /* alert("선택된 제품이 없습니다."); */
			   alertModal.modal("show");
		   }else{
			   $(".confirm-title").html("구매하시겠습니까?")
			   $(".confirm-body").html("구매하시려면 확인을 눌러주세요.")
			  confirmModal.modal("show");
			  
			  $("#modalConfirmBtn").on("click", function(e){
				  console.log(ingreArr);
				   $.ajax({
					    url : "/mypage/addOwnFromCart",
					    method : "post",
					    data : { ingreArr : ingreArr,
					    		 chbox : cnoArr},
					    success : function(){
					    	console.log("구매 성공");
					    	location.href = "/mypage/own";
					    }
					});
				});
		   }
		});	//end click
		
		$("input[type=number]").change(function() {
			var changeCno = $(this).attr("data-cno");
			var changeCount = $(this).val();
			
			$.ajax({
			    url : "/mypage/updateCart",
			    method : "post",
			    data : { cno : changeCno,
			    		 count : changeCount},
			    success : function(){
			    	console.log("수량 변경");
			    	location.href = "/mypage/cart";
			    }
			});
		});	// end change
		
		var actionForm = $("#actionForm");
		
  		 if(('<c:out value="${member.id}"/>')=='') {
  			    console.log("로그인 안됨");
  				actionForm.submit();
  		  }
	});
</script>
    </body>
</html>
<%@include file="../includes/footer.jsp"%>