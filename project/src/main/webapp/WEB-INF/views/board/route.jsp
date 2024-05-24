<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">    
	<title>Document</title>
    <!-- reset.css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" >

<style>
        .container {
            width: 1100px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
        }

         /***********
        *** side ***
        ***********/
        .side-container {
            position: relative;
            margin-top: 165px;
        }
        .side {
            position: fixed;
            width: 210px;
            background-color: #f5f5f5;
            padding: 20px;
            border-radius: 10px;

            box-shadow: 4px 4px 4px rgba(0,0,0,0.25);
        }
        .side-name {
            font-size: 18px;
            font-weight: bold;
            text-decoration: underline;
        }
        .local-box, .month-box, .time-box {
            margin: 10px auto 25px auto;
            width: 98%;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .local, .month, .time {
            display: flex;
            justify-content: center;
            align-self: center;

            width: 40px;
            height: 20px;

            font-size: 14px;
            font-weight: 600;
            color: #999999;
            
            margin-bottom: 5px;
            border-radius: 50px;

            cursor: pointer;
        }
        .filter-reset-btn {
            display: flex;
            justify-content: center;
            align-self: center;

            margin: 0 auto;
            margin-top: 75px;
            width: 125px;
            height: 25px;
            
            border-radius: 25px;
            background-color: #EAEAEA;
            color: #5c5c5c;
            
            font-weight: bolder;
            
            cursor: pointer;
        }
        .clickEvent {
            color: white;
            background-color: #E78181;
        }
        .filter-btn-box div:hover {
            color: white;
            background-color: #E78181;
        }
        .time {
            width: 55px;
            height: 25px;
            line-height: 25px;
        }
        #time-4, #time-5 {
            width: 75px;
        }

        /***********
        ** section**
        ***********/
        .section {
            position: relative;
            width: 850px;
            margin-top: 75px;
        }
        .section-name {
            font-size: 24px;
            font-weight: bold;
        }
        .section-name hr {
            margin: 10px 0 50px 0;
            color: black;
        }
        .route-table {
            margin: 0 auto;
            background-color: #F9F9F9;
            width: 800px;
            height: 220px;
            margin-bottom: 15px;
        }
        .route-img {
            /* 가운데정렬 */
            display: flex;
            justify-content: center;
            align-items: center;

            width: 330px;
            height: 220px;
        }
        .route-img img {
            max-width: 100%;
            height: auto;
        }
        .route-info {
            position: relative;
        }
        .info-01, .info-03, .user-info {
            display: flex;
        }
        .route-info > div {
            position: absolute;
            left: 10px;
            width: 450px;
        }
        .info-01 {
            top: 10px;
        }
        .route-name {
            font-size: 18px;
            font-weight: bold;
        }
        .info-02 {
            top: 40px;
            font-size: 12px;
        }
        .route-tag {
            font-weight: bold;
            color: #7b7b7b;
        }
        .route-content {
            padding-top: 20px;
        }
        .info-03 {
            font-size: 14px;
            height: 25px;
            bottom: 10px;
            line-height: -10px;
        }
        .likes-info {
            display: flex;
            color: #E78181;
        }
        .like-icon {
            margin-right: 5px;
        }
        .views-icon {
            margin-left: 10px;
        }
        .user-info {
            position: absolute;
            right: 0;
        }
        .user-name {
            font-size: 16px;
            font-weight: bold;
        }
        .check-icon {
            margin-left: 2px;
        }
        .local-icon {
            display: flex;
            justify-content: center;
            padding-bottom: 2px;
            margin: 2px 5px 0 0;

            width: 50px;
            height: 20px;
            border-radius: 5px;

            background-color: #C5C5C5;
            color: #5c5c5c;
            font-weight: bold;
        }
        .route-info {
            width: 470px;
            height: 220px;
        }
        .info-01, .info-03, .user-info {
            display: flex;
        }
        </style>
