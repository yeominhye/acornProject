<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/routePost.css" >

    <!-- icon key -->
    <script src="https://kit.fontawesome.com/7fa6781ad2.js" crossorigin="anonymous"></script>
</head>

<body>
       
    <div class="wrap">
     <!-- nav -->
       <%@ include file="../nav.jsp" %>
        
        <!-- header -->

        <div class="container">
        	<div class="btn-container">
        		<c:if test="${user.userCode eq routeBoard.userCode}">
        			<button class="post-btn">수정</button>
        			<button class="post-btn right">삭제</button>
        		</c:if>
			</div>
           

            <div class="title-container">
                <!-- 이미지 영역 -->
                <div class="image-box">
                    <img src="https://via.placeholder.com/300x400.jpg" alt="">
                </div>
                <!-- 타이틀 영역 -->
                <div class="title-box">
                    <div class="icon-region">
                        <p><c:choose>
                                <c:when test="${routeBoard.boardRegion == 0}">서울</c:when>
                                <c:when test="${routeBoard.boardRegion == 1}">인천</c:when>
                                <c:when test="${routeBoard.boardRegion == 2}">대전</c:when>
                                <c:when test="${routeBoard.boardRegion == 3}">대구</c:when>
                                <c:when test="${routeBoard.boardRegion == 4}">경기</c:when>
                                <c:when test="${routeBoard.boardRegion == 5}">부산</c:when>
                                <c:when test="${routeBoard.boardRegion == 6}">울산</c:when>
                                <c:when test="${routeBoard.boardRegion == 7}">광주</c:when>
                                <c:when test="${routeBoard.boardRegion == 8}">강원</c:when>
                                <c:when test="${routeBoard.boardRegion == 9}">충북</c:when>
                                <c:when test="${routeBoard.boardRegion == 10}">충남</c:when>
                                <c:when test="${routeBoard.boardRegion == 11}">경북</c:when>
                                <c:when test="${routeBoard.boardRegion == 12}">경남</c:when>
                                <c:when test="${routeBoard.boardRegion == 13}">전북</c:when>
                                <c:when test="${routeBoard.boardRegion == 14}">전남</c:when>
                                <c:when test="${routeBoard.boardRegion == 15}">제주</c:when>
                                <c:when test="${routeBoard.boardRegion == 16}">세종</c:when>
                            </c:choose></p>
                    </div>
                    <div class="title-section">${routeBoard.boardTitle}</div>
                    <div class="writer-section">
                        <p>${routeBoard.nickname}</p><img src="check.png" alt="">
                    </div>
                    <div class="date-section">${routeBoard.boardTourdays}일</div>
                    <div class="theme-section"><c:choose>
                                <c:when test="${routeBoard.boardTheme == 1}">#나홀로 힐링</c:when>
                                <c:when test="${routeBoard.boardTheme == 2}">#연인과 데이트</c:when>
                                <c:when test="${routeBoard.boardTheme == 3}">#친구들과</c:when>
                                <c:when test="${routeBoard.boardTheme == 4}">#가족 나들이</c:when>
                                <c:when test="${routeBoard.boardTheme == 5}">#모임 단체 여행</c:when>
                            </c:choose></div>
                    <div class="mark-section">
                        <div class="likes">
                            <i class="fa-regular fa-heart"></i>
                            <!-- 클릭 변경 아이콘 -->
                            <!-- <i class="fa-solid fa-heart"></i> -->
                            <span>123</span>
                        </div>
                        <div class="bookmark">
                            <i class="fa-regular fa-bookmark"></i>
                            <!-- 글 스크랩 시 변경 아이콘 -->
                            <!-- <i class="fa-solid fa-bookmark"></i>  -->
                        </div>
                        <div class="views"><span>views</span><span> ${routeBoard.boardViews }</span></div>
                    </div>

                    <div class="point-section">
                        <!-- 아이콘 못 고르겠어.. -->
                        <i class="fa-brands fa-product-hunt fa-2x"></i>
                        <i class="fa-solid fa-coins fa-2x"></i>
                        <i class="fa-solid fa-sack-dollar fa-2x"></i>
                        <span class="price">${routeBoard.boardPoint }</span>
                    </div>
                </div>

            </div>

            <hr class="divider first">

            <!-- 경로 영역 -->
            <div class="route-container">
                 <div class="route-index">
               		<c:forEach var="day" items="${routeBoard.days}" varStatus="loop">
	                    <div class="index-button">
	                        <h1>${loop.index+1}</h1>
	                    </div>
                    </c:forEach>
                </div>

                <div class="route-box">

                    <div class="route-upperside">
                        <div class="map" id="map" style="width: 60%; height:350px;"></div>
                        <div class="map-place-list-section">
                            <h2>#상세코스</h2>
                            <div class="place-list" id="place-list">
                            
                            </div>
                        </div>
                    </div>

                    <div class="route-lowerside">
                        <h2># 코멘트</h2>
                        <div class="day-comment">
                            <!-- test -->
                            <p class="dayCommentP">
                                하루의 코멘트
                            </p>

                        </div>
                    </div>

                </div>


            </div>

            <hr class="divider second">

            <!-- 총평 영역 -->
            <div class="review-container">
                <h2># 총평</h2>
                <div class="review-section">
                    <p>
                        ${routeBoard.boardContent}
                    </p>
                </div>
            </div>

            <!-- 댓글영역 -->
            <div class="comment-container">
                <h2>댓글</h2>
                <div class="comment-section">
               <div id="no-comments-message" style="display: none;">작성된 댓글이 없습니다.</div>
                    <div class="comment-box">
                         
                        <div class="each-comment">
                            <div class="comment-nickname">
                                <p>예원의 뽀대왕쟈님</p>
                            </div>
                            <div class="comment-content">
                                김예원님 한글 공백포함 400글자로 제한하겠습니다. 감사합니다. 수정 / 삭제 버튼은 css 안 넣어두겠습니다.
                            </div>
                            <div class="comment-date">2024.05.18</div>
                            <div class="edit-section">
                                <button class="edit-button">수정</button>
                                <button class="delete-button">삭제</button>
                            </div>
                        </div>

                        <div class="each-comment">
                            <div class="comment-nickname">
                                <p>김예원</p>
                            </div>
                            <div class="comment-content">
                                왜냐하면 위치 잡는중이걸랑요 꾸벅~ 다른 댓글들은 남이 썼을 때~~ 테스트~~
                            </div>
                            <div class="comment-date">2024.05.18</div>
                        </div>

                        <div class="each-comment">
                            <div class="comment-nickname">
                                <p>테스트중</p>
                            </div>
                            <div class="comment-content">
                                css 완성 아닙니다. 세부 수정 해야 해요~~! 
                            </div>
                            <div class="comment-date">2024.05.18</div>
                        </div>

                        <div class="each-comment">
                            <div class="comment-nickname">
                                <p>4th글쓴이</p>
                            </div>
                            <div class="comment-content">
                                김예원님 한글 공백포함 400글자로 제한하겠습니다. 감사합니다. 연소자의 근로는 특별한 보호를 받는다. 국무총리는 국회의 동의를 얻어 대통령이 임명한다.
                                대법원은
                                법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국가는 균형있는 국민경제의 성장 및 안정과
                                적정한
                                소득의 분배를 유지하고, 시장의 지배와 경제력의 남용을 방지하며, 경제주체간의 조화를 통한 경제의 민주화를 위하여 경제에 관한 규제와 조정을 할 수 있다.
                                통신·방송의 시설기준과 신문의 기능을 보장하기 위하여 필요한 사항은 법률로 정한다. 국가안전보장에 관련되는 대외정책·군사정책과 국내정책의 수립에 관하여
                                국무회의의
                                심의에 앞서 대통령의 자문에 응하기 위하여 국가안전보장회의를 둔다.
                            </div>
                            <div class="comment-date">2024.05.18</div>
                        </div>

                        <div class="each-comment">
                            <div class="comment-nickname">
                                <p>5th글쓴이</p>
                            </div>
                            <div class="comment-content">
                                김예원님 한글 공백포함 400글자로 제한하겠습니다. 감사합니다. 연소자의 근로는 특별한 보호를 받는다. 국무총리는 국회의 동의를 얻어 대통령이 임명한다.
                                대법원은
                                법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국가는 균형있는 국민경제의 성장 및 안정과
                                적정한
                                소득의 분배를 유지하고, 시장의 지배와 경제력의 남용을 방지하며, 경제주체간의 조화를 통한 경제의 민주화를 위하여 경제에 관한 규제와 조정을 할 수 있다.
                                통신·방송의 시설기준과 신문의 기능을 보장하기 위하여 필요한 사항은 법률로 정한다. 국가안전보장에 관련되는 대외정책·군사정책과 국내정책의 수립에 관하여
                                국무회의의
                                심의에 앞서 대통령의 자문에 응하기 위하여 국가안전보장회의를 둔다.
                            </div>
                            <div class="comment-date">2024.05.18</div>
                        </div>
                    </div>
                    <form action="#">
                        <div class="write-comment-section">

                            <textarea class="write-comment-form" name="" id="" placeholder="불쾌감을 주는 댓글은 무통보 삭제됩니다."></textarea>
                            <!-- <button class="add-comment-button">등록</button> -->
                            <button class="add-comment-button arrow"><i class="fa-solid fa-arrow-up"></i></button>
                        </div>
                    </form>

                </div>
            </div><!-- 댓글 영역 끝-->
            <div class="return-to-list-button"><button>목록보기</button></div>
        </div>
		<%@ include file="../footer-sub.jsp" %>
    </div>
	
    
