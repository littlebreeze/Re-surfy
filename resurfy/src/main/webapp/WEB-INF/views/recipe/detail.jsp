<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

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

<style>

#listBtn, #modifyBtn, #addReplyBtn, #addCartBtn{
 &:hover {
      animation: jelly 0.5s;
    }
}

@keyframes jelly {
25% {
    transform: scale(0.9, 1.1);
  }
  
  .sharebtn#kakaoBtn:hover {
   background-color:#ff7851;
  }


</style>
<style>
	@import url('https://fonts.googleapis.com/icon?family=Material+Icons');

			.dropdown{
			  position : relative;
			  display : inline-block;
			}
			
			
			.shareBtn{
			  border : 1px solid rgb(37, 37, 37);
			  border-radius : 4px;
			  background-color: white;
			  font-weight: 400;
			  color : rgb(37, 37, 37);
			  padding : 12px;
			  width :50px;
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
			  background-color : #ffe7e0
			}
			
			.dropdown:hover .dropdown-content {
			  display: block;
			}
			
			.shareBtn:hover{
				background-color: #ff7851;
			}
</style>
</head>
<body>
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5" >
            <div class="text-center">
        <img src='<c:out value="${recipe.image }"/>' readonly="readonly" width=800px height=600px alt="...">
              
              <div class="row">
                 <div class="fs-5 mb-5">
                       <br>
                     	<div class='sharebtn' style="width: 88%;text-align:right">
  						<div class="dropdown">
					      <button id="shareBtn" class="shareBtn" style="border:1px solid #ffe7e0; border-radius:10px 10px; "> 
					        
					        <img src="/resources/assets/share.png" width="20" height="20">
					      </button>
					      <div class="dropdown-content" style="text-align:left">
					        <a id="copyLink">링크 복사하기</a>
					        <a id="kakaoBtn" onclick="js:kakaoShare()">카카오톡 공유하기</a>
					      </div>
					    </div>
  						</div>
                            <div class="form-group">
                            <h1 class="p-2 fw-bolder"> <c:out value="${recipe.recipeName }"/> </h1>

                  </div>
               
                             <div class="p-2 small mb-1">
                             
                             <span style="font-size:20px">난이도 : </span>
                             <span style="font-size:20px"><c:out value="${recipe.difficulty }"/> &nbsp &nbsp &nbsp &nbsp &nbsp</span>
                             <span style="font-size:20px">소요시간 : </span>
                             <span style="font-size:20px"><c:out value="${recipe.time }"/></span>
                             </div>
                            
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
                        <div class="fw-bolder" style="font-size:25px; color:#FF7851">Step<c:out value="${st.stepNo}" /></div>
                        <hr class="my-2" align="left" style="width: 100%; margin: 0 auto;">
                        <br><span style="font-size:20px"><c:out value="${st.stepDescription}" /></span>
                        <c:choose>
                           <c:when test="${st.tip == ' ' || st.tip == '0' || st.tip == null}"> 
                        <div style="font-size:18px"></div>
                        </c:when>
                        <c:otherwise>
                        <div class="fw-bolder" style="font-size:15px"><br>❈ tip <br> <c:out value="${st.tip}" /></div>
                        </c:otherwise> 

                     </c:choose>  
                        </div>
                        </div>
                           </c:when> 

                           <c:otherwise>
                           <div class="py-3 row"> 
                        <div class="col"><img src='<c:out value="${st.stepImage }"/>' readonly="readonly" width=350px height=300px  alt="..."></div>
                        <div class="col">
                        <div class="fw-bolder" style="font-size:25px; color:#FF7851">Step<c:out value="${st.stepNo}" /></div>
                        <hr class="my-2" align="left" style="width: 100%; margin: 0 auto;">
                        <br>
                        <span style="font-size:20px"><c:out value="${st.stepDescription}" /></span>
                           <c:choose>
                           <c:when test="${st.tip == ' ' || st.tip == '0' || st.tip == null}"> 
                        <div style="font-size:18px"></div>
                        </c:when>
                        <c:otherwise>
                        <br>
                        <div class="fw-bolder" style="font-size:15px"><br>❈ tip <br> <c:out value="${st.tip}" /></div>
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
                  
                  <button id='modifyBtn' data-oper='modify' class='py-3   btn btn-primary btn-jelly' onclick = "location.href='/recipe/modify?bno=<c:out value="${recipe.bno }"/>'" style="width:200px; height:70px; background-color: #FF7851; font-size:20px; border:none; text-align:center">수정</button>
                  </c:if>
                  </div>
                  
                  </div>
               
         
                  <br><br><br><br><br>
                  
                  <div class="fw-bolder" style=" width: 90%; margin: 0 auto; text-align:left">댓글</div>
                  <br>
                  <div class="row"></div>
                   <div class="row"  style=" width: 90%; margin: 0 auto; text-align:left">
                      <div class="col-11"><input class="form-control" rows="3" id='replybox' placeholder="댓글을 입력해주세요." style="width:95%; height:60px" ></div>
                      <div class="col-1"><button id='addReplyBtn'
                                 class='btn btn-primary btn-jelly' style="width:150%; height:60px; background-color: #FF7851; border:none; float:right; font-size:20px">등록</button></div>
                    
                  
                  </div><br>
                        
                  <div class="row">
                     <div class="col-lg-12">
                        <div class="panel panel-default">
                         
                           <!-- /.panel-heading -->
                           <div class="panel-heading">
                           <i class="fa fa-comments fa=fw"></i> <!-- Reply -->
                          
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
                     
                     
              </div> <!-- 전체 end -->
         </div>
         
