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
        
        <style>
        	@import url('https://fonts.googleapis.com/icon?family=Material+Icons');

			.dropdown{
			  position : relative;
			  display : inline-block;
			}
			
			
			.shareBtn{
			  border : 1px solid rgb(37, 37, 37);
			  border-radius : 4px;
			  background-color: #f5f5f5;
			  font-weight: 400;
			  color : rgb(37, 37, 37);
			  padding : 12px;
			  width :200px;
			  text-align: left;
			  cursor : pointer;
			  font-size : 12px;
			}
			.dropdown-content{
			  display : none;
			  position : absolute;
			  z-index : 1;
			  font-weight: 400;
			  background-color: #f9f9f9;
			  min-width : 150px;
			}
			
			.dropdown-content a{
			  display : block;
			  text-decoration : none;
			  color : rgb(37, 37, 37);
			  font-size: 12px;
			  padding : 12px 20px;
			}
			
			.dropdown-content a:hover{
			  background-color : #E4EEF0
			}
			
			.dropdown:hover .dropdown-content {
			  display: block;
			}
        </style>
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">마이 페이지</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/mypage/list">작성 글 모아보기</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/mypage/cart">장바구니</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" style="font-weight:bold; font-size:1.2rem;" href="/mypage/own">가진 재료</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Page content-->
				<div class="container-fluid">
					<div class="col-lg-12">
						<h2 class="page-header">
							<button class="btn mypageBtn" id="sidebarToggle">></button>
							가진 재료
						</h2>
					<br></div>
					<div class="col-lg-12 themed-container">
						<!-- <div class='pull-right'>
							<button id="shareBtn" class="btn mypageBtn"><img src="/resources/assets/share.png" width="20" height="20"></button>
						</div>-->
						
						<div class='pull-right'>
  						<div class="dropdown">
					      <button id="shareBtn" class="btn mypageBtn"> 
					        
					        <img src="/resources/assets/share.png" width="20" height="20">
					      </button>
					      <div class="dropdown-content">
					        <a id="copyIngre">가진 재료 복사</a>
					        <a id="shareKakao" onclick="js:kakaoShare()">카카오톡 공유하기</a>
					      </div>
					    </div>
  						</div>
					</div>
					<div class="container">
						<div class="row mb-3 text-center" id="chkAll" style="display:none;">
					      <div class="col-md-2 themed-grid-col" id="div_chkAll">
					      	<input type="checkbox" class="form-check-input flex-shrink-0" id="cbx_chkAll" style="margin-right:30px;">전체 선택
					      </div>
					    </div>
					    <form id='searchForm' action="/recipe/get" method='get'>
					    <c:if test="${empty list}">
							<div class="col" style="margin-bottom:30px;">
								<div class="p-5 text-center">
									<img src="/resources/assets/fadefadeBlueLogo.png" alt="Generic placeholder image" class="img-fluid" style="width: 160px; margin-bottom:20px;">
								    <h1 class="mb-3">재료를 추가해보세요!</h1>
								    <h4 class="mb-3">더 다양한 검색이 가능합니다</h4>
								  </div>
							</div>
						</c:if>
						<div class="row row-cols-1 row-cols-md-3 g-3 text-center">
							<c:forEach items="${list}" var="own">
								<div class="col themed-grid-col" id="ownGroup">
									<input type="checkbox" class="form-check-input flex-shrink-0" style="display:none; margin-right:30px;" name="chk" data-ownno="${own.ownNo}" data-name="${own.ingreName}" value="${own.ingreName}">${own.ingreName}
								</div>
							</c:forEach>
						</div>
						<input type="hidden" name='type' value="O"/>
						</form>
				<div style="margin-top: 1rem !important; text-align: center;">		
					<input type="button" value="편집 및 검색" id="editBtn" class="btn mypageBtn pull-left">
					<input type="button" value="추가" id="addNewBtn" class="btn mypageBtn pull-left">
					<input type="button" style="display:none;" value="검색" id="searchBtn" class="btn mypageBtn pull-left">	
					<input type="button" style="display:none;"  value="선택삭제" id="deleteBtn" class="btn mypageBtn pull-left">
					<input type="button" style="display:none;"  value="취소" id="cancleBtn" class="btn mypageBtn pull-left">
				</div>
                </div>	<!-- end .container -->
            </div>
        </div>
	<!-- Modal -->
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
		<div class="modal-dialog" id="addModalDialog">
			<div class="modal-content" id="addModalContent">
				<div class="modal-header">
					<h4 class="modal-title" id="addModalLabel">새로운 재료 추가</h4>
				</div>
				<div class="modal-body">
					<form class="p-2 mb-2 bg-body-tertiary border-bottom" id="addOwnForm" action="/mypage/addOwn" method="post">
				      <input type="search" class="form-control"placeholder="Type to filter..." id="autoComplete" name="addIngreName">
				    </form>
				</div>
				<div class="modal-footer">
					<button id='addOwnBtn' type="button" class="btn btn-primary">등록</button>					
					<button id='closeBtn' type="button" class="btn btn-default">닫기</button>
				</div>
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
					<button id='modalCCloseBtn' type="button" class="btn btn-default">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="alertModalLabel" aria-hidden="true">
		<div class="modal-dialog" id="addModalDialog">
			<div class="modal-content" id="addModalContent">
				<div class="modal-header">
					<h3 class="modal-title" id="alertModalLabel">선택된 재료가 없습니다!</h3>
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
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/mypageScripts.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		var alertModal = $("#alertModal");
		var confirmModal = $("#confirmModal");
		var modal = $("#addModal");
		
		$("#addNewBtn").on("click", function(e) {
			modal.modal("show");
		});
		
		var modalCloseBtn = $("#closeBtn");
		modalCloseBtn.on("click", function(e){
			modal.modal("hide");
		});
		
		var modalCCloseBtn = $("#modalCCloseBtn");
		modalCCloseBtn.on("click", function(e){
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
		
		$("#deleteBtn").click(function(){
			var checkArr = new Array();
			   
		   $("input[name=chk]:checked").each(function(){
		    checkArr.push($(this).attr("data-ownno"));
		   });
		   
		   if(checkArr.length == 0){
			   alertModal.modal("show");
		   }else{
			   $(".confirm-title").html("정말 삭제하시겠습니까?")
			   $(".confirm-body").html("확인을 누르면 삭제됩니다.")
			   $("#modalConfirmBtn").html("삭제");
			  confirmModal.modal("show");

			$("#modalConfirmBtn").on("click", function(e){
				   console.log(checkArr);
				   $.ajax({
					    url : "/mypage/deleteOwn",
					    method : "post",
					    data : { chbox : checkArr },
					    success : function(){
					    	console.log("삭제 성공");
					    	location.href = "/mypage/own";
					    }
					});
				});
		   }
		});	//end click
		
		$("#copyIngre").click(function(){
			  $(".confirm-title").html("가진 재료 공유하기");
			  $(".confirm-body").html("<textarea id='ownText' cols='50' rows='5'></textarea>");
			  $("#modalConfirmBtn").html("복사");
			  $("#ownText").val("문자열입니다");
			  var olist = "가진 재료 리스트는 /";
			  olist += "<c:forEach items='${list}' var='own'>${own.ingreName}/</c:forEach>";
			  olist += " 입니다."
			  $("#ownText").val(olist);
			  confirmModal.modal("show");
			  $("#modalConfirmBtn").on("click", function(e){
				  $("#ownText").select();
				  document.execCommand('copy');
				  $("#copyMsg").remove();
				  $(".confirm-body").append("<div id='copyMsg' style='text-align:center; color:#6cc3d5;'>복사 되었습니다!</div>");
				});
		});
		
		$("#editBtn").click(function(){
			if($("input[name=chk]").css("display")=="none"){
				$("input[name=chk]").toggle();
				$("#deleteBtn").toggle();
				$("#cancleBtn").toggle();
				$("#chkAll").toggle();				
				$("#editBtn").toggle();
				$("#searchBtn").toggle();
				$("#addNewBtn").toggle();
			}
		});	//end click
		
		$("#cancleBtn").click(function(){
			$("#editBtn").toggle();
			$("#searchBtn").toggle();
			$("input[name=chk]").toggle();
			$("#deleteBtn").toggle();
			$("#cancleBtn").toggle();
			$("#chkAll").toggle();	
			$("#addNewBtn").toggle();
		});	//end click
		
		var addOwnForm = $("#addOwnForm");
		$("#addOwnBtn").on("click",	function(e) {
			e.preventDefault();
			console.log($("input[type='search']").val());
			if($("input[type='search']").val()=="")
				alert("값을 입력하세요");
			else{
				var sameChk = true;
				 $("input[type=checkbox]").each(function(){
					 if($(this).attr("data-name")==$("input[type='search']").val()){
						 alert("이미 있는 재료 입니다.");
						 sameChk=false;
					 }
				});
				 if(sameChk)
					 addOwnForm.submit();
			}
				
		});	//end click
		
		var searchForm = $("#searchForm")
		$("#searchBtn").click(function(){
			var cnt=0;
			   
			   $("input[name=chk]:checked").each(function(){
				   cnt=cnt+1;
			    	console.log("값은 "+ $(this).val());
			   });
			   
			   if(cnt == 0){
				   alertModal.modal("show");
			   }else{
				   searchForm.submit();
			   }
		});	//end click
		
		if(('<c:out value="${member.id}"/>')=='') {
		    console.log("로그인 안됨");
		    searchForm.find("input[name='type']").remove();
		    searchForm.attr("action","/member/login.do");
		    searchForm.submit();
	  }
		
/* 		$(".col").click(function(){
			alert($(this).find("input[type='checkbox']").attr("data-ownno"));
		});	//end click */
	});
