<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- detailPage.css -->
<link rel="stylesheet" href="${path}/resources/css/detailPage.css" />
<!-- reset.css -->
<link rel="stylesheet" href="${path}/resources/css/reset.css" />
<title>관광세부정보</title>
<style>
@charset "UTF-8";

.container{
    width: 1100px;
    margin: 0 auto;
    margin-top: 75px;
    /* border: 1px solid black; */
}
/* 행사 이름 - 제목라인 */
.event-info{
    border-bottom: 1px solid black;
    /* border: 1px solid black; */
    width: 80%;
    text-align: center;
    padding: 30px;
    margin: 0 auto;
    box-sizing: border-box;
}
.event-name{
    display: inline;
    border: 1px solid rgb(255, 159, 159);
    background-color: rgb(255, 192, 192);
    border-radius: 15px;
    padding: 5px 10px 5px 10px;
}
.event-title {
    display: inline;
    font-size: 30px;
    font-weight: bold;
    padding: 0px 15px 0px 15px;
}
.event-date{
    /* display: inline; */
    color: rgb(146, 146, 146);
    font-size: 20px;
    padding: 10px;
}

/* 행사 정보 - 사진, 정보 */
.event-details{
    width: 80%;
    margin: 0 auto;
    /* border-bottom: 1px solid black; */
    /* border: 1px solid black; */
    padding-top: 30px;
    padding-bottom: 30px;
    box-sizing: border-box;
}
.event-details-img{
    /* border: 1px solid black; */
    display: inline-block;
    position: relative;
    /* background-color: rgb(240, 162, 60); */
    padding: 30px 20px 20px 20px;
    width : 50%;
    text-align: center;
    box-sizing: border-box;
}
.event-details-img > img{
    width: 330px;
    height: 440px;
    object-fit : cover;
}
.event-details-text{
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
.event-details-text ul li strong{
    float: left;
    width: 120px;
    /* background-color: #717171; */
}
.event-details-text ul li strong{
    float: left;
    width: 120px;
    /* background-color: #717171; */
}
/* 행사 상세정보 */
.event-description{
    width: 80%;
    margin: 0 auto;
    padding-top: 30px;
    padding-bottom: 30px;
}
.event-description h3{
    border-bottom: 1px solid black;
    padding-bottom: 5px;
}

/* 지도 정보 */
.event-map-custom{
    padding-top: 30px;
    padding-bottom: 30px;
}
.event-map-custom h3{
    width: 80%;
    margin: 0 auto;
    padding-top: 20px;
    padding-bottom: 20px;
}
.event-map-custom h3{
    border-bottom: 1px solid black;
    padding-bottom: 5px;
}
.event-map{
    border: 1px solid black;
    width: 80%;
    height: 300px;
    margin: 0 auto;
    margin-top: 20px;
}

/* 버튼 */
.event-btn {
    text-align: center;
    margin-top: 50px;
    margin-bottom: 50px;
}
.event-btn button {
    padding: 10px 20px;
    margin-right: 10px;
    border: none;
    border-radius: 5px;
    background-color: #717171;
    color: #fff;
    cursor: pointer;
    
}
.event-btn button:hover {
    background-color: #73b7ff;
}
</style>
</head>
<body>
	<div class="container tour-detail">
		<div class="event-info">
			<!-- 행사이름 -->
			<div class="event-name">경기</div>
			<!-- 지역정보받기 -->
			<div class="event-title">${tourInfo[0].title}</div>
			<!-- 행사/관광 이름 -->
			<div class="event-date"></div>
		</div>
		<div class="event-details">
			<!-- 행사사진, 정보 -->
			<div class="event-details-img">
				<img src="${tourInfo[0].firstimage}">
			</div>
			<div class="event-details-text">
				<ul>
					<li><strong>제목</strong> <span>${tourInfo[0].title}</span></li>
					<li><strong>전화번호</strong> <span>${tourInfo[0].tel}</span></li>
					<li><strong>홈페이지</strong> <span>${tourInfo[0].homepage}</span></li>
				</ul>
			</div>
		</div>
		<div class="event-description">
			<!-- 상세정보 -->
			<h3>상세정보</h3>
			<div class="event-description-content">
				<p>내용: ${tourInfo[0].overview}</p>
			</div>
		</div>
		<div class="event-map-custom">
			<!-- 지도 -->
			<h3>지도</h3>
			<div class="event-map">지도 삽입</div>
		</div>

		<div class="event-btn">
			<button onclick="history.back()">뒤로가기</button>
		</div>
	</div>
</body>
</html>