<section class="py-5" style="background-clor:white">
    <div class="container px-4 px-lg-5 mt-5">
       <div>
        <h2 class="fw-bolder mb-4 h4">이 레시피를 위한 추천 재료 <button id='addCartBtn' class='btn btn-primary btn-jelly text-center' style="font-size: 20px; width:200px; height:70px; background-color: #FF7851; border:none; float:right"><img src="/resources/assets/detail/cart.png" width="30px" height="30px">&nbsp 장바구니 담기</button></h2>
        <div>❈ 이미지를 클릭하면 네이버 쇼핑 페이지로 이동합니다.</div>
        </div>
        <br>
        <hr class="my-2" align="center" style="margin: 0 auto;">
        <br>
        <!-- 없는 재료 -->
        <h2 class="fw-bolder mb-4 h4">내가 가지고 있지 않은 재료</h2>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center py-5 bg-light" style="border: 3px solid #FF7851; border-radius:30px; padding: 10px">
        
           <c:if test="${empty shopNotIn}">
            <div class="col" style="margin-bottom:30px;">
               <div class="p-7 text-center">
                   <h5 class="mb-3"><br>레시피에 필요한 재료를<br><br> 모두 가지고 있습니다!</h5>
                 </div>
            </div>
         </c:if>
           <c:forEach items="${shopNotIn}" var="sni">
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Product image-->
                    <a href="${sni.link}"><img class="card-img-top" src="${sni.image}" alt="..." style="height:200px"/></a>
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder" style="height:135px; font-size:20px">${sni.title}</h5>
                            <!-- Product price-->
                            
                     <div style="color:blue; font-size:20px"><fmt:formatNumber value="${sni.lprice}" pattern="#,###"/>원</div>
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                       <div class="text-center"><input style='zoom:2.5; accent-color: #ff7851;' type='checkbox' name="chk" data-price="${sni.lprice}" data-title="${sni.title}" data-ingre="${sni.ingredient}" data-image="${sni.image}" data-pid="${sni.productId}"/></div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
        <!-- 있는 재료 -->
        <br><br>
        <h2 class="fw-bolder mb-4 h4">내가 가지고 있는 재료</h2>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" style="border: 3px solid #FF7851; border-radius:30px;  text-align : center; padding : 100px 0; text-align:center">
           <c:if test="${empty shopIn}">
            <div class="col" style="margin-bottom:30px;">
               <div class="p-7 text-center">
                   <h5 class="mb-3" style="align-items: center"><br>가지고 있는 재료를<br><br> 추가해보세요!</h5>
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
                            <h5 class="fw-bolder" style="height:135px; font-size:20px">${si.title}</h5>
                            <!-- Product price-->
                            <div style="color:blue; font-size:20px"><fmt:formatNumber value="${si.lprice}" pattern="#,###"/>원</div>
                            
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><input type='checkbox' style='zoom:2.5; accent-color: #ff7851' name="chk" data-price="${si.lprice}" data-title="${si.title}" data-ingre="${si.ingredient}" data-image="${si.image}" data-pid="${si.productId}" /></div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</section>


        </section>
        

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
          
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
               <button id='modalConfirmBtn' type="button" class="btn btn-primary" style= "background-color:#FF7851; border:none">확인</button>               
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
               <button id='modalAlertBtn' type="button" class="btn btn-primary" style= "background-color:#FF7851; border:none">확인</button>               
            </div>
         </div>
      </div>
   </div>
   
   <!-- Modal - 레시피 공유 -->
   <div class="modal fade" id="linkalertModal" tabindex="-1" role="dialog" aria-labelledby="alertModalLabel" aria-hidden="true">
      <div class="modal-dialog" id="addModalDialog">
         <div class="modal-content" id="addModalContent">
            <div class="modal-header">
               <h3 class="linkmodal-title" id="alertModalLabel">선택된 제품이 없습니다!</h3>
            </div>
            <div class="linkmodal-body">
               다시 확인해주세요
            </div>
            <div class="modal-footer">
               <button id='modalAlertBtn' type="button" class="btn btn-primary" style= "background-color:#FF7851; border:none">확인</button>               
            </div>
         </div>
      </div>
   </div>
   
   <!-- Modal -->
   <div class="modal fade" id="nocalertModal" tabindex="-1" role="dialog" aria-labelledby="alertModalLabel" aria-hidden="true">
      <div class="modal-dialog" id="addModalDialog">
         <div class="modal-content" id="addModalContent">
            <div class="modal-header">
               <h3 class="nocmodal-title" id="alertModalLabel">선택된 제품이 없습니다!</h3>
            </div>
            <div class="nocmodal-body">
               다시 확인해주세요
            </div>
            <div class="modal-footer">
               <button id='modalAlertBtn' type="button" class="btn btn-primary" style= "background-color:#FF7851; border:none">확인</button>               
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
               <h4 class="remodal-title" id="reModalLabel">댓글창</h4>
            </div>
            <div class="remodal-body">
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
               <button id='modalRegisterBtn' type="button" class="btn btn-primary" style= "background-color:#FF7851; border:none">등록</button>
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
   
   var str = "<ul class='pagination' style='justify-content : center;'>";
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

   showList(1);
   function showList(page){
      console.log("show list " + page);
      
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
            str+= "<div align='left'><div class='header'><strong class='primary-font' style='color:#FF7851'>" + "<img src='/resources/assets/detail/user.png' width='25px' height='25px'> &nbsp"+list[i].id + "</strong>";
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
         $(".modal-title").html("댓글 등록 알림")
             $(".modal-body").html("댓글이 등록되었습니다!")
             alertModal.modal("show");
         modal.find("input").val("");
         modal.modal("hide");
         
         //showList(1);
         showList(-1);
      });
      parent.document.getElementById('replybox').value='';

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
         $(".modal-title").html("댓글 수정 알림")
             $(".modal-body").html("댓글이 수정되었습니다!")
             alertModal.modal("show");
         modal.modal("hide");
         showList(pageNum);
      });
   });
   
   modalRemoveBtn.on("click", function(e) {
      var rno = modal.data("rno");
      replyService.remove(rno, function(result) {
         //alert(result);
         $(".modal-title").html("댓글 삭제 알림")
             $(".modal-body").html("댓글이 삭제되었습니다!")
             alertModal.modal("show");
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
     
      
      <script>
$(document).ready(function() {

   var alertModal = $("#alertModal");
   var nocalertModal = $("#nocalertModal");
   var confirmModal = $("#confirmModal");
   
   var modalCloseBtn = $("#modalCloseBtn");
   modalCloseBtn.on("click", function(e){
      confirmModal.modal("hide");
   });
   
   $("#modalAlertBtn").on("click", function(e){
      alertModal.modal("hide");
   });
   
   $("#nocalertModal").on("click", function(e){
	   nocalertModal.modal("hide");
   });	
   
$("#addCartBtn").on("click", function(e){
   if(('<c:out value="${member.id}"/>')=='') {
        $(".modal-title").html("로그인이 필요합니다")
        $(".modal-body").html(" 로그인하고 장바구니에 담아보세요!")
        $("#modalAlertBtn").html("닫기");
        alertModal.modal("show");
     }else{
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
    
    $(".nocmodal-title").html("장바구니 알림")
    $(".nocmodal-body").html("선택된 제품이 없습니다!")
    nocalertModal.modal("show");
 
 }else{

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
     
     $(".modal-title").html("장바구니에 추가되었습니다!")
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
     }
});
});
</script>

<script>
$(document).ready(function() {
	 var linkalertModal = $("#linkalertModal");
	   
	   var modalCloseBtn = $("#modalCloseBtn");
	   modalCloseBtn.on("click", function(e){
	      confirmModal.modal("hide");
	   });
	   
	   $("#linkalertModal").on("click", function(e){
		   linkalertModal.modal("hide");
	   });	

	   var thisUrl = document.URL;
	   
	$("#copyLink").click(function(){
		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		
		$(".linkmodal-title").html("레시피 공유하기")
	     $(".linkmodal-body").html("링크가 복사되었습니다!")
	     linkalertModal.modal("show");
	});
});

</script>

 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        Kakao.init('JAVASCRIPT_KEY');  
        Kakao.isInitialized();
        var thisUrl = document.URL;
        function kakaoShare(){
           Kakao.Share.createDefaultButton({
                container: '#kakaoBtn',
                objectType: 'feed',
                content: {
                  title: '<c:out value="${recipe.recipeName}"/>',
                  description: '<c:out value="${recipe.recipeDescription}"/>',
                  imageUrl:
                	  '<c:out value="${recipe.image}"/>',
                  link: {
                    mobileWebUrl: thisUrl,
                    webUrl: thisUrl,
                  },
                },
                itemContent: {
                  profileText: 'Resurfy',
                  profileImageUrl: 'profileImageUrl',
                },
               
                buttons: [
                  {
                    title: '웹으로 이동',
                    link: {
                      mobileWebUrl: thisUrl,
                      webUrl: thisUrl,
                    },
                  },

                ],
              });
        }
      
    </script>

   <%@include file="../includes/footer.jsp"%>
</body>
</html>