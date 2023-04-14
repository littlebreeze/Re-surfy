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
						<h1 class="page-header">장바구니</h1>
					<br><br></div>
                    <div class="container">
                    	<div class="row mb-3 text-center">
					      <div class="col-md-2 themed-grid-col">
					      	<input type="checkbox" class="form-check-input flex-shrink-0" id="cbx_chkAll" style="margin-right:30px;">전체 선택
					      </div>
					    </div>
					    <div class="row mb-3 text-center">
					      <div class="col-md-1 themed-grid-col"></div>
					      <div class="col-md-7 themed-grid-col">상품 정보</div>
					      <div class="col-md-2 themed-grid-col">가격</div>
					      <div class="col-md-2 themed-grid-col">수량</div>
					    </div>
					<c:forEach items="${list}" var="cart">
					    <div class="row mb-3 text-center" id="cartGroup">
					      <div class="col-md-1 themed-grid-col">
					      	<input type="checkbox" class="form-check-input flex-shrink-0" name="chk" data-cno="${cart.cno}" data-ingre="${cart.iname}" data-price="${cart.price}" data-count="${cart.count}">
					      </div>
					      <div class="col-md-7 themed-grid-col"><img src="${cart.pimage}" width=100px style="margin-right:30px;" >${cart.pname}</div>
					      <div class="col-md-2 themed-grid-col" id="calCount">${cart.price*cart.count}</div>
					      <div class="col-md-2 themed-grid-col">
					      	<input class="col-md-2" type="number" value="${cart.count}" data-cno="${cart.cno}" data-price="${cart.price}" min="1">
					      </div>
					    </div>
					</c:forEach>
					
					<div class="row mb-3 text-center">
				      <div class="col-md-1 themed-grid-col"></div>
				      <div class="col-md-7 themed-grid-col"></div>
				      <div class="col-md-2 themed-grid-col" id="sumPrice">가격</div>
				      <div class="col-md-2 themed-grid-col" id="sumCount">수량</div>
				    </div>
					
					<div>
						<input type="button" value="선택삭제" id="deleteBtn" class="btn mypageBtn pull-left">
						<input type="button" value="구매하기" id="buyBtn" class="btn mypageBtn pull-left">
					</div>
					<br><br><br>
										
					 </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/mypageScripts.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
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
		
		$("input[type=checkbox]").click(function() {	//합계금액 변경하기
			var sumP=0;
			var sumC=0;
			$("input[name=chk]:checked").each(function(){
			    sumC = sumC + Number($(this).attr("data-count"));
			    sumP = sumP + $(this).attr("data-count")*$(this).attr("data-price");
			});
			$("#sumPrice").html(sumP +" 원");
			$("#sumCount").html(sumC +" 개");
		});	
		
		
		$("#deleteBtn").click(function(){
			var checkArr = new Array();
			   
		   $("input[name=chk]:checked").each(function(){
		    checkArr.push($(this).attr("data-cno"));
		   });
		   
		   if(checkArr.length == 0){
			   alert("선택된 제품이 없습니다.");
		   }else{
			  var confirm_val = confirm("정말 삭제하시겠습니까?");
			  
			  if(confirm_val) {
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
			  } 
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
			   alert("선택된 제품이 없습니다.");
		   }else{
			  var confirm_val = confirm("구매하시겠습니까?");
			  
			  if(confirm_val) {
				   console.log(ingreArr);
				   $.ajax({
					    url : "/mypage/addOwn",
					    method : "post",
					    data : { ingreArr : ingreArr,
					    		 chbox : cnoArr},
					    success : function(){
					    	console.log("구매 성공");
					    	location.href = "/mypage/own";
					    }
					});
			  } 
		   }
		});	//end click
		
		$("input[type=number]").change(function() {
			alert("수량 변경")
			var changeCno = $(this).attr("data-cno");
			var price = $(this).attr("data-price");
			var changeCount = $(this).val();

			$("#calCount").html(price*changeCount);
			
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
	});
</script>
    </body>
</html>

