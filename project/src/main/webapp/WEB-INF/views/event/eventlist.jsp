<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>국내 행사/축제</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/event.css" />
</head>

<body>
	<div class="wrap">
        <!-- nav 들어갈 부분 -->
        <div class="nav">nav</div>
        
        <div class="container">
            <div class="side-container">
                <div class="side">

                    <div class="side-name">지역</div>
                    <div class="local-box">
							<div class="area" data-area="1">서울</div>
							<div class="area" data-area="2">인천</div>
							<div class="area" data-area="3">대전</div>
							<div class="area" data-area="4">대구</div>
							<div class="area" data-area="5">광주</div>
							<div class="area" data-area="6">부산</div>
							<div class="area" data-area="7">울산</div>
							<div class="area" data-area="8">세종</div>
							<div class="area" data-area="31">경기도</div>
							<div class="area" data-area="32">강원도</div>
							<div class="area" data-area="33">충북</div>
							<div class="area" data-area="34">충남</div>
							<div class="area" data-area="35">경북</div>
							<div class="area" data-area="36">경남</div>
							<div class="area" data-area="37">전북</div>
							<div class="area" data-area="38">전남</div>
							<div class="area" data-area="39">제주</div>
						</div>
						
					<div class="side-name">월</div>
                    <div class="month-box">
							<div class="month" data-month="01">1월</div>
							<div class="month" data-month="02">2월</div>
							<div class="month" data-month="03">3월</div>
							<div class="month" data-month="04">4월</div>
							<div class="month" data-month="05">5월</div>
							<div class="month" data-month="06">6월</div>
							<div class="month" data-month="07">7월</div>
							<div class="month" data-month="08">8월</div>
							<div class="month" data-month="09">9월</div>
							<div class="month" data-month="10">10월</div>
							<div class="month" data-month="11">11월</div>
							<div class="month" data-month="12">12월</div>
                    </div>
                    <div class="filter-btn-box">
                        <div class="filter-reset-btn" id="resetBtn">
                            초기화
                        </div>
                        <!-- 필요한 경우 추가 -->
                    </div>
                </div>
            </div>
            <div class="section">
                <div class="section-name">
                    # 행사/축제
                    <hr>
                </div>
                
                <div class="content-box">


                            <c:forEach var="item" items="${eventList}">
                                <div class="content" data-contentid="${item.contentid}" data-contenttypeid="${item.contenttypeid}">
                                    <div class="content-img"><img src="${item.firstimage}"></div>
                                    <div class="content-info">
                                        <div class="info-name">${item.title}</div>
                                        <div class="info-local">${item.addr1}</div>
                                        <div class="info-time">${item.eventstartdate}~${item.eventenddate}</div>
                                    </div>
                                </div>
                            </c:forEach>
                </div>

                <!-- 더보기 버튼 -->
                <div class="more-btn-box">
                    <div class="more-btn" id="eventMoreBtn">다음페이지</div>
                </div>
            </div>
        </div>
    </div>

    <!-- 페이지 이동 스크립트 -->
    <script>
        $(document).ready(function() {
            // 더보기 버튼 클릭 이벤트 핸들러
            $("#eventMoreBtn").click(function() {
                // 현재 페이지 번호를 가져오기
                var currentPage = parseInt("${currentPage}");
                // 다음 페이지 번호 계산
                var nextPage = currentPage + 1;
                // 페이지 이동
                window.location.href = "${pageContext.request.contextPath}/eventlist?pageNo=" + nextPage;
            });
        });
        
        var localBtns = document.querySelectorAll('.local');
        var monthBtns = document.querySelectorAll('.month');
        var resetBtn = document.querySelector('.filter-reset-btn');

        var previousLocalBtn = null;
        var previousMonthBtn = null;

        function localBtnEvent() {
            this.classList.add('clickEvent');
            
            // 중복 클릭 방지
            if (previousLocalBtn && previousLocalBtn !== this) {
                previousLocalBtn.classList.remove('clickEvent');
            }

            previousLocalBtn = this;
        }

        function monthBtnEvent() {
            this.classList.add('clickEvent');

            //중복 클릭 방지
            if (previousMonthBtn && previousMonthBtn !== this) {
                previousMonthBtn.classList.remove('clickEvent');
            }

            previousMonthBtn = this;

        }

        function resetBtnEvent() {
            localBtns.forEach(function(btn) {
                btn.classList.remove('clickEvent');
            });

            monthBtns.forEach(function(btn) {
                btn.classList.remove('clickEvent');
            });

            previousLocalBtn = null;
            previousMonthBtn = null;
        }

        localBtns.forEach(function(btn) {
            btn.addEventListener("click", localBtnEvent);
        });
        monthBtns.forEach(function(btn) {
            btn.addEventListener("click", monthBtnEvent);
        });

        resetBtn.addEventListener("click", resetBtnEvent);

        
        

        $(document).ready(function() {
            // 클릭 이벤트 핸들러 등록
            $(".month, .area").click(function() {
                // 선택한 월 및 지역 가져오기
                var selectedYear = new Date().getFullYear();
                var selectedMonth = $(this).data("month") || "";
                var selectedArea = $(this).data("area") || "";

                // 선택한 월과 지역을 포함하여 새 URL로 이동
                window.location.href = "${pageContext.request.contextPath}/eventlist?year=" + selectedYear + "&month=" + selectedMonth + "&area=" + selectedArea;
            });

            // 초기화 및 선택한 월/지역 스타일 적용
            var selectedMonth = "${selectedMonth}";
            var selectedArea = "${selectedArea}";
            $(".month, .area").removeClass("selected"); // 모든 선택 해제
            $(".month[data-month= '" + selectedMonth + "']").addClass("selected"); // 선택한 월 스타일 적용
            $(".area[data-area='" + selectedArea + "']").addClass("selected"); // 선택한 지역 스타일 적용
            
            
            
            $(".content").click(function() {
                var contentId = $(this).data("contentid");
                var contentTypeId = $(this).data("contenttypeid");
                window.location.href = "${pageContext.request.contextPath}/eventlist/eventInfo?contentId=" + contentId + "&contentTypeId=" + contentTypeId;
            });
            
            
//             // 행사 정보를 클릭했을 때
//             $(".content").click(function() {
//                 // 클릭한 행의 contentId와 contentTypeId 가져오기
//                 var contentId = $(this).data("contentid");
//                 var contentTypeId = $(this).data("contenttypeid");

//                 // 서버로 contentId와 contentTypeId를 전송하고 성공한 경우 새 페이지에 데이터 출력
//                 $.ajax({
//                     type: "GET",
//                     url: "${pageContext.request.contextPath}/eventlist/eventInfo",
//                     data: {
//                         contentId: contentId,
//                         contentTypeId: contentTypeId
//                     },
//                     success: function(response) {
//                         // 성공적으로 데이터를 전송하고 응답을 받았을 때의 처리
//                         console.log("전송 완료!");
//                         console.log(response); // 받은 데이터를 콘솔에 출력하여 확인
                        
//                         // 새로운 창을 열어서 받은 데이터를 출력
//                         var newWindow = window.open();
//                         newWindow.document.write(response);
//                     },
//                     error: function(xhr, status, error) {
//                         // 전송 중 에러가 발생했을 때의 처리
//                         console.error("에러 발생:", error);
//                     }
//                 });
//             });
        });
    </script>
</body>
</html>