</body>

<script>

    var indexBtn = document.getElementsByClassName("index-button");

    function handleClick(event) {

        if (event.currentTarget.classList.contains("clicked")) {

            event.currentTarget.classList.remove("clicked");
        } else {
            for (var i = 0; i < indexBtn.length; i++) {
                indexBtn[i].classList.remove("clicked");
            }
            event.currentTarget.classList.add("clicked");
        }
    }

    function init() {

        if (indexBtn.length > 0) {
            indexBtn[0].classList.add("clicked");
        }

        for (var i = 0; i < indexBtn.length; i++) {
            indexBtn[i].addEventListener("click", handleClick);
        }
    }

    init();
</script>

<script>
    function checkComments() {
        var comments = document.getElementsByClassName("each-comment");
        var noCommentsMessage = document.getElementById("no-comments-message");
        
        if (comments.length === 0) {
            noCommentsMessage.style.display = "block";
        } else {
            noCommentsMessage.style.display = "none";
        }
    }

    document.addEventListener("DOMContentLoaded", function() {
        checkComments();
    });
</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2b9e8d47e0abc983759ff27255e96150"></script>
    <script>
        var markersData = {};
       	var dayInfo = [];
        <c:forEach var="day" items="${routeBoard.days}" varStatus="loop">
        	dayInfo[${loop.index}] = ['<c:out value="${day.dayInfo}" />'],
            markersData[${loop.index}] = [
                <c:forEach var="marker" items="${day.markers}" varStatus="innerLoop">
                {
                    title: '<c:out value="${marker.title}" />',
                    position : '<c:out value="${marker.position}" />',
                	explain : '<c:out value="${marker.explain}" />',
                    latlng: {lat: <c:out value="${marker.latitude}" />, lng: <c:out value="${marker.longitude}" />}
                }<c:if test="${not innerLoop.last}">,</c:if>
                </c:forEach>
            ];
        </c:forEach>
    </script>

    <script>
    var indexBtn = document.getElementsByClassName("index-button");

    function handleClick(event) {
        var index = Array.prototype.indexOf.call(indexBtn, event.currentTarget);
        updateMapMarkers(index);

        if (!event.currentTarget.classList.contains("clicked")) {
            // 클릭된 요소에 clicked 클래스 추가
            event.currentTarget.classList.add("clicked");
        }

        // 다른 요소들은 클릭된 상태 제거
        for (var i = 0; i < indexBtn.length; i++) {
            if (i !== index) {
                indexBtn[i].classList.remove("clicked");
            }
        }
    }

    
    function init() {
        if (indexBtn.length > 0) {
            indexBtn[0].classList.add("clicked");
            updateMapMarkers(0);
        }

        for (var i = 0; i < indexBtn.length; i++) {
            indexBtn[i].addEventListener("click", handleClick);
        }
    }

    var mapContainer = document.getElementById('map'),
        mapOption = { 
            center: new kakao.maps.LatLng(${routeBoard.days[0].markers[0].latitude}, ${routeBoard.days[0].markers[0].longitude}),
            level: 5
        };
    var map = new kakao.maps.Map(mapContainer, mapOption);
    var markers = [];

    var infowindows = [];

    function clearMarkers() {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
            if (infowindows[i]) {
                infowindows[i].close();
            }
        }
        markers = [];
        infowindows = [];
    }

    function updateMapMarkers(dayIndex) {
        clearMarkers();
        var positions = markersData[dayIndex];
        var dayInfoElement = document.querySelector(".dayCommentP");
        dayInfoElement.textContent = dayInfo[dayIndex];   
        
        
        if (positions.length > 0) {
            map.setCenter(new kakao.maps.LatLng(positions[0].latlng.lat, positions[0].latlng.lng));
        }
        for (var i = 0; i < positions.length; i++) {
            var marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(positions[i].latlng.lat, positions[i].latlng.lng),
                title: positions[i].title,
                image: new kakao.maps.MarkerImage("https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png", new kakao.maps.Size(24, 35))
            });
            markers.push(marker);

            var iwContent = '<div style="padding:5px;">' + '<strong>' + positions[i].title + '</strong><br>' + '<a href="https://map.kakao.com/link/map/' + encodeURIComponent(positions[i].title) + ',' + positions[i].latlng.lat + ',' + positions[i].latlng.lng + ' target="_blank">큰지도보기</a> ' +
            '<a href="https://map.kakao.com/link/to/' + encodeURIComponent(positions[i].title) + ',' + positions[i].latlng.lat + ',' + positions[i].latlng.lng + '"target="_blank">길찾기</a>' +'</div>';

            var iwPosition = new kakao.maps.LatLng(positions[i].latlng.lat, positions[i].latlng.lng);
            var infowindow = new kakao.maps.InfoWindow({
                position: iwPosition,
                content: iwContent
            });
            infowindows.push(infowindow);
            infowindow.open(map, marker);
            
            kakao.maps.event.addListener(marker, 'click', (function (marker, infowindow) {
                return function () {
                	if (infowindow.getMap()) {
                        infowindow.close();
                    } else {
                        infowindow.open(map, marker);
                    }
                };
            })(marker, infowindow));

        }
        var placeList = document.querySelector(".place-list");
        placeList.innerHTML = "";

        for (var i = 0; i < positions.length; i++) {
            var div = document.createElement("div");
            div.className = "markerDetail";

            var number = document.createElement("span");
            number.className = "number";
            number.textContent = (i + 1) + ".";

            var inputs = document.createElement("div");
            inputs.className = "markerInputs";

            var title = document.createElement("input");
            title.className = "markerInput";
            title.id = "markerTitle" + i;
            title.value = positions[i].title;
            title.readOnly = true;

            var position = document.createElement("input");
            position.className = "markerInput";
            position.id = "markerPosition" + i;
            position.value = positions[i].position;
            position.readOnly = true;

            var explain = document.createElement("input");
            explain.className = "markerInput";
            explain.id = "markerExplain" + i;
            explain.value = positions[i].explain;
            explain.readOnly = true;

            placeList.appendChild(div);
            div.appendChild(number);
            div.appendChild(inputs);
            inputs.appendChild(title);
            inputs.appendChild(position);
            inputs.appendChild(explain);
        }
    }
    


    document.addEventListener("DOMContentLoaded", function() {
        init();
    });


    </script>



</html>