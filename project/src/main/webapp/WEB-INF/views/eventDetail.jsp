<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- reset.css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
	<!-- eventDetail.css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/eventDetail.css">
<title>행사세부정보</title>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var addr1Element = document.querySelector('.event-name');
    var addr1 = addr1Element.textContent.trim();
    var shortAddr1 = "";

    if (addr1.startsWith("전라") || addr1.startsWith("경상") || addr1.startsWith("충정")) {
        shortAddr1 = addr1.charAt(0) + addr1.charAt(2);
    } else {
        shortAddr1 = addr1.substring(0, 2); 
    }

    addr1Element.textContent = shortAddr1;
});
</script>
</head>
<body>
<%@ include file="nav.jsp" %>
	<div class="container event-detail">
		<div class="event-info">
			<!-- 행사이름 -->
			<div class="event-name">${eventInfo2[0].addr1}</div>
			<!-- 지역정보받기 -->
			<div class="event-title">${eventInfo2[0].title}</div>
			<!-- 행사/관광 이름 -->
			<div class="event-date"> </div>
		</div>
		<div class="event-details">
			<!-- 행사사진, 정보 -->
			<div class="event-details-img">
				<img src="${eventInfo2[0].firstimage}" alt="">
			</div>
			<div class="event-details-text">
				<ul>
					<li><strong>시작일</strong> <span>${eventInfo[0].eventstartdate}</span></li>
					<li><strong>종료일</strong> <span>${eventInfo[0].eventenddate}</span></li>
					<li><strong>행사비용</strong> <span>${eventInfo[0].usetimefestival}</span></li>
					<li><strong>주최</strong> <span>${eventInfo[0].sponsor1}</span></li>
					<li><strong>주관</strong> <span>${eventInfo[0].sponsor2}</span></li>
					<li><strong>전화번호</strong> <span>${eventInfo[0].sponsor2tel}</span></li>
					<li><strong>홈페이지</strong> <span>${eventInfo[0].eventhomepage}</span></li>
					<li><strong>장소</strong> <span>${eventInfo[0].eventplace}</span></li>
				</ul>
			</div>
		</div>
		<div class="event-description">
			<!-- 상세정보 -->
			<h3>상세정보</h3>
			<div class="event-description-content">
				<p>내용: ${eventInfo2[0].overview}</p>
			</div>
		</div>
		<div class="event-map-custom">
			<!-- 지도 -->
			<h3>지도</h3>
			<div class="event-map" id="map"> </div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a8047e3c30bd5760407dbe6654a7338"></script>
			<script>
				var container = document.getElementById('map');
				var options = {
					center : new kakao.maps.LatLng(${eventInfo2[0].mapy}, ${eventInfo2[0].mapx}),
					level : 3
				};

				var map = new kakao.maps.Map(container, options);
			</script>
		</div>
		<div class="event-btn">
			<button onclick="history.back()">뒤로가기</button>
		</div>
	</div>
</body>
</html>