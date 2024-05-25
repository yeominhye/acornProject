<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>국내 관광지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tour.css" />
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
                    
                    <div class="filter-btn-box">
                        <div class="filter-reset-btn" id="resetBtn">초기화</div>
                    </div>
                </div>
            </div>
            <div class="section">
                <div class="section-name">
                    # 관광지
                    <hr>
                </div>

                <div class="sort-options">
                    <div class="arrange-option" data-arrange="S">거리순</div>
                    <div class="arrange-option" data-arrange="Q">최신순</div>
                </div>
                
                <div class="content-box">
                    <c:forEach var="item" items="${tourList}">
                        <div class="content" data-contentid="${item.contentid}" data-contenttypeid="${item.contenttypeid}">
                            <div class="content-img"><img src="${item.firstimage}"></div>
                            <div class="content-info">
                                <div class="info-name">${item.title}</div>
                                <div class="info-local">${item.addr1}</div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="more-btn-box">
                    <div class="more-btn" id="tourMoreBtn">더보기</div>
                </div>
            </div>
        </div>
    </div>

    <!-- 위치 정보 및 페이지 이동 스크립트 -->
    <script>
        $(document).ready(function() {
            // 초기화 버튼 클릭 이벤트 핸들러
            $("#resetBtn").click(function() {
                window.location.href = "${pageContext.request.contextPath}/tourlist";
            });

            // 더보기 버튼 클릭 이벤트 핸들러
            $("#tourMoreBtn").click(function() {
                var currentPage = parseInt("${currentPage}");
                var nextPage = currentPage + 1;
                window.location.href = "${pageContext.request.contextPath}/tourlist?pageNo=" + nextPage;
            });

            // 거리순 및 최신순 클릭 이벤트 핸들러
            $(".arrange-option").click(function() {
                var arrange = $(this).data("arrange");
                getLocationAndRedirect(arrange);
            });

            // 위치 정보 가져와서 페이지 이동하는 함수
            function getLocationAndRedirect(arrange) {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(function(position) {
                        var mapX = position.coords.longitude;
                        var mapY = position.coords.latitude;
                        window.location.href = "${pageContext.request.contextPath}/tourlist?arrange=" + arrange + "&mapX=" + mapX + "&mapY=" + mapY;
                    }, function(error) {
                        console.error("Error occurred. Error code: " + error.code);
                    });
                } else {
                    console.error("Geolocation is not supported by this browser.");
                }
            }

            // 클릭 이벤트 핸들러 등록
            $(".month, .area").click(function() {
                var selectedYear = new Date().getFullYear();
                var selectedMonth = $(this).data("month") || "";
                var selectedArea = $(this).data("area") || "";

                window.location.href = "${pageContext.request.contextPath}/tourlist?year=" + selectedYear + "&month=" + selectedMonth + "&area=" + selectedArea;
            });

            // 초기화 및 선택한 월/지역 스타일 적용
            var selectedMonth = "${selectedMonth}";
            var selectedArea = "${selectedArea}";
            $(".month, .area").removeClass("selected");
            $(".month[data-month='" + selectedMonth + "']").addClass("selected");
            $(".area[data-area='" + selectedArea + "']").addClass("selected");
            
            $(".content").click(function() {
                var contentId = $(this).data("contentid");
                var contentTypeId = $(this).data("contenttypeid");
                window.location.href = "${pageContext.request.contextPath}/tourlist/tourInfo?contentId=" + contentId + "&contentTypeId=" + contentTypeId;
            });
        });
    </script>
</body>
</html>
