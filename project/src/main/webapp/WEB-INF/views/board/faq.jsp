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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/faq.css" >


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
    <div class="wrap">
    
        <div class="iconContainer">
            <div class="faqIcon" onclick="location.href='/project/board/inquiry'"><img src="img/일대일문의.png" alt=""><h4>일대일문의</h4></div>
            <div class="faqIcon" onclick="location.href='# '"><img src="img/free-icon-communication-7182345.png" alt=""><h4>상담사 연결</h4></div>
        </div>

        <div class="middle-container">

        </div>

        <h1 id="faqLetters">자주 묻는 질문</h1>

        <div class="faq-container">

            <div class="faqList">
                <div class="faq-title">
                    <div class="index">분류</div><div class="index-title">제목</div>
                </div>
            </div>

            <div class="accordion-wrap">
                <div class="question">
                    <span id="acco-index">결제</span>
                    <span id="acco-title">결제가 안 됩니다.</span>
                </div>

                <div class="answer">
                    <span>그럴 때는 오만원을 더 충전해보세요. </span>
                </div>
                <div class="question">
                    <span id="acco-index">결제</span>
                    <span id="acco-title">결제가 안 됩니다.</span>
                </div>
                <div class="answer">
                    <span>그럴 때는 오만원을 더 충전해보세요. </span>
                </div>
                <div class="question">
                    <span id="acco-index">결제</span>
                    <span id="acco-title">결제가 안 됩니다.</span>
                </div>
                <div class="answer">
                    <span>그럴 때는 오만원을 더 충전해보세요. </span>
                </div>
                <div class="question">
                    <span id="acco-index">결제</span>
                    <span id="acco-title">결제가 안 됩니다.</span>
                </div>
                <div class="answer">
                    <span>그럴 때는 오만원을 더 충전해보세요. </span>
                </div>
                <div class="question">
                    <span id="acco-index">결제</span>
                    <span id="acco-title">결제가 안 됩니다.</span>
                </div>
                <div class="answer">
                    <span>그럴 때는 오만원을 더 충전해보세요. </span>
                </div>
                <div class="question">
                    <span id="acco-index">결제</span>
                    <span id="acco-title">결제가 안 됩니다.</span>
                </div>
                <div class="answer">
                    <span>그럴 때는 오만원을 더 충전해보세요. </span>
                </div>
                <div class="question">
                    <span id="acco-index">결제</span>
                    <span id="acco-title">결제가 안 됩니다.</span>
                </div>
                <div class="answer">
                    <span>그럴 때는 오만원을 더 충전해보세요. </span>
                </div>
                <div class="question">
                    <span id="acco-index">결제</span>
                    <span id="acco-title">결제가 안 됩니다.</span>
                </div>
                <div class="answer">
                    <span>그럴 때는 오만원을 더 충전해보세요. </span>
                </div>
            </div>    
        </div>    

    </div>
</body>

<script>
    $(document).ready(function() {
        $(".question").click(function() {
            $(this).next(".answer").stop().slideToggle(300);
            $(this).toggleClass('on').siblings().removeClass('on');
            $(this).next(".answer").siblings(".answer").slideUp(300);
        });
    });
</script>

<footer></footer>
</html>