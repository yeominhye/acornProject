<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/quill@2.0.1/dist/quill.snow.css" rel="stylesheet" />
<link  rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/styles/atom-one-dark.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/freeBoardDetail.css" >
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" >
<style type="text/css">
   .ql-tooltip{
      display: none;
   }
</style>
<script type="text/javascript">
   var boardCode = "${freeboard.boardCode}";
   
   function regComment() {
   //    let boardCode = $("#regBoardCode").val(); 
       let userCode = $("#regUserCode").val();
       let commentDate = $("#regCommentDate").val();
       let commentContent = $("#regComment").val();
       let comment = {
           boardCode: boardCode,
           userCode: userCode,
           commentDate: commentDate,
           commentContent: commentContent
       }; // JSON 객체
       console.log(comment);
       
       // JSON 객체를 문자열로 변환
       let commentString = JSON.stringify(comment);
       console.log(commentString);
       
       $.ajax({
           type: "post",
           url: "${pageContext.request.contextPath}/board/free/" + boardCode,
           data: commentString,
           contentType: "application/json",
           
           success: function(response) {
               if (response.status === 'success') {
                   if (response.redirect) {
                       window.location.href = response.redirect; 
                   }
               } else {
                   console.error('Error: ' + response.message);
               }
           },
           error: function(xhr, status, error) {
               if (xhr.status === 401) {
                   window.location.href = "${pageContext.request.contextPath}/user/login.do";
               } else {
                   console.error('AJAX Error: ' + status + ' ' + error);
               }
           }
       });
   }

   
     $(document).ready(function() {
           // 각 댓글에 대해 사용자 코드를 확인하여 버튼을 표시하거나 숨기는 작업 수행
           $('.comment').each(function() {
               var commentUserCode = $(this).data('user-code');
               checkUserCode(commentUserCode, $(this));
           });
       });

       // 각 댓글에 대해 사용자 코드를 확인하여 버튼을 표시하거나 숨기는 함수
       function checkUserCode(commentUserCode, $comment) {
           var userCode = "${user.userCode}";
           var $btnModi = $comment.find('.btnModi');
           var $btnDel = $comment.find('.btnDel');

           if (userCode === commentUserCode) {
               // 해당 댓글의 작성자와 현재 사용자의 코드가 일치할 경우 버튼을 보이도록 설정
               $btnModi.show();
               $btnDel.show();
           } else {
               // 해당 댓글의 작성자와 현재 사용자의 코드가 일치하지 않을 경우 버튼을 숨기도록 설정
               $btnModi.hide();
               $btnDel.hide();
           }
       }
    
    function editComment(btn) {
          var $commentDiv = $(btn).closest('.comment');
          var $commentContent = $commentDiv.find('.comment_content');
          var $editInput = $('<textarea class="edit_comment_input" style="width:600px; height:50px;">' + $commentContent.text() + '</textarea>');
          $commentContent.replaceWith($editInput);
          $(btn).text('저장').removeClass('btnModi').addClass('btnSave').attr('onclick', 'saveComment(this)');
          
          // document 전체에 클릭 이벤트 등록
          $(document).on('click', function(e) {
              // 수정 중인 댓글을 제외한 영역을 클릭했을 때
              if (!$(e.target).closest('.comment').is($commentDiv)) {
                  // 수정 상태 종료
                  $editInput.replaceWith('<div class="comment_content">' + $editInput.val() + '</div>');
                  $(btn).text('수정').removeClass('btnSave').addClass('btnModi').attr('onclick', 'editComment(this)');
                  // document 전체에 등록된 클릭 이벤트 제거
                  $(document).off('click');
              }
          });
      }

    
    function saveComment(btn) {
       
          var $commentDiv = $(btn).closest('.comment');
          var $editInput = $commentDiv.find('.edit_comment_input');
          var commentContent = $editInput.val(); 
          var commentCode = $commentDiv.find('.modiCommentCode').val(); 
          
          var comment = {
              commentCode: commentCode,
              commentContent: commentContent
          }; 
          
          var commentString = JSON.stringify(comment);

          $.ajax({
              type: "PUT", // PUT 요청 사용
              url: "/project/board/free/" + boardCode, // boardCode 변수를 사용하여 URL을 지정
              data: commentString,
              contentType: "application/json",
              success: function(data) {
                  console.log(data);
              },
              error: function(xhr, status, error) {
                  console.log(xhr, status, error);
              }
          });
          
          $editInput.replaceWith('<div class="comment_content">' + commentContent + '</div>');
          $(btn).text('수정').removeClass('btnSave').addClass('btnModi').attr('onclick', 'editComment(this)');
          // document 전체에 클릭 이벤트 제거
          $(document).off('click');
      }

    function delComment(btn) {
          // 댓글 요소를 찾습니다.
          var $commentDiv = $(btn).closest('.comment');
          
          // 댓글의 commentCode 값을 가져옵니다.
          var commentCode = $commentDiv.find('.modiCommentCode').val();
          
          // 삭제를 확인하는 다이얼로그를 표시하거나 직접 삭제 요청을 보낼 수 있습니다.
          if (confirm("정말로 이 댓글을 삭제하시겠습니까?")) {
              // AJAX를 사용하여 삭제 요청을 보냅니다.
              $.ajax({
                  type: "DELETE",
                  url: "/project/board/free/" + boardCode, // 댓글을 삭제하는 URL을 지정합니다. 확인이 필요합니다.
                  data: commentCode,
                  success: function(data) {
                      console.log(data); // 성공적으로 삭제된 경우 로그에 출력합니다.
                      
                      // 삭제된 댓글을 화면에서 숨깁니다.
                      $commentDiv.hide();
                  },
                  error: function(xhr, status, error) {
                      console.error(xhr, status, error); // 오류가 발생한 경우 콘솔에 오류를 출력합니다.
                  }
              });
          }
      }   
    
    
