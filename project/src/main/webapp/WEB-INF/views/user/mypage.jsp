<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" >

<!-- 모달용 css, js -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pointCharge.css" >

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script defer src="${pageContext.request.contextPath}/resources/js/mypage.js"></script>

<style>
.container{
   position: relative;
   width: 750px;
   margin: 0 auto;
    padding-bottom: 150px;
}

.page-name {
   margin-top: 75px;
   font-size: 26px;
   font-weight: bold;
}

hr {
   margin: 20px 0;
   height: 2px;
}

.my_top {
   margin-top: 30px;
   display: flex;
   justify-content: space-between;
}

.my_side {
   background-color: #fcfcfc;
   width: 210px;
   padding: 20px;
   box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
}

.my_side ul li {
   padding: 5px 0;
}

.my-content {
   background-color: #fcfcfc;
   width: 500px;
   box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
}

.my-content>div {
   padding: 25px
}

.my-sub-info {
   margin: 20px 0;
   font-size: 14px;
   color: #5c5c5c;
}

.my-sub-info, .my-sub-info td {
   border: none;
}

.my-sub-info tr td {
   padding-right: 20px;
}

.my-info {
   width: 100%;
}

.my_name span {
   font-size: 24px;
   font-weight: bold;
}

.my_point {
   width: 100%;
   display: flex;
}

.my_point_text {
   color: #ffc9c9;
   font-size: 24px;
   font-weight: bold;
   margin-right: 10px;
}

.my_point_btn {
   margin: 5px 3px;
}

.my_point_btn button {
   width: 75px;
   height: 25px;
   border-radius: 25px;
   border: 0px solid #5c5c5c;
   background-color: #e7e7e7;
   transition: 0.3s;
}

.my_point_btn:hover {
   text-decoration: none;
}

.my_point_btn button:hover {
   background-color: #ffc9c9;
}

.my-list {
   position: relative;
   width: 750px;
   min-height: 315px;
   margin: 50px auto;
}

.my-list-ul {
   margin: 0 auto;
   font-weight: bold;
}

.my-list-ul ul {
   display: flex;
   justify-content: space-between;
   padding: 20px 10px;
   border-bottom: 2px solid #5c5c5c;
}

.my-list-ul hr {
   width: 100%;
   margin: 15px auto;
}

/* 페이징 */
.paging {
   padding: 30px;
   text-align: center;
   width: 400px;
   align-items: center;
   margin: 0 auto;
}

.paging a {
   width: 40px;
   height: 30px;
   line-height: 30px;
   display: inline-block;
   border-radius: 5px;
   color: rgb(53, 53, 53)
   
}
.paging a:hover {
   text-decoration: none;
   color: #d1d1d1;
}
.paging_i{
   background-color: #ffffff;
}
.paging_i.active {
    font-weight: bold;
    color: black;
}

.list-tbl {
   width: 90%;
   margin: 10px auto;
}

.list-head {
   color: #5c5c5c;
   font-weight: bold;
   text-align: left;
   border-bottom: 1px solid #a7a7a7;
   
}

.list-head td {
   padding: 10px 20px;
}

.list-data {
   text-align: left;
   border-bottom: 1px dotted #a7a7a7;
}

.list-data td {
   padding: 10px 20px;
}

#account-holder{
   width: 200px;
}
td{
	text-align: center;
}
.post-title {
   display: block;
   width: 330px;
   text-align: left !important;
   overflow: hidden;
   text-overflow: ellipsis;
   white-space: nowrap;
   cursor: pointer;
}

.head-title, .post-title {
   padding-left: 5px !important;
}
</style>

</head>
<body>

   
<div class="wrap">
   <%@ include file="../nav.jsp" %>
   <div class="container">
        <div class="page-name">
         마이페이지
           <hr>
         </div>
      <!-- my_top -->
      <div class="my_top">
           <div class="my_side">
               <ul>
                  <li><a href="/project/board/my/inquiry6">1:1문의내역</a></li>
                   <li><a href="/project/point/showMyPoint.do">포인트 내역</a></li>
                   <li><a href="/project/user/modifyInfo.do">정보수정</a></li>
                   <li><a href="" onclick="deleteAccount()" style="cursor: pointer;">회원탈퇴</a></li>
              </ul>
         </div>

            <div class="my-content">
               <div class="my-info">
                  <div class="my_name">
                     <span>${user.nickname}</span> 님 반갑습니다😘
                  </div>
               </div>


               <div class="my_point">
                   <div class="my_point_text">${user.userPoint}P</div>
               <div class="my_point_btn">
                  <button class="open" id="openModal">충전</button>
                  <button class="open" id="openModal2">환전</button>
               </div>
               </div>
         </div>
      </div>

      <!-- my_list -->
      <div class="my-list">
           <div class="my-list-ul">
            <ul>
               <li><a href="#">작성한 글</a></li>
               <li><a href="#">스크랩</a></li>
               <li><a href="#">추천한 글</a></li>
               <li><a href="#">구매한 글</a></li>
               <li><a href="#">내 댓글</a></li>
            </ul>
        </div>

      <table class="list-tbl">
               <tr class="list-head">
                  <td>No.</td>
                  <td class="head-title">제목</td>
                  <td>카테고리</td>
                  <td>작성일</td>
               </tr>

               <c:forEach var="board" items="${list}" varStatus="status">
                  <tr class="list-data">
                     <td>${(paging.totRecords - (status.index + 1) - ((paging.currentPage - 1) * paging.pageSize))+1}</td>
                     <td class="post-title"><a
                        title="<c:out value='${board.boardTitle}' />"> <c:out
                              value="${board.boardTitle}" />
                     </a></td>
                     <td><c:choose>
                           <c:when test="${board.boardType == 0}">루트게시판</c:when>
                           <c:when test="${board.boardType == 1}">여행후기</c:when>
                           <c:when test="${board.boardType == 2}">꿀팁공유</c:when>
                           <c:when test="${board.boardType == 3}">질문있어요</c:when>
                           <c:when test="${board.boardType == 4}">수방</c:when>
                           <c:when test="${board.boardType == 5}">동행 구해요!</c:when>
                           <c:when test="${board.boardType == 6}">문의</c:when>
                           <c:otherwise>알 수 없음</c:otherwise>
                        </c:choose></td>
                     <td><c:out value="${board.boardWritedate}" /></td>
                  </tr>
               </c:forEach>
            </table>


         <div class="paging">
          <c:if test="${ empty search.condition}">
            <c:if test="${paging.currentGrp > 1}">
                 <a href="/project/user/mypage.do?page=${paging.grpStartPage - 1}">이전</a>
             </c:if>
             <c:forEach var="i" begin="${paging.grpStartPage}" end="${paging.grpEndPage}">
                 <a class="paging_i" href="/project/user/mypage.do?page=${i}">${i}</a>
             </c:forEach>
             <c:if test="${paging.grpEndPage <  paging.totalPage}">
                 <a href="/project/user/mypage.do?page=${paging.grpEndPage + 1}">다음</a>
             </c:if>
          </c:if>
         </div>
    </div>
</div>

   <%@ include file="../footer-sub.jsp" %>
</div>
</body>
</html>
