<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관광</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/tourlist.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .filter-keep-btn:hover,
        .filter-keep-btn.hovered,
        .filter-keep-btn.clicked {
            color: white;
            background-color: #E78181;
        }
        
        .info-name {
			white-space: nowrap;
		    width: 230px;
		    margin-top: 3.5px;
		    overflow: hidden;
		    position: relative;
			
		}
		
		.info-name span {
			display: inline-block;
		    transition: transform 5s;
		}
		
		.page-number-box {
			width: 400px;
			margin: 0 auto;
			text-align: center;
			padding: 40px;
		}
		.page-number-box > * {
			padding: 0 10px;
		}
		
		img {cursor: pointer;}
    </style>    
</head>
<body>
    <div class="wrap">
        <%@ include file="../nav.jsp" %>
        <div class="container">
            <div class="side-container">
                <div class="side">
                    <div class="side-name">지역</div>
                    <div class="local-box">
                        <div class="area filter-keep-btn" data-area="1">서울</div>
                        <div class="area filter-keep-btn" data-area="2">인천</div>
                        <div class="area filter-keep-btn" data-area="3">대전</div>
                        <div class="area filter-keep-btn" data-area="4">대구</div>
                        <div class="area filter-keep-btn" data-area="31">경기</div>
                        <div class="area filter-keep-btn" data-area="6">부산</div>
                        <div class="area filter-keep-btn" data-area="7">울산</div>
                        <div class="area filter-keep-btn" data-area="5">광주</div>
                        <div class="area filter-keep-btn" data-area="32">강원</div>
                        <div class="area filter-keep-btn" data-area="33">충북</div>
                        <div class="area filter-keep-btn" data-area="34">충남</div>
                        <div class="area filter-keep-btn" data-area="35">경북</div>
                        <div class="area filter-keep-btn" data-area="36">경남</div>
                        <div class="area filter-keep-btn" data-area="37">전북</div>
                        <div class="area filter-keep-btn" data-area="38">전남</div>
                        <div class="area filter-keep-btn" data-area="39">제주</div>
                        <div class="area filter-keep-btn" data-area="8">세종</div>
                    </div>
                    <div class="filter-btn-box sort-options">
                        <div class="filter-reset-btn filter-keep-btn arrange-option" data-arrange="S">거리순</div>
                        <div class="filter-reset-btn filter-keep-btn arrange-option" data-arrange="Q">최신순</div>
                    </div>
                </div>
            </div>
            <div class="section">
                <div class="section-name">
                    # 관광지
                    <hr>
                </div>
                <div class="content-box">
                    <c:forEach var="item" items="${tourList}">
                        <div class="content" data-contentid="${item.contentid}" data-contenttypeid="${item.contenttypeid}">
                            <div class="content-img">
                                <img src="${item.firstimage}">
                            </div>
                            <div class="content-info">
                                <div class="info-name"><span>${item.title}</span></div>
                                <div class="info-local">${item.addr1}</div>
                                <div class="info-dist">${item.dist}</div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                
                <!-- 
                <div class="more-btn-box">
                    <c:if test="${currentPage > 1}">
                        <a href="${pageContext.request.contextPath}/tourlist?pageNo=${currentPage - 1}&area=${selectedArea}&arrange=${selectedArrange}&mapX=${mapX}&mapY=${mapY}" class="prev">이전</a>
                    </c:if>
                    <c:if test="${currentPage < totalPages}">
                        <a href="${pageContext.request.contextPath}/tourlist?pageNo=${currentPage + 1}&area=${selectedArea}&arrange=${selectedArrange}&mapX=${mapX}&mapY=${mapY}" class="next">다음</a>
                    </c:if>
                </div>
                -->
                
                <div class="page-number-box">
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <c:choose>
                            <c:when test="${i == currentPage}">
                                <span class="current-page">${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/tourlist?pageNo=${i}&area=${selectedArea}&arrange=${selectedArrange}&mapX=${mapX}&mapY=${mapY}" class="page-number">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
                
            </div>
        </div>
        <%@ include file="../footer-sub.jsp" %>
    </div>
    <script src="${pageContext.request.contextPath}/resources/js/textSlide.js" defer></script>
    <script>
    $(document).ready(function() {
        // 페이지 로드 시 초기 설정
        var clickedButton = localStorage.getItem("clickedButton");
        var clickedArea = localStorage.getItem("clickedArea");

        // 기본 설정: 서울 지역과 최신순으로 초기화
        if (!clickedArea && !clickedButton) {
            $(".filter-keep-btn[data-area='1']").addClass("clicked"); // 서울 지역에 clicked 클래스 추가
            $(".filter-keep-btn[data-arrange='Q']").addClass("clicked"); // 최신순 버튼에 clicked 클래스 추가
            localStorage.setItem("clickedArea", "1");
            localStorage.setItem("clickedButton", "Q");
        } else {
            // 페이지 재방문 시 저장된 클릭 상태 복구
            localStorage.setItem("clickedArea", "1");
            $(".filter-keep-btn[data-area='1']").addClass("clicked");
            if (clickedArea) {
            	$(".filter-keep-btn").removeClass("clicked");   
                $(".filter-keep-btn[data-area='" + clickedArea + "']").addClass("clicked");
                // 최신순 버튼에 클릭 상태 추가
                $(".filter-keep-btn[data-arrange='Q']").addClass("clicked");
            }
            if (clickedButton) {
                $(".filter-keep-btn[data-arrange='" + clickedButton + "']").addClass("clicked");
            }
        }

        // 거리 정보 표시 및 거리순 정렬 유지
        function displayDistanceAndSort() {
            $('.content').each(function() {
                var distElement = $(this).find('.info-dist');
                var distanceText = distElement.text().trim();

                if (!isNaN(parseFloat(distanceText))) {
                    var distanceInKm = parseFloat(distanceText) / 1000; // km 단위로 변환
                    if (distanceInKm > 0) {
                        distElement.removeClass('hidden');
                        distElement.text(distanceInKm.toFixed(1) + ' km');
                    } else {
                        distElement.addClass('hidden');
                    }
                } else {
                    distElement.addClass('hidden');
                }
            });
        }

        displayDistanceAndSort();

        // 정렬 옵션 클릭 시 동작
        $(".arrange-option").click(function() {
            $(".arrange-option").removeClass("clicked");
            $(this).addClass("clicked");
            var arrange = $(this).data("arrange");
            if (arrange === "S") {
                navigator.geolocation.getCurrentPosition(function(position) {
                    var mapX = position.coords.longitude;
                    var mapY = position.coords.latitude;
                    var url = "${pageContext.request.contextPath}/tourlist?pageNo=1&arrange=S&mapX=" + mapX + "&mapY=" + mapY;
                    window.location.href = url;
                });
            } else if (arrange === "Q") {
                var area = localStorage.getItem("clickedArea") || "1"; // 기본 서울로 설정
                var url = "${pageContext.request.contextPath}/tourlist?pageNo=1&arrange=Q&area=" + area;
                window.location.href = url;
            }
        });

        // 초기화 버튼 클릭 이벤트 핸들러
        $("#resetBtn").click(function() {
            $(".arrange-option, .filter-keep-btn").removeClass("clicked");
            localStorage.removeItem("clickedButton");
            localStorage.removeItem("clickedArea");
            window.location.href = "${pageContext.request.contextPath}/tourlist";
        });

        // filter-keep-btn 클릭 이벤트 핸들러
        $(".filter-keep-btn").click(function() {
            $(".filter-keep-btn").removeClass("clicked");
            $(this).addClass("clicked");
            var clickedButton = $(this).data("arrange");
            var clickedArea = $(this).data("area");
            if (clickedButton) {
                localStorage.setItem("clickedButton", clickedButton);
                localStorage.removeItem("clickedArea");
            }
            if (clickedArea) {
                localStorage.setItem("clickedArea", clickedArea);
                localStorage.setItem("clickedButton", "Q");
                // 최신순 버튼에 클릭 상태 추가
                $(".filter-keep-btn[data-arrange='Q']").addClass("clicked");
            }
        });

        // filter-keep-btn 호버 이벤트 핸들러
        $(".filter-keep-btn").hover(function() {
            $(this).addClass("hovered");
        }, function() {
            $(this).removeClass("hovered");
        });

        // 지역 클릭 시 동작
        $(".area").click(function() {
            var area = $(this).data("area");
            localStorage.setItem("clickedArea", area);
            localStorage.setItem("clickedButton", "Q");
            var url = "${pageContext.request.contextPath}/tourlist?pageNo=1&arrange=Q&area=" + area;
            window.location.href = url;
        });


        $(".content").click(function() {
            var contentId = $(this).data("contentid");
            var contentTypeId = $(this).data("contenttypeid");
            window.location.href = "${pageContext.request.contextPath}/tourlist/tourInfo?contentId=" + contentId + "&contentTypeId=" + contentTypeId;
        });
    });
    </script>
</body>
</html>
