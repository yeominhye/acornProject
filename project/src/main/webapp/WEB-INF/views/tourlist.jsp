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
<!-- tourlist.css -->
<link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/resources/css/tourlist.css">
</head>
<body>
    <div class="wrap">
        <%@ include file="nav.jsp" %>
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
                        <a href="${pageContext.request.contextPath}/tourlist?pageNo=${currentPage - 1}&area=${selectedArea}&arrange=${selectedArrange}&mapX=${selectedMapX}&mapY=${selectedMapY}" class="prev">이전</a>
                    </c:if>

                    <c:if test="${currentPage < totalPages}">
                        <a href="${pageContext.request.contextPath}/tourlist?pageNo=${currentPage + 1}&area=${selectedArea}&arrange=${selectedArrange}&mapX=${selectedMapX}&mapY=${selectedMapY}" class="next">다음</a>
                    </c:if>
                </div>

                <!-- 페이지 번호 표시 -->
                <div class="page-number-box">
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <c:choose>
                            <c:when test="${i == currentPage}">
                                <span class="current-page">${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/tourlist?pageNo=${i}&area=${selectedArea}&arrange=${selectedArrange}&mapX=${selectedMapX}&mapY=${selectedMapY}" class="page-number">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>

            </div>
        </div>
    </div>

    <script>
    $(document).ready(function() {
        // 거리 정보 표시 및 거리순 정렬 유지
        function displayDistanceAndSort() {
            $('.content').each(function() {
                var distElement = $(this).find('.info-dist');
                var arrangeOption = $('.arrange-option.selected').data('arrange');

                var distanceInKm = parseFloat(distElement.text().trim());
                var roundedDistance = Math.round(distanceInKm * 100) / 100;

                if (roundedDistance === 0 || arrangeOption !== 'S') {
                    distElement.addClass('hidden');
                } else {
                    distElement.text(roundedDistance.toFixed(2) + ' km');
                }
            });
        }

        displayDistanceAndSort();

        // 거리순 정렬 버튼 클릭 시 동작
        $(".arrange-option").click(function() {
            var arrange = $(this).data("arrange");
            if (arrange === "S") {
                navigator.geolocation.getCurrentPosition(function(position) {
                    var mapX = position.coords.longitude;
                    var mapY = position.coords.latitude;
                    var url = "${pageContext.request.contextPath}/tourlist?pageNo=1&arrange=S&mapX=" + mapX + "&mapY=" + mapY;
                    window.location.href = url;
                });
            } else if (arrange === "Q") {
                var area = "${selectedArea}";
                var url = "${pageContext.request.contextPath}/tourlist?pageNo=1&arrange=Q&area=" + area;
                window.location.href = url;
            }
        });

        // 초기화 버튼 클릭 이벤트 핸들러
        $("#resetBtn").click(function() {
            window.location.href = "${pageContext.request.contextPath}/tourlist";
        });

        $(".area").click(function() {
            var area = $(this).data("area");
            var arrange = $(".arrange-option.selected").data("arrange");
            var url = "${pageContext.request.contextPath}/tourlist?pageNo=1&arrange=" + arrange + "&area=" + area;
            window.location.href = url;
        });

        // 관광지 정보 클릭 이벤트 핸들러
        $(".content").click(function() {
            var contentId = $(this).data("contentid");
            var contentTypeId = $(this).data("contenttypeid");
            window.location.href = "${pageContext.request.contextPath}/tourlist/tourInfo?contentId=" + contentId + "&contentTypeId=" + contentTypeId;
        });
    });
    </script>
</body>
</html>
