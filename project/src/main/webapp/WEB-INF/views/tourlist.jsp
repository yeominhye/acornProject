<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관광</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- reset.css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">


<style>
.container {
	width: 1100px;
	padding-top: 75px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
}

.side-container {
	position: relative;
	width: 210px;
}

.side {
	position: fixed;
	width: 210px;
	background-color: #f5f5f5;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 4px 4px 4px rgba(0, 0, 0, 0.25);
}

.side-name {
	font-size: 18px;
	font-weight: bold;
	text-decoration: underline;
}

.local-box {
	margin: 10px auto;
	width: 98%;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.area {
	display: flex;
	justify-content: center;
	align-self: center;
	width: 40px;
	height: 20px;
	font-size: 14px;
	font-weight: 600;
	color: #999999;
	margin-bottom: 5px;
	border-radius: 50px;
	cursor: pointer;
}

.filter-reset-btn {
	display: flex;
	justify-content: center;
	align-self: center;
	margin: 0 auto;
	margin-top: 75px;
	width: 125px;
	height: 25px;
	border-radius: 25px;
	background-color: #EAEAEA;
	color: #5c5c5c;
	font-weight: bolder;
	cursor: pointer;
}

.clickEvent {
	color: white;
	background-color: #E78181;
}

.filter-btn-box div:hover {
	color: white;
	background-color: #E78181;
}

.section {
	position: relative;
	width: 850px;
}

.section-name {
	font-size: 24px;
	font-weight: bold;
}

.section-name hr {
	margin: 10px 0 50px 0;
	color: black;
}

.content {
	width: 250px;
	height: 315px;
	margin-bottom: 15px;
}

.content-img, .content-img img {
	width: 250px;
	height: 250px;
}

.content-info {
	width: 95%;
	height: 65px;
	margin: 0 auto;
	font-size: 12px;
	overflow: hidden;
}

.info-name {
	font-size: 16px;
	font-weight: bolder;
	margin: 5px 0;
}

.info-local {
	color: #747474;
}

.content-box {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.hidden {
	display: none; /* 숨김 처리할 스타일 */
}
</style>
</head>
<body>
    <div class="wrap">
        <!-- nav 들어갈 부분 -->
        <div class="nav">nav</div>

        <div class="container">
            <div class="side-container">
                <div class="side">
                    <div class="side-name">지역</div>
                    <div class="local-box">
                        <div class="area" data-area="1">서울</div>
                        <div class="area" data-area="2">인천</div>
                        <div class="area" data-area="3">대전</div>
                        <div class="area" data-area="4">대구</div>
                        <div class="area" data-area="31">경기</div>
                        <div class="area" data-area="6">부산</div>
                        <div class="area" data-area="7">울산</div>
                        <div class="area" data-area="5">광주</div>
                        <div class="area" data-area="32">강원</div>
                        <div class="area" data-area="33">충북</div>
                        <div class="area" data-area="34">충남</div>
                        <div class="area" data-area="35">경북</div>
                        <div class="area" data-area="36">경남</div>
                        <div class="area" data-area="37">전북</div>
                        <div class="area" data-area="38">전남</div>
                        <div class="area" data-area="39">제주</div>
                        <div class="area" data-area="8">세종</div>
                    </div>

                    <div class="filter-btn-box">
                        <div class="filter-reset-btn" id="resetBtn">초기화</div>
                    </div>
                </div>
            </div>
            <div class="section">
                <div class="section-name">
                    # 관광지
                    <hr>
                </div>

                <div class="sort-options">
                    <div class="arrange-option" data-arrange="S">거리순</div>
                    <div class="arrange-option" data-arrange="Q">최신순</div>
                </div>

                <div class="content-box">
                    <c:forEach var="item" items="${tourList}">
                        <div class="content" data-contentid="${item.contentid}"
                            data-contenttypeid="${item.contenttypeid}">
                            <div class="content-img">
                                <img src="${item.firstimage}">
                            </div>
                            <div class="content-info">
                                <div class="info-name">${item.title}</div>
                                <div class="info-local">${item.addr1}</div>
                                <div class="info-dist">${item.dist}km</div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="more-btn-box">
                    <c:if test="${currentPage > 1}">
                        <a href="#" class="prev">Previous</a>
                    </c:if>

                    <c:if test="${currentPage < totalPages}">
                        <a href="#" class="next">Next</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <!-- 위치 정보 및 페이지 이동 스크립트 -->
    <script>
    
    $(document).ready(function() {
        // 거리 정보 표시
        $('.content').each(function() {
            var distElement = $(this).find('.info-dist'); // 해당 .content 내에서 .info-dist 요소를 찾음
            var arrangeOption = $('.arrange-option.selected').data('arrange'); // 선택된 정렬 방법을 가져옴

            var distanceInKm = parseFloat(distElement.text().trim());
            var roundedDistance = Math.round(distanceInKm * 100) / 100; // 소수점 두 자리에서 반올림

            if (roundedDistance === 0 || arrangeOption !== 'S') {
                distElement.addClass('hidden'); // 거리가 0km이거나 거리순이 아닌 경우에는 숨김 처리
            } else {
                distElement.text(roundedDistance.toFixed(2) + ' km'); // 소수점 두 자리까지 표시
            }
        });
    });
    
        $(document).ready(function() {
            // 거리순 정렬 버튼 클릭 시 동작
            $(".arrange-option").click(function() {
                var arrange = $(this).data("arrange");
                if (arrange === "S") {
                    // 사용자의 위치 정보 가져오기
                    navigator.geolocation.getCurrentPosition(function(position) {
                        var mapX = position.coords.longitude;
                        var mapY = position.coords.latitude;

                        // 위치 정보를 포함하여 URL 구성
                        var url = "${pageContext.request.contextPath}/tourlist?pageNo=1&arrange=S&mapX=" + mapX + "&mapY=" + mapY;
                        
                        // 구성된 URL로 페이지 이동
                        window.location.href = url;
                    });
                } else if (arrange === "Q") {
                    // 최신순 클릭 시 이전에 선택한 지역 정보를 가져와서 사용
                    var area = "${selectedArea}";
                    var url = "${pageContext.request.contextPath}/tourlist?pageNo=1&arrange=Q&area=" + area;
                    
                    // 구성된 URL로 페이지 이동
                    window.location.href = url;
                }
            });

//             // 거리 정보 표시
//             $('.content').each(function() {
//                 var distElement = $(this).find('.info-dist'); // 해당 .content 내에서 .info-dist 요소를 찾음
//                 var arrangeOption = $('.arrange-option.selected').data('arrange'); // 선택된 정렬 방법을 가져옴

//                 var distanceInKm = parseFloat(distElement.text().trim());
//                 var roundedDistance = Math.round(distanceInKm * 100) / 100; // 소수점 두 자리에서 반올림

//                 if (roundedDistance === 0 || arrangeOption !== 'S') {
//                     distElement.addClass('hidden'); // 거리가 0km이거나 거리순이 아닌 경우에는 숨김 처리
//                 } else {
//                     distElement.text(roundedDistance.toFixed(2) + ' km'); // 소수점 두 자리까지 표시
//                 }
//             });


            // 초기화 버튼 클릭 이벤트 핸들러
            $("#resetBtn").click(function() {
                window.location.href = "${pageContext.request.contextPath}/tourlist";
            });

            // 위치 정보 가져와서 페이지 이동하는 함수
            function getLocationAndRedirect(arrange) {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(function(position) {
                        var mapX = position.coords.longitude;
                        var mapY = position.coords.latitude;
                        window.location.href = "${pageContext.request.contextPath}/tourlist?arrange=" + arrange + "&mapX=" + mapX + "&mapY=" + mapY;
                    }, function(error) {
                        console.error("Error occurred. Error code: " + error.code);
                    });
                } else {
                    console.error("Geolocation is not supported by this browser.");
                }
            }

            $(".area").click(function() {
                var area = $(this).data("area");
                var arrange = $(".arrange-option.selected").data("arrange");

                var url = "${pageContext.request.contextPath}/tourlist?pageNo=1&arrange=" +arrange + "&area=" + area;
                window.location.href = url;
            });
            // 페이지 이동 버튼 클릭 이벤트 핸들러
            $(".prev").click(function(e) {
                e.preventDefault();
                var pageNo = parseInt("${currentPage}") - 1;
                var arrange = $(".arrange-option.selected").data("arrange");
                var area = $(".area.selected").data("area");

                var url = "${pageContext.request.contextPath}/tourlist?pageNo=" + pageNo + "&arrange=" + arrange + "&area=" + area;
                window.location.href = url;
            });

            $(".next").click(function(e) {
                e.preventDefault();
                var pageNo = parseInt("${currentPage}") + 1;
                var arrange = $(".arrange-option.selected").data("arrange");
                var area = $(".area.selected").data("area");

                var url = "${pageContext.request.contextPath}/tourlist?pageNo=" + pageNo + "&arrange=" + arrange + "&area=" + area;
                window.location.href = url;
            });
        });

        // 관광지 정보 클릭 이벤트 핸들러
        document.querySelectorAll(".content").forEach(function(element) {
            element.addEventListener("click", function() {
                var contentId = this.getAttribute("data-contentid");
                var contentTypeId = this.getAttribute("data-contenttypeid");
                window.location.href = "${pageContext.request.contextPath}/tourlist/tourInfo?contentId=" + contentId + "&contentTypeId=" + contentTypeId;
            });
        });
    </script>
</body>
</html>