</script>
<script type="text/javascript">
$(document).ready(function(){
	$('#autoComplete').autocomplete({
		source : function(request, response) { //source: 입력시 보일 목록
		     $.ajax({
		           url : "/mypage/autocomplete"   
		         , type : "POST"
		         , dataType: "JSON"
		         , data : {value: request.term}	// 검색 키워드
		         , success : function(data){ 	// 성공
		             response(
		                 $.map(data.resultList, function(item) {
		                     return {
		                    	     label : item.INGRENAME    	// 목록에 표시되는 값
		                           , value : item.INGRENAME 		// 선택 시 input창에 표시되는 값
		                           , idx : item.rn // index
		                     };
		                 })
		             );    //response
		         }
		         ,error : function(){ //실패
		             alert("오류가 발생했습니다.");
		         }
		     });
		}
		,focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
				return false;
		}
		,minLength: 1// 최소 글자수
		,autoFocus : true // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
		,delay: 100	//autocomplete 딜레이 시간(ms)
		,select : function(evt, ui) { 
	      	// 아이템 선택시 실행 ui.item 이 선택된 항목을 나타내는 객체, lavel/value/idx를 가짐
				console.log(ui.item.label);
				console.log(ui.item.idx);
		 }
	});
	
	$("#addModal").on("shown.bs.modal", function() {
		  $("#autoComplete").autocomplete("option", "appendTo", "#addModal")
	})
});
</script>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
    Kakao.init('JAVASCRIPT_KEY');  
    Kakao.isInitialized();
    var thisUrl = document.URL;
    var olist = "<c:out value='${member.userName}'/>님이 가지고 있는 재료는 ";
	  olist += "<c:forEach items='${list}' var='own'>${own.ingreName} </c:forEach>";
	  olist += "입니다."
    function kakaoShare(){
       Kakao.Share.createDefaultButton({
            container: '#shareKakao',
            objectType: 'feed',
            content: {
              title: '가진 재료 공유하기',
              description: olist,
              imageUrl:
            	  'imageUrl',
              link: {
                mobileWebUrl: thisUrl,
                webUrl: thisUrl,
              },
            },
            itemContent: {
              profileText: 'Resurfy',
              profileImageUrl: 'profileImageUrl',
            },

          });
    }
    </script>
    </body>
</html>
<%@include file="../includes/footer.jsp"%>
