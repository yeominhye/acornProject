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
    // Preview uploaded image
    function previewImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                $('#coverImagePreview').attr('src', e.target.result).show();
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

    // Initialize map for next day
    function initializeMapForNextDay() {
        // Assuming you have a function in your map.js to initialize the map
        // Replace with your actual initialization logic
        initMap(); // Example function call to initialize map
    }

    // Add new day plan
    function addDayPlan() {
        // Perform any necessary operations when adding a new day plan
        // For example, initializing the map for the next day
        initializeMapForNextDay();
    }

    // Example function for searching places
    function searchPlaces() {
        // Your search places logic here
    }
    
    var dayIndex = 1; // 예시로 1로 초기화
    document.getElementById("day").value = dayIndex;
</script>
</head>

<body>


    <h2>루트 제작 페이지</h2>
    <form:form modelAttribute="route" method="post" action="/routes" enctype="multipart/form-data">
        <div id="dayPlans">
            <c:forEach items="${route.dayPlans}" varStatus="loop">
                <h2>Day ${loop.index + 1}</h2>
                <textarea name="dayPlans[${loop.index}].comments" placeholder="Comments"></textarea>
                <div id="map${loop.index + 1}"></div>
            </c:forEach>
        </div>
        <div>
            <label for="coverImage">대표 사진:</label>
            <input type="file" name="coverImageFile" id="coverImageFile" accept="image/*" onchange="previewImage(this);" />
            <img id="coverImagePreview" src="#" alt="대표 사진 미리보기" style="max-width: 200px; max-height: 200px; display: none;" />
        </div>

        <div>
        	<div>
           	 	<label for="title">제목:</label>
            	<input type="text" id="title" />
	        </div>
    	    <div>
        	    <label for="date">날짜:</label>
            	<form:input path="date" id="date" />
        	</div>
        	<div>
            	<label for="region">지역:</label>
            	<form:input path="region" id="region" />
        	</div>
        	<div>
            	<label for="category">카테고리:</label>
            	<form:input path="category" id="category" />
        	</div>
        </div>
        
        <table>
        	<tr>
        		<td>제목 : </td>
        		<td><input type="text" id="title" name="title" placeholder="제목"></td>
        	</tr>
        	<tr>
    			<td>날짜 :</td>
    			<td><input type="text" id="day" name="day" readonly></td>
			</tr>

        	 <tr>
            	<td>지역 :</td>
            	<td>
                	<select name="region" id="region">
	                    <option value="서울">서울</option>
	                    <option value="인천">인천</option>
	                    <option value="대전">대전</option>
	                    <option value="대구">대구</option>
	                    <option value="경기">경기</option>
	                    <option value="부산">부산</option>
	                    <option value="울산">울산</option>
	                    <option value="광주">광주</option>
	                    <option value="강원">강원</option>
	                    <option value="충북">충북</option>
	                    <option value="충남">충남</option>
	                    <option value="경북">경북</option>
	                    <option value="경남">경남</option>
	                    <option value="전북">전북</option>
	                    <option value="전남">전남</option>
	                    <option value="제주">제주</option>
	                </select>
	            </td>
        	</tr>
        	<tr>
        		<td>카테고리 :</td>
            	<td>
                	<select name="category" id="category">
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
        		<td><input type="number" name="boardPoint"></td>
        	</tr>
        </table>

        <div class="map_wrap" style="">
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

        <div>
            <label for="overallComments">총평:</label>
            <form:input path="overallComments" id="overallComments" />
        </div>

        <button type="button" onclick="addDayPlan()">+</button>

        <div>
            <button type="submit">저장</button>
        </div>
    </form:form>

    <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7560b5ddb94a9dc91354ef62a6b750ee"></script> -->
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e4e2ed92d2d2bdb6c1837e8f4e3094f&libraries=services,clusterer,drawing"></script>

<script>
    var dayIndex = 1; // 예시로 1로 초기화
    document.getElementById("day").value = dayIndex;
</script>
</body>
</html>
