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
    var addr1Element = document.querySelector('.event-addr');
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
	<div class="wrap">
		<%@ include file="../nav.jsp"%>
		<div class="container event-detail">
			<div class="event-info">
				<div class="event-addr">${eventInfo2[0].addr1}</div>
				<div class="event-title">${eventInfo2[0].title}</div>
				<div class="event-date"></div>
			</div>
			<div class="event-details">
				<div class="event-details-img">
					<img src="${eventInfo2[0].firstimage}" alt="${eventInfo2[0].title}">
				</div>
			</div>
			<div class="event-description">
				<h3>상세정보</h3>
				<c:if test="${not empty eventInfo2[0].overview}">
					<div class="event-description-content">
						<p>내용: ${eventInfo2[0].overview}</p>
					</div>
				</c:if>
			</div>
			<div class="event-map-custom">
				<h3>지도</h3>
				<div class="event-map" id="map"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a8047e3c30bd5760407dbe6654a7338"></script>
				<script>
                var container = document.getElementById('map');
                var options = {
                    center: new kakao.maps.LatLng(${eventInfo2[0].mapy}, ${eventInfo2[0].mapx}),
                    level: 3
                };
                var map = new kakao.maps.Map(container, options);
                </script>
			</div>
			<div class="event-details-info">
				<ul>
					<c:if test="${not empty eventInfo[0].eventstartdate}">
						<li><strong>행사날짜</strong> <span>${eventInfo[0].eventstartdate}
								~ ${eventInfo[0].eventenddate}</span></li>
					</c:if>
					<c:if test="${not empty eventInfo2[0].addr1}">
						<li><strong>주소</strong> <span>${eventInfo2[0].add	r1}${eventInfo2[0].addr2}</span></li>
					</c:if>
					<c:if test="${not empty eventInfo[0].sponsor1}">
						<li><strong>주최</strong> <span>${eventInfo[0].sponsor1}</span></li>
					</c:if>
					<c:if test="${not empty eventInfo[0].sponsor2}">
						<li><strong>주관</strong> <span>${eventInfo[0].sponsor2}</span></li>
					</c:if>
					<c:if test="${not empty eventInfo[0].sponsor2tel}">
						<li><strong>전화번호</strong> <span>${eventInfo[0].sponsor2tel}</span></li>
					</c:if>
					<c:if test="${not empty eventInfo[0].eventhomepage}">
						<li><strong>홈페이지</strong> <span>${eventInfo[0].eventhomepage}</span></li>
					</c:if>
					<c:if test="${not empty eventInfo[0].usetimefestival}">
						<li><strong>행사비용</strong> <span>${eventInfo[0].usetimefestival}</span></li>
					</c:if>
					<c:if test="${not empty eventInfo[0].eventplace}">
						<li><strong>장소</strong> <span>${eventInfo[0].eventplace}</span></li>
					</c:if>
					<c:if test="${not empty eventInfo[0].subevent}">
						<li><strong>내용</strong> <span>${eventInfo[0].subevent}</span></li>
					</c:if>
				</ul>
			</div>
			<div class="event-btn">
				<button onclick="history.back()">뒤로가기</button>
			</div>
		</div>
		<%@ include file="../footer-sub.jsp"%>
	</div>
</body>
</html>