</script>

</head>
<body>
    <div class="wrap">

         <!-- 게시판 -->
         <div class="container">
            <div class="side_menu">
               <div class="side_menu_set">
                   <h3><a href="/project/board/free?type=-1">자유게시판</a></h3>
                   <ul>
                      <li> <a href="/project/board/free?type=-1"> 전체글</a></li>
                       <li> <a href="/project/board/free?type=1"> 여행후기</a></li>
                       <li> <a href="/project/board/free?type=2"> 꿀팁공유</a></li>
                       <li> <a href="/project/board/free?type=3"> 질문있어요!</a></li>
                       <li> <a href="/project/board/free?type=4"> 수다방</a></li>
                       <li> <a href="/project/board/free?type=5"> 동행구해요!</a></li>
                   </ul>
               </div>
            </div>
            <div class="content_wrap">
                <!-- 게시판이름 -->
                <div class="boardType">${freeboard.boardType}</div>
                <div class="freeboard_page_title">
                    <div class="title">${freeboard.boardTitle}</div>
                    <div class="nickname">${user.nickname}
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSirRCxfXvgU4rkE8dmKE6lqewZ4D7wa40h0Q&s" alt="" >
                    </div>
                    <div class="writeDatw">${freeboard.boardWritedate}</div>
                    <div class="boardViews"> ${freeboard.boardViews}</div>
              </div>
                
              
              <div class="freeboard_page_content">
                   <!-- 내용 -->
                  <div class="content">${freeboard.boardContent} </div>
              </div>

                <div class="freeboard_page">
                    <div class="freeboard_page_img">
                        <div>
                            <!-- 좋아요, 스크랩 부분 -->
                            <a href="#" class="like-btn">
                                <img class="like-icon" src="data:image/png;base64,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" alt="Like"> <!-- 좋아요를 클릭하지 않은 상태일 때의 아이콘 -->
                                <img class="liked-icon hidden" src="data:image/png;base64,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" alt="Liked"><!-- 좋아요를 클릭한 상태일 때의 아이콘 -->
                            </a>
                            <!-- 스크랩 버튼도 이미지로 대체됩니다. -->
                            <a href="#" class="scrap-btn">
                                <img class="scrap-icon" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAeFBMVEX///8AAADu7u6SkpKXl5f09PT6+vr39/fBwcG5ubnHx8fw8PDW1tadnZ2rq6vo6Oh8fHxcXFxPT081NTXh4eGjo6PNzc1CQkKKiop1dXUYGBgJCQk4ODhFRUVmZmYhISEtLS0eHh6CgoJlZWUuLi5SUlJvb2+ysrJOtaRRAAAEuUlEQVR4nO3daVfiQBCFYUAJboiKOyouo/7/fzgeNdUha3VX+nYfz30/zQzQ8gxbUomHyYQxxhgbs8XyZpq47dlJROBBat5PH9GAh6lpZeeRgLPUMNcyjvA1tcu1mUcRpmZVO/rzwihP0/JlWMwTVuz93Im9mMIYa+vbp9AQhZgotEQhJgotUYiJQksUYqLQEoWYKLREISYKLVGIiUJLFGKi0BKFmCi0RCEmCi1RiIlCSxRiotAShZgotEQhJgotUYiJQksUYqLQEoWYKLREISYKLVGIiUJLFGKi0BKFmCi0RCEmCi1RiIlCSxRiotAShZgotEQhJgotUYiJQksUYqLQEoWYKLREISYKLVGIiUJLFGKi0BKFmCi0RCEmCi1RiIlCSxRiotAShZgotEQhJgotUYiJQksUYqLQEoWYKLQ0jvDk6Nh0+9yFq4evBU4tK2QuvNx8r2D5esa8hbOX3yUMj2LWwkUJnE4PgxfJWTj/N3UdhK6SsXDxOK0W+mWwGQsvprtdhy2Tr/B8Wi/sC8SzFT6VrvWZEC9DFspVeFeqNjP35/sQYqbC3cftrfzLdua/VJ7C29prT16TW/8vEM9SuNd4/xTi2puYo3DZAE4K+eh4XHiulqHwVICV7ZjiufzHC8/l8hN+CnBnW3SxDiRmJzwQ4GdtNdlKffNaMDfhkQCv6hetNuVFdz4rZiY8EeB+88KVXHjmsWReQgdsvUOXcvGrfs2shIOC3oe4o5yE7oX20XWV6+6XaVcZCY/l3j91X8m9E2lHN/kIZ/KZft53tUMhfvZdzZWNcH5T3vOBT3S3RaAb3WQjFODD0DWvhKga3eQilKnTTTF43X0hakY3mQjd3pHmIIXbu1KMbvIQylDmXrcT/1pefzM818hCKMDNSrm0G90M3iIHoQxlFI9Imf5Rz0BYH8rokunU88BcI71wPwg4mbyXN3von2skF7YMZZS5T9DeD5jUwtahjK6FEB/7rpZY6LYyAw4QHsvopm9LNq3QDWWCDvLO7sub9+yNJBX2DGV0uR2uzj3KpEK3O6vfY691KTvNnaObhEI3krgN/xnDi6QTuqGMz+Ss0cDwKqHQjQa9pp/N3HO9/aybVMLZdvg9QtnAG3IioTuRpHcoo8vNNdpGN2mEi+AjSa11HMz5KYmweBDg8MxCkxvdNLf9kgjlcOeN/0Hr9npGNymElqPyXXXvZCYQCvDFdmrsbjK6qZ91gxd6jFi8cmfg7K4LF3b+X5v7EOLOcwMtvI0GrJ5YVCWChV6zXO9kdFM96wYr9Dzk4FvRdmwAKjQMZXS1nZKCFPZuXI3TonkQEig0DmV0zRujG5zQPJTR1TgZACYcYSijqz47QAlHGcroqp2zAhIGnesT2u7oBiNcyevfOJTR5V7yS5DQzabNQxld7m37CiIsdGfKjFnleMgyvvBejhG9jzOz0OQ2ny4Aj2GZ4kSS8bqq/XCEcI0EVg+9ooRDx9tHbw8sfAn4dRdjr1Ch+kyZMbtDClMAK6Ob+MIYMwtN5yhh4K9/jtBjVOE8PdARowgnv4tHGsroKs+6iXMnfjadlOdjx2r+fSw21vbU58t0nfIp+l3x9aFxh97cYIwx9vf7D/UENicy38QgAAAAAElFTkSuQmCC" alt="Scrap"><!-- 스크랩을 하지 않은 상태일 때의 아이콘 -->
                                <img class="scraped-icon hidden" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAb1BMVEX///8AAABubm5oaGj5+fmwsLD4+Pi5ubmoqKj09PSlpaX8/PxgYGDExMTAwMDNzc2ZmZmJiYl1dXV7e3tHR0cVFRXt7e3i4uLc3NySkpJbW1tSUlI5OTkpKSno6OjW1taDg4MiIiIQEBA/Pz8wMDAzHbgXAAADG0lEQVR4nO3a607bQBRF4ZTc44QQcoMQCAHe/xnbqmppEl/O2DOzx9Za/3vMJyRUbU2vR0RE0cpGg0QaZWGE8x/J1A8j7Ktd390hRIhQHkKECPUhRIhQH0KECPUhRIhQH0KECPUhRIhQH0KECPUhRIhQH0KECPUhRIhQH0KECPUhRIhQH0KECPUhRIhQH0KECPUhRIhQH0KECPUhRIhQH0KECPUhRIhQH0KECPUhRIhQH0KECPUhRIhQH0KECPUhRIhQH0KECPUhRIhQH0KECPUhRIhQH0KECPUhRIhQH0KECPUhFArvxuM7H2eSFS5+37nvsHD559Cis8LF30uNf4uJCsffp4adFA7/vzXpoHB2eWzWOeHD9bWHjgmfb8+tOiV8z7v32CHhOv9g/f/dpCYs/Hn8X9QI58UnXzohfMlKbm46INyU3hzUI6YkPA7Kj06PLRe+TquuTretFp4rgb3e7txi4cfOcnfv/ltMRri3HX5qrfDJevnUUuHJfnrZSuHS5bbjdJOE8N7tuNt0k4JwXH3vMqfpJgHhsPrcdS7TjV44q752m8OuIRfejDK2nlsjzBllbL23RLiq/4l1K4SPTb5hnG6kwn6zjxySF5aMMrZM041Q+NL4KwMLUSc8evjM6DNhYdUoY2v0mqzwaNgsLO0qiSLh2bRZWHo7pyl88/epfYrCD+MoY6uCKBE6bBaWyqcbhdAzsGK6EQidRhlbZdNNfOGi+l+7VzLdRBc6jzK2iqeb2MIao4ytwicpkYW1RhlbRdNNXGHNUcZWwZOUqMIGm4WlfGJMYcFDEn/lTjcRhY1GGVt50008YaAvXTYXCg9hPnRVdrtOxRKWPyTxV3bzJCWScFP2FMhr2fWTlDjCT0+bhaXpl0BoeUjir6snKTGE26jAX8RtZOHW4yhj6y2y0OsoY+spqtD8UsZnp4hC76OMrWU0YYBRxtYiktDxpYzPxlGEgUYZW8MIwmCjjK1JcGHAUcbWQ2Bh7Yck/noOKgw8ythaBRS+hzns2jqU8BBls7DUb/ziIz/5H5l/ZRP1T0BERJ3rJ6wKb/zrBFzDAAAAAElFTkSuQmCC" alt="Scraped"><!-- 스크랩을 한 상태일 때의 아이콘 -->
                            </a>
                        </div>
                        <h3>댓글 ${count}</h3>
                    </div>

                    <!-- 댓글 보기 -->
                    <div class="freeboard_page_comments">
                       
                            <c:forEach var="comment" items="${comments}" varStatus="loop">
                    
                           	 <div class="comment" id="comment_${loop.index}" data-user-code="${comment.userCode}">
                                <div class="comment_name">${comment.nickname}</div>
                                <input type="hidden" class="modiCommentCode" value="${comment.commentCode}">
                                <div class="comment_content">${comment.commentContent}</div>
                                <div class="comment_date">${comment.commentDate}</div>
                                <button class="btnModi" onclick="editComment(this)">수정</button>
                                <button class="btnDel" onclick="delComment(this)">삭제</button>
                           	 </div>
                             </c:forEach>    
                       

                        <!-- 댓글 작성 -->
                           <div>
                               <div class="my_comment">
                                    <div class="my_comment_sender">${user.nickname}
                                        <button class="my_comment_sender_btn" onclick="regComment()"> 전송 </button>
                                    </div>
                                   <input type="hidden" id="regBoardCode" value="${freeboard.boardCode}">
                                   <input type="hidden" id="regUserCode" value="${user.userCode}">
                                    <input type="hidden" id="regCommentDate" value="null">
                                   <div class="comment_textarea">
                                      <textarea class="my_comment_content" name="" id="regComment" placeholder="댓글을 입력하세요." ></textarea>
                                   </div>
                               </div>
                           </div>
                        </div>
                       </div>
                       <div class="freeBoardForm-btn">
                        <button onclick="history.back()">뒤로가기</button>
                       </div>
                   </div>
                </div>
            </div>

    <script>
    function changeType(){
        let typeElement = document.querySelector(".boardType");
        let value = parseInt(typeElement.innerHTML, 10);

        switch (value) {
            case 0:
                typeElement.innerHTML = "루트게시판";
                break;
            case 1:
                typeElement.innerHTML = "여행후기";
                break;
            case 2:
                typeElement.innerHTML = "꿀팁공유";
                break;
            case 3:
                typeElement.innerHTML = "질문있어요!";
                break;
            case 4:
                typeElement.innerHTML = "수다방";
                break;
            case 5:
                typeElement.innerHTML = "동행 구해요!";
                break;
            case 6:
                typeElement.innerHTML = "문의";
                break;
            default:
                typeElement.innerHTML = "에러";
        }
    }
    window.onload = function() {
        changeType(); // 페이지가 로드될 때 자동으로 함수 호출
    };

    // 좋아요 버튼 클릭 시
    document.querySelector('.like-btn').addEventListener('click', function() {
        // 좋아요 버튼 요소를 가져옵니다.
        const likeBtn = document.querySelector('.like-btn');
        const likeIcon = likeBtn.querySelector('.like-icon');
        const likedIcon = likeBtn.querySelector('.liked-icon');

        // 좋아요 버튼의 상태를 확인하여 변경합니다.
        if (likeIcon.classList.contains('hidden')) {
            // 좋아요를 이미 누른 상태이면 좋아요를 취소합니다.
            likeIcon.classList.remove('hidden');
            likedIcon.classList.add('hidden');
        } else {
            // 좋아요를 누르지 않은 상태이면 좋아요를 누릅니다.
            likeIcon.classList.add('hidden');
            likedIcon.classList.remove('hidden');
        }
    });

    // 스크랩 버튼 클릭 시
    document.querySelector('.scrap-btn').addEventListener('click', function() {
        // 스크랩 버튼 요소를 가져옵니다.
        const scrapBtn = document.querySelector('.scrap-btn');
        const scrapIcon = scrapBtn.querySelector('.scrap-icon');
        const scrapedIcon = scrapBtn.querySelector('.scraped-icon');

        // 스크랩 버튼의 상태를 확인하여 변경합니다.
        if (scrapIcon.classList.contains('hidden')) {
            // 이미 스크랩한 상태이면 스크랩을 취소합니다.
            scrapIcon.classList.remove('hidden');
            scrapedIcon.classList.add('hidden');
        } else {
            // 스크랩하지 않은 상태이면 스크랩합니다.
            scrapIcon.classList.add('hidden');
            scrapedIcon.classList.remove('hidden');
        }
    });

</script>
</body>
</html>