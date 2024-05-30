<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/map.css" />
<!-- reset.css -->
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/reset.css" />
<script defer
    src="${pageContext.request.contextPath}/resources/js/map.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
    function previewImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                $('#coverImagePreview').attr('src', e.target.result).show();
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</head>

<body>


    <h2>루트 제작 페이지</h2>
    <form action="/project/board/createMap_process.do" method="post" id="createMapForm">
    <input type="hidden" id="userCode" name="userCode" value="${user.userCode}">
        <table>
        	<tr>
        		<td>제목 : </td>
        		<td><input type="text" id="boardTitle" name="boardTitle" placeholder="제목"></td>
        	</tr>
        	<tr>
    			<td>날짜 :</td>
    			<td><input type="text" id="boardTourdays" name="boardTourdays" readonly></td>
			</tr>
			<tr>
    			<td>총평 :</td>
    			<td><input type="text" id="boardContent" name="boardContent"></td>
			</tr>
			

        	 <tr>
            	<td>지역 :</td>
            	<td>
                	<select name="boardRegion" id="boardRegion">
	                    <option value="0">서울</option>
	                    <option value="1">인천</option>
	                    <option value="2">대전</option>
	                    <option value="3">대구</option>
	                    <option value="4">경기</option>
	                    <option value="5">부산</option>
	                    <option value="6">울산</option>
	                    <option value="7">광주</option>
	                    <option value="8">강원</option>
	                    <option value="9">충북</option>
	                    <option value="10">충남</option>
	                    <option value="11">경북</option>
	                    <option value="12">경남</option>
	                    <option value="13">전북</option>
	                    <option value="14">전남</option>
	                    <option value="15">제주</option>
	                </select>
	            </td>
        	</tr>
        	<tr>
        		<td>카테고리 :</td>
            	<td>
                	<select name="boardTheme" id="boardTheme">
	                    <option value="1">나홀로 힐링</option>
	                    <option value="2">연인과 함께</option>
	                    <option value="3">친목 다지기~</option>
	                    <option value="4">가족 나들이</option>
	                    <option value="5">모임 여행</option>
	                </select>
	            </td>
        	</tr>
        	<tr>
        		<td>포인트 : </td>
        		<td><input type="number" id ="boardPoint" name="boardPoint"></td>
        	</tr>
        </table>

        
        <div>
            <button type="submit">저장</button>
        </div>
        
    </form>
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
                            <img
                                src="${pageContext.request.contextPath}/resources/img/search.png"
                                alt="">
                        </div>
                        Search
                    </button>
                </div>
                <div class="toolBtn">
                    <button id="test">
                        <div class="btnImg">
                            <img
                                src="${pageContext.request.contextPath}/resources/img/checkmark.png"
                                alt="">
                        </div>
                        Test
                    </button>
                </div>
                <div class="toolBtn">
                    <button id="line">
                        <div class="btnImg">
                            <img
                                src="${pageContext.request.contextPath}/resources/img/gps-route.png"
                                alt="">
                        </div>
                        Line
                    </button>
                </div>
                <div class="toolBtn">
                    <button id="linedelete">
                        <div class="btnImg">
                            <img
                                src="${pageContext.request.contextPath}/resources/img/eraser.png"
                                alt="">
                        </div>
                        Delete
                    </button>
                </div>
            </div>
            <div id="searchTab" class="bg_white" class="slide">
                <div class="option">
                    <div>
                            <input type="text" value="이태원 맛집" id="keyword" size="15">
                            <button type="button">검색</button>
                    </div>
                </div>
                <hr>
                <ul id="placesList"></ul>
                <div id="pagination"></div>
            </div>
        </div>
        
		<form action="/project/board/dayPlans.do" method="post" id="dayPlanForm">
		    <input type="number" name="days[${dayIndex - 1}].day" id="dayIndex" placeholder="dayIndex">
		    <div><input type="text" name="days[${dayIndex - 1}].dayInfo" id="dayInfo" placeholder="간단한 설명을 작성해주세요."></div>
		    <div class="click_wrap">
		        <div id="clickLatlng" class="click"></div>
		    </div>
		    <button type="button" id="dayBtn">+</button>
		</form>
    	
    	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7560b5ddb94a9dc91354ef62a6b750ee"></script> -->
    	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e4e2ed92d2d2bdb6c1837e8f4e3094f&libraries=services,clusterer,drawing"></script>

<script>
$(document).ready(function() {

	var dayIndex = 1; // 예시로 1로 초기화
	document.getElementById("boardTourdays").value = dayIndex;
	document.getElementById("dayIndex").value = dayIndex;
	
    $("#dayBtn").on('click', function() {
        var dayIndex = $("#day").val();
        var dayInfo = $("#dayInfo").val();
        var clickLatlngDiv = document.getElementById("clickLatlng");
        var positionInfos = clickLatlngDiv.getElementsByClassName("positionInfo");

        var jsonData = {
            day: document.getElementById("dayIndex").value,
            dayInfo: dayInfo,
            markers: []
        };

        for (var i = 0; i < positionInfos.length; i++) {
            var positionInfo = positionInfos[i];
            var markerIndex = i; // 현재 반복의 인덱스를 가져옵니다
            var markerData = {
                title: positionInfo.querySelector("#markerTitle_" + markerIndex).value,
                latitude: positionInfo.querySelector("#latitude_" + markerIndex).value,
                longitude: positionInfo.querySelector("#longitude_" + markerIndex).value,
                position: positionInfo.querySelector("#position_" + markerIndex).value,
                explain: positionInfo.querySelector("#explain_" + markerIndex).value
            };
            jsonData.markers.push(markerData);
        }


        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/board/dayPlans.do",
            contentType: "application/json",
            data: JSON.stringify(jsonData),
            success: function(data) {
                console.log("Success:", data);
                dayIndex++;
                document.getElementById("dayIndex").value = dayIndex; // 변경된 dayIndex 업데이트
                document.getElementById("boardTourdays").value = dayIndex;
            },
            error: function(error) {
                console.error("Error:", error);
            }
        });
    });
});
</script>
</body>
</html>