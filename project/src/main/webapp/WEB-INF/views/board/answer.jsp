<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../nav-sub.jsp" %>	
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- CSS -->
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/answer.css" >

 <style>
   img{
   width:100px;
   height:100px;
   }
 </style>

</head>

<body>
	<script>
        // 이전 페이지로 이동하는 함수
        function goBack() {
            window.history.back();
        }
    </script>

    <div class="wrap">
        <div class="container">
            <!-- 시작 -->
            <div class="inquiry-container">

                <h1 class="title">나의 문의</h1>

                <div class="divider"></div>
                <ul class="inner-box">
                    <li>
                        <dl class="inner-each-box">
                            <dt class="inner-title">제목
                            <dd class="inner-content">${myboard.boardTitle}</dd>
                            </dt>
                        </dl>
                    </li>
                    <li>
                        <dl class="inner-each-box">
                            <dt class="inner-title">작성일
                            <dd class="inner-content">${myboard.boardWritedate}</dd>
                            </dt>
                        </dl>
                    </li>
                    <li>
                        <dl class="inner-each-box">
                            <dt class="inner-title">작성자
                            <dd class="inner-content">${userId}</dd>
                            </dt>
                        </dl>
                    </li>
                    <li>
                        <dl class="inner-each-box">
                            <dt class="inner-title">내용
                            <dd class="inner-content">
                            
             					<img alt="문의사진" src="/project/board/images/${myboard.boardImgReal}">	               
                                ${myboard.boardContent}
                            </dd>
                            </dt>
                        </dl>
                    </li>
                </ul>

                <h1 class="title">답변</h1>

                <div class="divider"></div>
                <ul class="inner-box">
                    <li>
                        <dl class="inner-each-box">
                            <dt class="inner-title">내용
                            <dd class="inner-content" id="content-answer">
                                안녕하세요? 맞습니다. 답변 또한 DB로 불러올 예정입니다.
                                Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a
                                piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard
                                McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of
                                the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through
                                the cites of the word in classical literature, discovered the undoubtable source. Lorem
                                Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The
                                Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the
                                theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum,
                                "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
                            </dd>
                            </dt>
                        </dl>
                    </li>
                </ul>

                

            </div>
        </div> <!-- container -->
        <div id="btn-wrapper"><button onclick="goBack()">목록 돌아가기</button></div>


    </div>
</body>
<footer></footer>

</html>