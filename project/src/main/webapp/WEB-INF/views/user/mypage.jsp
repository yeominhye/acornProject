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

<style>
	.wrap {
	    width: 750px;
	    margin: 0 auto;
	}
	.nav {
	    background-color: red;
	    width: 100%;
	    height: 75px;
	}
	.footer {
	    background-color: blue;
	    width: 100%;
	    height: 250px;
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
	.my-content > div {
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
	.my-info{
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
	.my_point_btn button{
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
	
	
</style>
</head>
<body>

	<%@ include file="../nav-sub.jsp" %>
    <div class="wrap">
        <div class="page-name">마이페이지 <hr> </div>
        <!-- my_top -->
        <div class="my_top"> 
            <div class="my_side">
                <ul>
                    <a href="/project/board/my/inquiry6"><li>1:1문의내역</li></a>
                    <a href="/project/point/showMyPoint.do"><li>포인트 내역</li></a>
                    <a href="/project/user/modifyInfo.do"><li>정보수정</li></a>
                    <a href="" onclick="deleteAccount()" style="cursor: pointer;"><li>회원탈퇴</li></a>
                </ul>
            </div>

            <div class="my-content">
                <div class="my-info">
                    <div class="my_name"><span>${user.nickname}</span> 님 반갑습니다😘</div>
                </div>
                

                <div class="my_point">
                    <div class="my_point_text"> ${user.userPoint} P </div>
                    <div class="my_point_btn">
                        <button class="open" id="openModal">충전</button>
	                    <a class="my_point_btn" href="/project/point/pointCharge.do">
	                        <button>환전</button>
	                    </a>
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
	                <td>제목</td>
	                <td>카테고리</td>
	                <td>작성일</td>   
	            </tr>

	            <c:forEach var="board" items="${list}" varStatus="status">
		            <tr class="list-data">
		                <td><c:out value="${status.index + 1}" /></td>
		                <td><a><c:out value="${board.boardTitle}" /></a></td>
		                <td>
		                    <c:choose>
		                        <c:when test="${board.boardType == 0}">루트게시판</c:when>
		                        <c:when test="${board.boardType == 1}">여행후기</c:when>
		                        <c:when test="${board.boardType == 2}">꿀팁공유</c:when>
		                        <c:when test="${board.boardType == 3}">질문있어요</c:when>
		                        <c:when test="${board.boardType == 4}">수방</c:when>
		                        <c:when test="${board.boardType == 5}">동행 구해요!</c:when>
		                        <c:when test="${board.boardType == 6}">문의</c:when>
		                        <c:otherwise>알 수 없음</c:otherwise>
		                    </c:choose>
		                </td>
		                <td><c:out value="${board.boardWritedate}" /></td>
		            </tr>
		        </c:forEach>
	        </table>
   		</div>

		<!-- 모달 -->
        <div class="modal" id="modal">
            <div class="modal-content" >
                <div class="tab-container">
                    <div id="tab1" class="tab selected">충전 포인트 선택</div>
                    <div id="tab2" class="tab">결제 수단 선택</div>
                </div>
                <form id="form1" class="form">
                    <div class="point-selection">
                        <!-- <label for="points" class="points-label">보유 포인트: ${user.userPoint}p</label> -->
                        <div class="points">
                            <input type="radio" id="1000p" name="pointAmount" value="1000">
                            <label for="1000p" class="point-btn">1000p</label>
                            <input type="radio" id="5000p" name="pointAmount" value="5000">
                            <label for="5000p" class="point-btn">5000p</label>
                            <input type="radio" id="10000p" name="pointAmount" value="10000">
                            <label for="10000p" class="point-btn">10,000p</label>
                            <input type="radio" id="50000p" name="pointAmount" value="50000">
                            <label for="50000p" class="point-btn">50,000p</label>
                            <input type="radio" id="100000p" name="pointAmount" value="100000">
                            <label for="100000p" class="point-btn">100,000p</label>
                            <input type="radio" id="300000p" name="pointAmount" value="300000">
                            <label for="300000p" class="point-btn">300,000p</label>
                        </div>
                        <div class="buttons">
                            <button type="button" class="btn" id="cancel">취소</button>
                            <button type="button" class="btn" id="next">다음</button>
                        </div>
                    </div>
                </form>
                
                <form id="form2" class="form" style="display: none;">
                    <div class="payment-method">
                        <label for="payment">결제 수단을 선택하세요:</label>
                        <div class="payment-options">
                            <div class="payment-row">
                                <input type="radio" id="credit" name="payment" value="credit">
                                <label for="credit" class="payment-btn">
                                    <img src="${pageContext.request.contextPath}/resources/img/credit-card.png" alt="Credit Card">
                                    신용카드 결제
                                </label>
                                <input type="radio" id="bank" name="payment" value="bank">
                                <label for="bank" class="payment-btn">
                                    <img src="${pageContext.request.contextPath}/resources/img/bank-transfer.png" alt="Bank Transfer">
                                    무통장입금
                                </label>
                            </div>
                            <div class="payment-row">
                                <input type="radio" id="phone" name="payment" value="phone">
                                <label for="phone" class="payment-btn">
                                    <img src="${pageContext.request.contextPath}/resources/img/mobile-payment.png" alt="Mobile Payment">
                                    휴대폰 결제
                                </label>
                                <input type="radio" id="simple" name="payment" value="simple">
                                <label for="simple" class="payment-btn">
                                    <img src="${pageContext.request.contextPath}/resources/img/simple-payment.png" alt="Simple Payment">
                                    간편결제
                                </label>
                            </div>
                        </div>
                        <div class="buttons">
                            <button type="button" class="btn" id="cancel">취소</button>
                            <button type="button" class="btn" id="back">이전</button>
                            <button type="button" class="btn" id="chargeBtn">완료</button>
                        </div>
                    </div>
                    
                </form>
            </div>
        </div>
	    
    </div>
        
<%@ include file="../footer-sub.jsp" %>

<script>
$(document).ready(function(){
    $("#chargeBtn").click(function(){
        var amount = $("input[name='pointAmount']:checked").val();
        $.ajax({
            type: "POST",
            url: "/project/point/charge_process.do",
            data: { pointAmount: amount },
            success: function(response){
            	alert( response);
                alert("충전 성공  !!!!");
              	$(".my_point_text").html(response +"P"); 
            
            },
            error: function(){
                alert("오류 발생");
            }
        });
    });
});

document.addEventListener("DOMContentLoaded", function() {
    // 페이지 로드 시 모달이 자동으로 열리지 않도록 설정
    document.getElementById('modal').style.display = 'none';

    // 모달 열기 버튼에 클릭 이벤트 핸들러 등록
    document.getElementById('openModal').onclick = function() {
        document.getElementById('modal').style.display = 'flex';
        resetForms();
    };

    // 다음 버튼에 클릭 이벤트 핸들러 등록
    document.getElementById('next').onclick = function() {
        document.getElementById('form1').style.display = 'none';
        document.getElementById('form2').style.display = 'block';
        document.getElementById('tab1').classList.remove('selected');
        document.getElementById('tab2').classList.add('selected');
    };

    // 뒤로 가기 버튼에 클릭 이벤트 핸들러 등록
    document.getElementById('back').onclick = function() {
        document.getElementById('form2').style.display = 'none';
        document.getElementById('form1').style.display = 'block';
        document.getElementById('tab2').classList.remove('selected');
        document.getElementById('tab1').classList.add('selected');
    };

    // 취소 버튼에 클릭 이벤트 핸들러 등록
    document.querySelectorAll('#cancel').forEach(btn => {
        btn.onclick = function() {
            document.getElementById('modal').style.display = 'none';
            resetForms(); // 취소 버튼을 누를 때 초기화
            document.querySelectorAll('input[type="radio"]').forEach(radio => {
                radio.checked = false;
            });
        }
    });
    document.getElementById('chargeBtn').onclick = function() {
        document.getElementById('modal').style.display = 'none';
    };
    

   
    // 폼 초기화 함수 호출
    resetForms();
});

function resetForms() {
    document.getElementById('form1').style.display = 'block';
    document.getElementById('form2').style.display = 'none';
    document.getElementById('tab1').classList.add('selected');
    document.getElementById('tab2').classList.remove('selected');

}

<!-- 탈퇴 팝업 -->

   function deleteAccount() {

      url = "deleteInfo.do"
      open(
            url,
            "confirm",
            "menubar=no, statusbar=no, scrollbar=no, width=500, height=250, left=600, top=350 ");
   }

   function reload() {
      setTimeout(function() {
         location.reload();
      }, 300);
   }

   function goHome() {
      window.location.href = "/project/"
   }

    </script>


</body>
</html>
