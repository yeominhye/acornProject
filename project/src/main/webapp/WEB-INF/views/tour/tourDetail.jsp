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
<title>관광세부정보</title>
<style>
@charset "UTF-8";

.container {
    width: 1100px;
    margin: 0 auto;
    margin-top: 75px;
    /* border: 1px solid black; */
}
/* 행사 이름 - 제목라인 */
.tour-info {
    border-bottom: 1px solid black;
    /* border: 1px solid black; */
    width: 80%;
    text-align: center;
    padding: 30px;
    margin: 0 auto;
    box-sizing: border-box;
}

.tour-name {
    display: inline;
    border: 1px solid rgb(255, 159, 159);
    background-color: rgb(255, 192, 192);
    border-radius: 15px;
    padding: 5px 10px 5px 10px;
}

.tour-title {
    display: inline;
    font-size: 30px;
    font-weight: bold;
    padding: 0px 15px 0px 15px;
}

.tour-date {
    /* display: inline; */
    color: rgb(146, 146, 146);
    font-size: 20px;
    padding: 10px;
}

/* 행사 정보 - 사진, 정보 */
.tour-details {
    width: 80%;
    margin: 0 auto;
    /* border-bottom: 1px solid black; */
    /* border: 1px solid black; */
    padding-top: 30px;
    padding-bottom: 30px;
    box-sizing: border-box;
}

.tour-details-img {
    /* border: 1px solid black; */
    display: inline-block;
    position: relative;
    /* background-color: rgb(240, 162, 60); */
    padding: 30px 20px 20px 20px;
    width: 50%;
    text-align: center;
    box-sizing: border-box;
}

.tour-details-img>img {
    width: 330px;
    height: 440px;
    object-fit: cover;
}

.tour-details-text {
    /* border: 1px solid black; */
    display: inline-block;
    position: absolute;
    font-size: 16px;
    width: 400px;
    height: 440px;
    padding: 0px 20px 50px 0px;
    font-size: 20px;
    line-height: 57px;
}

.tour-details-text ul li strong {
    float: left;
    width: 120px;
    /* background-color: #717171; */
}

.tour-details-text ul li strong {
    float: left;
    width: 120px;
    /* background-color: #717171; */
}
/* 행사 상세정보 */
.tour-description {
    width: 80%;
    margin: 0 auto;
    padding-top: 30px;
    padding-bottom: 30px;
}

.tour-description h3 {
    border-bottom: 1px solid black;
    padding-bottom: 5px;
}

/* 지도 정보 */
.tour-map-custom {
    padding-top: 30px;
    padding-bottom: 30px;
}

.tour-map-custom h3 {
    width: 80%;
    margin: 0 auto;
    padding-top: 20px;
    padding-bottom: 20px;
}

.tour-map-custom h3 {
    border-bottom: 1px solid black;
    padding-bottom: 5px;
}

.tour-map {
    border: 1px solid black;
    width: 80%;
    height: 300px;
    margin: 0 auto;
    margin-top: 20px;
}

/* 버튼 */
.tour-btn {
    text-align: center;
    margin-top: 50px;
    margin-bottom: 50px;
}

.tour-btn button {
    padding: 10px 20px;
    margin-right: 10px;
    border: none;
    border-radius: 5px;
    background-color: #717171;
    color: #fff;
    cursor: pointer;
}

.tour-btn button:hover {
    background-color: #73b7ff;
}
</style>
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
