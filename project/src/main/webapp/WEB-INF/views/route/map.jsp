<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/map.css" />
<!-- reset.css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css" />
<script defer
	src="${pageContext.request.contextPath}/resources/js/map.js"></script>
<title>지도</title>
</head>
<body>
	<div class="map_wrap">
		<div id="map"></div>
		<div class="myTab">
			<div class="myTab_title">Register Page</div>
			<div class="myTab_R">
				<div class="myImg">
					<img src="" alt="">
					<div class="content">NickName</div>
				</div>
				<button>다음</button>
			</div>
		</div>

		<div class="toolTab">
			<div class="toolBtn">
				<button id="myButton">
					<div class="btnImg">
						<img src="${pageContext.request.contextPath}/resources/img/search.png" alt="">
					</div>
					Search
				</button>
			</div>

			<div class="toolBtn">
				<button id="test">
					<div class="btnImg">
						<img src="${pageContext.request.contextPath}/resources/img/checkmark.png" alt="">
					</div>
					Test
				</button>
			</div>

			<div class="toolBtn">
				<button id="line">
					<div class="btnImg">
						<img src="${pageContext.request.contextPath}/resources/img/gps-route.png" alt="">
					</div>
					Line
				</button>
			</div>

			<div class="toolBtn">
				<button id="linedelete">
					<div class="btnImg">
						<img src="${pageContext.request.contextPath}/resources/img/eraser.png" alt="">
					</div>
					Delete
				</button>
			</div>
		</div>
		<div id="searchTab" class="bg_white" class="slide">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						<input type="text" value="이태원 맛집" id="keyword" size="15">
						<button type="submit">검색</button>
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>

		<div class="click_wrap">
			<div id="clickLatlng" class="click"></div>
		</div>
	</div>


	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7560b5ddb94a9dc91354ef62a6b750ee"></script> -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7560b5ddb94a9dc91354ef62a6b750ee&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript" src="map_test.js"></script>
	<!-- map 수정-->
</body>
</html>
