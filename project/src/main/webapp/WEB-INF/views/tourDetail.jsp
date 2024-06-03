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
    var addr1Element = document.querySelector('.tour-name');
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
    <div class="container tour-detail">
        <div class="tour-info">
            <!-- 행사이름 -->
            <div class="tour-name">${tourInfo[0].addr1}</div>
            <!-- 지역정보받기 -->
            <div class="tour-title">${tourInfo[0].title}</div>
            <!-- 행사/관광 이름 -->
            <div class="tour-date"></div>
        </div>
        <div class="tour-details">
            <!-- 행사사진, 정보 -->
            <div class="tour-details-img">
                <img src="${tourInfo[0].firstimage}">
            </div>
            <div class="tour-details-text">
                <ul>
                    <li><strong>제목</strong> <span>${tourInfo[0].title}</span></li>
                    <li><strong>전화번호</strong> <span>${tourInfo[0].tel}</span></li>
                    <li><strong>홈페이지</strong> <span>${tourInfo[0].homepage}</span></li>
                    <li><strong>﻿체험안내</strong> <span>${tourInfo2[0].expguide}</span></li>
                    <li><strong>﻿문의및안내</strong> <span>${tourInfo2[0].infocenter}</span></li>
                    <li><strong>휴무일</strong> <span>${tourInfo2[0].restdate}</span></li>
                    <li><strong>주차정보</strong> <span>${tourInfo2[0].parking}</span></li>
                </ul>
            </div>
        </div>
        <div class="tour-description">
            <!-- 상세정보 -->
            <h3>상세정보</h3>
            <div class="tour-description-content">
                <p>내용: ${tourInfo[0].overview}</p>
            </div>
        </div>
        <div class="tour-map-custom">
            <!-- 지도 -->
            <h3>지도</h3>
            <div class="tour-map" id="map"></div>
            <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a8047e3c30bd5760407dbe6654a7338"></script>
            <script>
                var container = document.getElementById('map');
                var options = {
                    center : new kakao.maps.LatLng(${tourInfo[0].mapy}, ${tourInfo[0].mapx}),
                    level : 3
                };

                var map = new kakao.maps.Map(container, options);
            </script>
        </div>

        <div class="tour-btn">
            <button onclick="history.back()">뒤로가기</button>
        </div>
    </div>
</body>
</html>
