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
<!-- tourDetail.css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/tourDetail.css">
<title>관광세부정보</title>
<script>
document.addEventListener('DOMContentLoaded', function() {
    var addr1Element = document.querySelector('.tour-addr');
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
		<div class="container tour-detail">
			<div class="tour-info">
				<div class="tour-addr">${tourInfo[0].addr1}</div>
				<div class="tour-title">${tourInfo[0].title}</div>
				<div class="tour-date"></div>
			</div>
			<div class="tour-details">
				<div class="tour-details-img">
					<img src="${tourInfo[0].firstimage}" alt="${tourInfo[0].title}">
				</div>
			</div>
			<div class="tour-description">
				<h3>상세정보</h3>
				<c:if test="${not empty tourInfo[0].overview}">
					<div class="tour-description-content">
						<p>내용: ${tourInfo[0].overview}</p>
					</div>
				</c:if>
			</div>
			<div class="tour-map-custom">
				<h3>지도</h3>
				<div class="tour-map" id="map"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a8047e3c30bd5760407dbe6654a7338"></script>
				<script>
                var container = document.getElementById('map');
                var options = {
                    center: new kakao.maps.LatLng(${tourInfo[0].mapy}, ${tourInfo[0].mapx}),
                    level: 3
                };
                var map = new kakao.maps.Map(container, options);
                </script>
			</div>
			<div class="tour-details-info">
				<ul>
					<c:if test="${not empty tourInfo[0].title}">
						<li><strong>제목</strong> <span>${tourInfo[0].title}</span></li>
					</c:if>
					<c:if test="${not empty tourInfo[0].addr1}">
						<li><strong>주소</strong> <span>${tourInfo[0].addr1}${tourInfo[0].addr2}</span></li>
					</c:if>
					<c:if test="${not empty tourInfo[0].tel}">
						<li><strong>전화번호</strong> <span>${tourInfo[0].tel}</span></li>
					</c:if>
					<c:if test="${not empty tourInfo[0].homepage}">
						<li><strong>홈페이지</strong> <span>${tourInfo[0].homepage}</span></li>
					</c:if>
					<c:if test="${not empty tourInfo2[0].expguide}">
						<li><strong>체험안내</strong> <span>${tourInfo2[0].expguide}</span></li>
					</c:if>
					<c:if test="${not empty tourInfo2[0].infocenter}">
						<li><strong>문의및안내</strong> <span>${tourInfo2[0].infocenter}</span></li>
					</c:if>
					<c:if test="${not empty tourInfo2[0].restdate}">
						<li><strong>휴무일</strong> <span>${tourInfo2[0].restdate}</span></li>
					</c:if>
					<c:if test="${not empty tourInfo2[0].parking}">
						<li><strong>주차정보</strong> <span>${tourInfo2[0].parking}</span></li>
					</c:if>
				</ul>
			</div>
			<div class="tour-btn">
				<button onclick="history.back()">뒤로가기</button>
			</div>
		</div>
		<%@ include file="../footer-sub.jsp"%>
	</div>
</body>
</html>
