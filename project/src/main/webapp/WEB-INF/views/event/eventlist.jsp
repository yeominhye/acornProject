<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>축제/행사</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/eventlist.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.filter-keep-btn:hover,
.filter-keep-btn.hovered {
    color: white;
    background-color: #E78181;
}
.filter-keep-btn.clicked {
    color: white;
    background-color: #E78181;
}
</style>
</head>
<body>
<div class="wrap">
    <%@ include file="../nav.jsp"%>
    <div class="container">
        <div class="side-container">
            <div class="side">
                <div class="side-name">지역</div>
                <div class="local-box">
                    <div class="area filter-keep-btn" data-area="1">서울</div>
                    <div class="area filter-keep-btn" data-area="2">인천</div>
                    <div class="area filter-keep-btn" data-area="3">대전</div>
                    <div class="area filter-keep-btn" data-area="4">대구</div>
                    <div class="area filter-keep-btn" data-area="31">경기</div>
                    <div class="area filter-keep-btn" data-area="6">부산</div>
                    <div class="area filter-keep-btn" data-area="7">울산</div>
                    <div class="area filter-keep-btn" data-area="5">광주</div>
                    <div class="area filter-keep-btn" data-area="32">강원</div>
                    <div class="area filter-keep-btn" data-area="33">충북</div>
                    <div class="area filter-keep-btn" data-area="34">충남</div>
                    <div class="area filter-keep-btn" data-area="35">경북</div>
                    <div class="area filter-keep-btn" data-area="36">경남</div>
                    <div class="area filter-keep-btn" data-area="37">전북</div>
                    <div class="area filter-keep-btn" data-area="38">전남</div>
                    <div class="area filter-keep-btn" data-area="39">제주</div>
                    <div class="area filter-keep-btn" data-area="8">세종</div>
                </div>
                <div class="side-name">월</div>
                <div class="month-box">
                    <div class="month filter-keep-btn" data-month="01">1월</div>
                    <div class="month filter-keep-btn" data-month="02">2월</div>
                    <div class="month filter-keep-btn" data-month="03">3월</div>
                    <div class="month filter-keep-btn" data-month="04">4월</div>
                    <div class="month filter-keep-btn" data-month="05">5월</div>
                    <div class="month filter-keep-btn" data-month="06">6월</div>
                    <div class="month filter-keep-btn" data-month="07">7월</div>
                    <div class="month filter-keep-btn" data-month="08">8월</div>
                    <div class="month filter-keep-btn" data-month="09">9월</div>
                    <div class="month filter-keep-btn" data-month="10">10월</div>
                    <div class="month filter-keep-btn" data-month="11">11월</div>
                    <div class="month filter-keep-btn" data-month="12">12월</div>
                </div>
                <div class="filter-btn-box">
                    <div class="filter-reset-btn filter-keep-btn" id="resetBtn">초기화</div>
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
                        <div class="content-img">
                            <img src="${item.firstimage}">
                        </div>
                        <div class="content-info">
                            <div class="info-name">${item.title}</div>
                            <div class="info-local">${item.addr1}</div>
                            <div class="info-local">${item.eventstartdate} ~ ${item.eventenddate}</div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="more-btn-box">
                <div class="more-btn" id="eventMoreBtn">다음페이지</div>
            </div>
        </div>
    </div>
   <!-- footer -->
   <%@ include file="../footer-sub.jsp"%>

</div>
<script>
$(document).ready(function() {
    // 페이지 로드 시 저장된 클릭 상태 복구
    var clickedArea = localStorage.getItem("clickedArea");
    var clickedMonth = localStorage.getItem("clickedMonth");

    if (clickedArea) {
        $(".filter-keep-btn").removeClass("clicked");
        $(".filter-keep-btn[data-area='" + clickedArea + "']").addClass("clicked");
    }

    if (clickedMonth) {
        $(".filter-keep-btn").removeClass("clicked");
        $(".filter-keep-btn[data-month='" + clickedMonth + "']").addClass("clicked");
    }

    // filter-keep-btn에 대한 클릭 이벤트 핸들러
    $(".filter-keep-btn.area").click(function() {
        var clickedArea = $(this).data("area");
        localStorage.setItem("clickedArea", clickedArea);

        var selectedYear = new Date().getFullYear();
        var selectedMonth = localStorage.getItem("clickedMonth") || "";
        
        window.location.href = "${pageContext.request.contextPath}/eventlist?year=" + selectedYear + "&month=" + selectedMonth + "&area=" + clickedArea;
    });

    $(".filter-keep-btn.month").click(function() {
        var clickedMonth = $(this).data("month");
        localStorage.setItem("clickedMonth", clickedMonth);

        var selectedYear = new Date().getFullYear();
        var selectedArea = localStorage.getItem("clickedArea") || "";
        
        window.location.href = "${pageContext.request.contextPath}/eventlist?year=" + selectedYear + "&month=" + clickedMonth + "&area=" + selectedArea;
    });

    // 초기화 버튼 클릭 이벤트 핸들러
    $("#resetBtn").click(function() {
        $(".filter-keep-btn").removeClass("clicked");
        localStorage.removeItem("clickedArea");
        localStorage.removeItem("clickedMonth");
        window.location.href = "${pageContext.request.contextPath}/eventlist";
    });

    // 이벤트 목록 클릭 시 상세 페이지로 이동
    $(".content").click(function() {
        var contentId = $(this).data("contentid");
        var contentTypeId = $(this).data("contenttypeid");
        window.location.href = "${pageContext.request.contextPath}/eventlist/eventInfo?contentId=" + contentId + "&contentTypeId=" + contentTypeId;
    });

    // 더보기 버튼 클릭 이벤트 핸들러
    $("#eventMoreBtn").click(function() {
        var currentPage = parseInt("${currentPage}");
        var nextPage = currentPage + 1;
        window.location.href = "${pageContext.request.contextPath}/eventlist?pageNo=" + nextPage;
    });

    // 페이지 로드 시 선택된 월 및 지역에 스타일 적용
    var selectedMonth = "${selectedMonth}";
    var selectedArea = "${selectedArea}";
    $(".filter-keep-btn").removeClass("clicked");
    $(".filter-keep-btn[data-month='" + selectedMonth + "']").addClass("clicked");
    $(".filter-keep-btn[data-area='" + selectedArea + "']").addClass("clicked");
});
</script>
</body>
</html>
