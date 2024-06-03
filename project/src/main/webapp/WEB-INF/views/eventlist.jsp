<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>행사/축제</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- reset.css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<!-- tourlist.css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/tourlist.css">

</head>
<body>
	<!-- nav -->
	<%@ include file="nav.jsp"%>
	<div class="container">
		<div class="side-container">
			<div class="side">
				<div class="side-name">지역</div>
				<div class="local-box">
					<div class="area" data-area="1">서울</div>
					<div class="area" data-area="2">인천</div>
					<div class="area" data-area="3">대전</div>
					<div class="area" data-area="4">대구</div>
					<div class="area" data-area="31">경기</div>
					<div class="area" data-area="6">부산</div>
					<div class="area" data-area="7">울산</div>
					<div class="area" data-area="5">광주</div>
					<div class="area" data-area="32">강원</div>
					<div class="area" data-area="33">충북</div>
					<div class="area" data-area="34">충남</div>
					<div class="area" data-area="35">경북</div>
					<div class="area" data-area="36">경남</div>
					<div class="area" data-area="37">전북</div>
					<div class="area" data-area="38">전남</div>
					<div class="area" data-area="39">제주</div>
					<div class="area" data-area="8">세종</div>
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
					<div class="filter-reset-btn" id="resetBtn">초기화</div>
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
					<div class="content" data-contentid="${item.contentid}"
						data-contenttypeid="${item.contenttypeid}">
						<div class="content-img">
							<img src="${item.firstimage}">
						</div>
						<div class="content-info">
							<div class="info-name">${item.title}</div>
							<div class="info-local">${item.addr1}</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- more-btn-box 변경 -->
			<div class="more-btn-box">
			    <c:if test="${currentPage > 1}">
			        <a href="${pageContext.request.contextPath}/eventlist?pageNo=${currentPage - 1}&year=${selectedYear}&month=${selectedMonth}&area=${selectedArea}" class="prev">이전</a>
			    </c:if>
			
			    <c:if test="${currentPage < totalPages}">
			        <a href="${pageContext.request.contextPath}/eventlist?pageNo=${currentPage + 1}&year=${selectedYear}&month=${selectedMonth}&area=${selectedArea}" class="next">다음</a>
			    </c:if>
			</div>
			
			<!-- 페이지 번호 표시 -->
			<div class="page-number-box">
			    <c:forEach var="i" begin="1" end="${totalPages}">
			        <c:choose>
			            <c:when test="${i == currentPage}">
			                <span class="current-page">${i}</span>
			            </c:when>
			            <c:otherwise>
			                <a href="${pageContext.request.contextPath}/eventlist?pageNo=${i}&year=${selectedYear}&month=${selectedMonth}&area=${selectedArea}" class="page-number">${i}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			</div>

		</div>
	</div>
	<!-- footer -->
	<%@ include file="../views/footer-sub.jsp"%>
	
<script>
$(document).ready(function() {
    // 초기화 및 선택한 월/지역 스타일 적용
    var selectedMonth = "${selectedMonth}";
    var selectedArea = "${selectedArea}";

    $(".month, .area").removeClass("selected"); // 모든 선택 해제
    if (selectedMonth) {
        $(".month[data-month='" + selectedMonth + "']").addClass("selected"); // 선택한 월 스타일 적용
    }
    if (selectedArea) {
        $(".area[data-area='" + selectedArea + "']").addClass("selected"); // 선택한 지역 스타일 적용
    }
    
    // 클릭 이벤트 핸들러 등록
    $(".month, .area").click(function() {
        var selectedYear = new Date().getFullYear();
        var selectedMonth = $(".month.selected").data("month") || ""; // 선택된 월 가져오기
        var selectedArea = $(".area.selected").data("area") || ""; // 선택된 지역 가져오기

        // 클릭된 요소가 월인지 지역인지 확인
        if ($(this).hasClass("month")) {
            selectedMonth = $(this).data("month");
        } else if ($(this).hasClass("area")) {
            selectedArea = $(this).data("area");
        }

        // 선택한 월과 지역을 포함하여 새 URL로 이동
        window.location.href = "${pageContext.request.contextPath}/eventlist?year=" + selectedYear + "&month=" + selectedMonth + "&area=" + selectedArea;
    });
    
    $(".content").click(function() {
    var contentId = $(this).data("contentid");
    var contentTypeId = $(this).data("contenttypeid");
    window.location.href = "${pageContext.request.contextPath}/eventlist/eventInfo?contentId=" + contentId + "&contentTypeId=" + contentTypeId;
    
    });
    
  });
    
    
</script>
</body>
</html>