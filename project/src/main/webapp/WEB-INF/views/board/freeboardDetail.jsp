<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.acorn.project.user.User"%>
<%@ include file="../nav-sub.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/quill@2.0.1/dist/quill.snow.css"   rel="stylesheet" />
<link rel="stylesheet"   href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/styles/atom-one-dark.min.css" />
<link rel="stylesheet"   href="https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- icon key -->
<script src="https://kit.fontawesome.com/7fa6781ad2.js"   crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css"   href="${pageContext.request.contextPath}/resources/css/freeBoardDetail.css">
<link rel="stylesheet" type="text/css"   href="${pageContext.request.contextPath}/resources/css/reset.css">
<style type="text/css">
.ql-tooltip {
   display: none;
}
</style>
<script defer
   src="${pageContext.request.contextPath}/resources/js/changeType.js"></script>
<script defer
   src="${pageContext.request.contextPath}/resources/js/LikeArch.js"></script>
<script defer
   src="${pageContext.request.contextPath}/resources/js/report.js"></script>
<script defer
   src="${pageContext.request.contextPath}/resources/js/comment.js"></script>

<%
User user = (User) session.getAttribute("user");
String userCode = (user != null) ? user.getUserCode() : null;
%>

</head>
<body>
   <div class="wrap">

      <!-- 게시판 -->
      <div class="container">
         <div class="side_menu">
            <div class="side_menu_set">
               <h3>
                  <a href="/project/board/free?type=-1">자유게시판</a>
               </h3>
               <ul>
                  <li><a href="/project/board/free?type=-1"> 전체글</a></li>
                  <li><a href="/project/board/free?type=1"> 여행후기</a></li>
                  <li><a href="/project/board/free?type=2"> 꿀팁공유</a></li>
                  <li><a href="/project/board/free?type=3"> 질문있어요!</a></li>
                  <li><a href="/project/board/free?type=4"> 수다방</a></li>
                  <li><a href="/project/board/free?type=5"> 동행구해요!</a></li>
               </ul>
            </div>
         </div>
         <div class="content_wrap">
            <!-- 게시판이름 -->
            <div class="boardType">${freeboard.boardType}</div>
            <div class="report">
               <button onclick="report()">
                  <img class="img-black"   src="${pageContext.request.contextPath}/resources/img/alert-black.png" style="width: 20px; height: 20px;" alt=""> 
                  <img class="img-red" src="${pageContext.request.contextPath}/resources/img/alert-red.png" style="width: 20px; height: 20px;" alt="">
               </button>
            </div>
            <div class="freeboard_page_title">
               <div class="title">${freeboard.boardTitle}</div>
               <div class="nickname">${freeboard.nickname}
                  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSirRCxfXvgU4rkE8dmKE6lqewZ4D7wa40h0Q&s" alt="">
               </div>
               <div class="writeDatw">${freeboard.boardWritedate}</div>
               <div class="boardViews">조회수 ${freeboard.boardViews}</div>

               <input type="hidden" class="boardUsercode"   value="${freeboard.userCode}"> 
               <input type="hidden" class="userCode" value=<%=userCode%>> 
               <input type="hidden" class="boardCode" value="${freeboard.boardCode}">
            </div>


            <div class="freeboard_page_content">
               <!-- 내용 -->
               <div class="content">${freeboard.boardContent}</div>
            </div>

            <div class="freeboard_page">
               <div class="freeboard_page_img">
                  <div>
                     <!-- 좋아요, 스크랩 부분 -->
                     <a href="#" class="like-btn"> 
                        <i class="fa-regular fa-heart fa-xl like-icon"></i> <!-- 좋아요 클릭 변경 아이콘 -->
                        <i class="fa-solid fa-heart fa-xl liked-icon hidden"></i>
                     </a> <a href="#" class="scrap-btn"> 
                        <i class="fa-regular fa-bookmark fa-lg scrap-icon"></i> <!-- 글 스크랩 시 변경 아이콘 -->
                        <i class="fa-solid fa-bookmark fa-lg scraped-icon hidden"></i>
                     </a>

                  </div>
                  <h3 class="count-comment">댓글 ${count}</h3>
               </div>

               <!-- 댓글 보기 -->
               <div class="freeboard_page_comments">

                  <div id="no-comments-message" style="display: none;">작성된 댓글이
                     없습니다.</div>
                  <div class="comment-box">
                     <!-- test -->
                     <c:forEach var="comment" items="${comments}" varStatus="loop">

                        <div class="comment" id="comment_${loop.index}"
                           data-user-code="${comment.userCode}">
                           <div class="comment_name">${comment.nickname}</div>
                           <input type="hidden" class="modiCommentCode" value="${comment.commentCode}">
                           <div class="comment_content">${comment.commentContent}</div>
                           <div class="comment_date">${comment.commentDate}</div>
                           <button class="btnModi" onclick="editComment(this)">수정</button>
                           <button class="btnDel" onclick="delComment(this)">삭제</button>
                        </div>
                     </c:forEach>
                  </div>

                  <!-- 댓글 작성 -->
                  <div>
                     <div class="my_comment">
                        <div class="my_comment_sender">${user.nickname}
                           <button class="my_comment_sender_btn" onclick="regComment()">전송</button>
                        </div>
                        <input type="hidden" id="regBoardCode"value="${freeboard.boardCode}"> 
                        <input type="hidden" id="regUserCode" value="${user.userCode}"> 
                        <input type="hidden" id="regCommentDate" value="null">
                        <div class="comment_textarea">
                           <textarea class="my_comment_content" name="" maxlength="400" id="regComment" placeholder="댓글을 입력하세요." ></textarea>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="freeBoardForm-btn">
               <button id="boardModi"
                  onclick="window.location.href='${pageContext.request.contextPath}/board/my/${freeboard.boardCode}'">수정</button>
               <button onclick="history.back()">뒤로가기</button>
            </div>
         </div>
      </div>
   </div>

</body>

<script>
   function checkComments() {
      var comments = document.getElementsByClassName("comment");
      var noCommentsMessage = document.getElementById("no-comments-message");

      if (comments.length === 0) {
         noCommentsMessage.style.display = "block";
      } else {
         noCommentsMessage.style.display = "none";
      }
   }

   document.addEventListener("DOMContentLoaded", function() {
      checkComments();
   });
   
   $(document).ready(function(){
       var boardUserCode = document.querySelector('.boardUsercode').value;
       var userCode = document.querySelector('.userCode').value;
       var boardModi = document.querySelector('#boardModi');
       
       if (userCode === boardUserCode){
           boardModi.style.display = "inline";
       } else {
           boardModi.style.display = "none";
       }
   });

   
   
</script>

</html>