</head> 
<body>
    <div class="wrap">
        <!-- nav -->
        <%@ include file="../nav-sub.jsp" %>

        <div class="container">
            <div class="side-container">
                <div class="side">

                    <div class="side-name">지역</div>
                    <div class="local-box">
                        <div class="local" id="local01">서울</div>
                        <div class="local" id="local02">경기</div>
                        <div class="local" id="local03">인천</div>
                        <div class="local" id="local04">강원</div>
                        <div class="local" id="local05">충남</div>
                        <div class="local" id="local06">충북</div>
                        <div class="local" id="local07">전라</div>
                        <div class="local" id="local08">전북</div>
                        <div class="local" id="local09">경상</div>
                        <div class="local" id="local10">경북</div>
                        <div class="local" id="local11">제주</div>
                        <div class="local" id="local12">부산</div>
                    </div>

                    <div class="side-name">월</div>
                    <div class="month-box">
                        <div class="month" id="month-1">1월</div>
                        <div class="month" id="month-2">2월</div>
                        <div class="month" id="month-3">3월</div>
                        <div class="month" id="month-4">4월</div>
                        <div class="month" id="month-5">5월</div>
                        <div class="month" id="month-6">6월</div>
                        <div class="month" id="month-7">7월</div>
                        <div class="month" id="month-8">8월</div>
                        <div class="month" id="month-9">9월</div>
                        <div class="month" id="month-10">10월</div>
                        <div class="month" id="month-11">11월</div>
                        <div class="month" id="month-12">12월</div>
                    </div>

                    <div class="side-name">기간</div>
                    <div class="time-box">
                        <div class="time" id="time-1">당일</div>
                        <div class="time" id="time-2">1~3일</div>
                        <div class="time" id="time-3">4~9일</div>
                        <div class="time" id="time-4">10일이상</div>
                        <div class="time" id="time-5">20일이상</div>
                    </div>

                    <div class="filter-btn-box">
                        <div class="filter-reset-btn" id="resetBtn">
                            초기화
                        </div>
                        <!-- 보류 -->
                    </div>
                    
                </div>
            </div>

            <div class="section">
                <div class="section-name">
                    # 루트 게시판
                    <hr>
                </div>
                <table class="route-table">
                    <tr>
                        <td class="route-img">
                            <img src="https://via.placeholder.com/330x220.jpg" alt="">
                        </td>
                        <td class="route-info">
                            <div class="info-01">
                                <div class="local-icon">경기</div>
                                <div class="route-name">
                                    가평 유럽마을 당일치기 일정
                                </div>
                            </div>
                            <div class="info-02">
                                <div class="route-tag">
                                    <span>#당일치기</span>
                                    <span>#나홀로</span>
                                </div>
                                <div class="route-content">
                                    2박 3일 가족여행을 떠나보며 적은 소개글입니다.
                                    가평 유럽여행의 사진 명소들을 소개합니다.
                                </div>
                            </div>
                            <div class="info-03">
                                <div class="likes-info">
                                    <div class="like-icon"><img src="https://via.placeholder.com/25x25.jpg" alt=""></div>
                                    <span class="like-int">3,180</span>
                                    <div class="views-icon">views</div>
                                    <span class="views-int">6,200</span>
                                </div>
                                <div class="user-info">
                                    <div class="user-name">뽀대왕자님</div>
                                    <div class="check-icon"><img src="https://via.placeholder.com/25x25.jpg" alt=""></div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
        </div>

    <script>
        var localBtns = document.querySelectorAll('.local');
        var monthBtns = document.querySelectorAll('.month');
        var timeBtns = document.querySelectorAll('.time');
        var resetBtn = document.querySelector('.filter-reset-btn');
    
        var previousLocalBtn = null;
        var previousMonthBtn = null;
        var previousTimeBtn = null;
    
        function localBtnEvent() {
            this.classList.add('clickEvent');
            
            // 중복 클릭 방지
            if (previousLocalBtn && previousLocalBtn !== this) {
                previousLocalBtn.classList.remove('clickEvent');
            }
    
            previousLocalBtn = this;
    
            //나 볼라고 만든거 임시
            var localId = this.id;
            var monthId = previousMonthBtn ? previousMonthBtn.id : '';
            alert(localId + " " + monthId);
        }
    
        function monthBtnEvent() {
            this.classList.add('clickEvent');
    
            //중복 클릭 방지
            if (previousMonthBtn && previousMonthBtn !== this) {
                previousMonthBtn.classList.remove('clickEvent');
            }
    
            previousMonthBtn = this;
    
            //나 볼라고 만든거 임시
            var monthId = this.id;
            var localId = previousLocalBtn ? previousLocalBtn.id : '';
            alert(localId + " " + monthId);
        }

        function timeBtnEvent() {
            this.classList.add('clickEvent');
    
            //중복 클릭 방지
            if (previousTimeBtn && previousTimeBtn !== this) {
                previousTimeBtn.classList.remove('clickEvent');
            }
    
            previousTimeBtn = this;
    
            //나 볼라고 만든거 임시
            var TimeId = this.id;
            var localId = previousLocalBtn ? previousLocalBtn.id : '';
            alert(localId + " " + monthId);
        }
    
        function resetBtnEvent() {
            localBtns.forEach(function(btn) {
                btn.classList.remove('clickEvent');
            });
    
            monthBtns.forEach(function(btn) {
                btn.classList.remove('clickEvent');
            });

            timeBtns.forEach(function(btn) {
                btn.classList.remove('clickEvent');
            });
    
            previousLocalBtn = null;
            previousMonthBtn = null;
            previousTimeBtn = null;
        }
    
        localBtns.forEach(function(btn) {
            btn.addEventListener("click", localBtnEvent);
        });
        monthBtns.forEach(function(btn) {
            btn.addEventListener("click", monthBtnEvent);
        });
        timeBtns.forEach(function(btn) {
            btn.addEventListener("click", timeBtnEvent);
        });
    
        resetBtn.addEventListener("click", resetBtnEvent);
    </script>
</body>
</html>