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
        <%@ include file="../nav.jsp" %>
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
									<c:if test="${selectedArrange == 'S'}">
									    <%
									        double distance = Double.parseDouble(pageContext.getAttribute("item.dist").toString());
									        double roundedDistance = Math.round(distance * 10.0) / 10.0; // 소수점 첫 번째 자리까지 반올림
									        String formattedDistance = String.format("%.1f", roundedDistance); // 출력 형식에 맞게 문자열로 변환
									    %>
									    <div class="info-dist"><%= formattedDistance %> km</div>
									</c:if>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="more-btn-box">
                    <c:if test="${currentPage > 1}">
                        <a href="${pageContext.request.contextPath}/tourlist?pageNo=${currentPage - 1}&area=${selectedArea}&arrange=${selectedArrange}&mapX=${mapX}&mapY=${mapY}" class="prev">이전</a>
                    </c:if>

                    <c:if test="${currentPage < totalPages}">
                        <a href="${pageContext.request.contextPath}/tourlist?pageNo=${currentPage + 1}&area=${selectedArea}&arrange=${selectedArrange}&mapX=${mapX}&mapY=${mapY}" class="next">다음</a>
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
                                <a href="${pageContext.request.contextPath}/tourlist?pageNo=${i}&area=${selectedArea}&arrange=${selectedArrange}&mapX=${mapX}&mapY=${mapY}" class="page-number">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>

            </div>
        </div>
    </div>

    <script>
    $(document).ready(function() {
        function updateDistanceVisibility() {
            var arrangeOption = $(".arrange-option.selected").data("arrange");
            console.log("Selected arrange option: " + arrangeOption);
            if (arrangeOption === 'S') {
                $(".info-dist").show();
            } else {
                $(".info-dist").hide();
            }
        }

        updateDistanceVisibility();

        $(".arrange-option").click(function() {
            var arrange = $(this).data("arrange");
            $(".arrange-option").removeClass("selected");
            $(this).addClass("selected");

            console.log("Clicked arrange option: " + arrange);

            if (arrange === "S") {
                navigator.geolocation.getCurrentPosition(function(position) {
                    var mapX = position.coords.longitude;
                    var mapY = position.coords.latitude;
                    console.log("User position: mapX=" + mapX + ", mapY=" + mapY);
                    var url = "${pageContext.request.contextPath}/tourlist?pageNo=1&arrange=S&mapX=" + mapX + "&mapY=" + mapY;
                    console.log("Redirecting to URL: " + url);
                    window.location.href = url;
                });
            } else {
                var area = "${selectedArea}";
                var url = "${pageContext.request.contextPath}/tourlist?pageNo=1&arrange=Q&area=" + area;
                console.log("Redirecting to URL: " + url);
                window.location.href = url;
            }
        });

        $("#resetBtn").click(function() {
            var url = "${pageContext.request.contextPath}/tourlist";
            console.log("Reset button clicked, redirecting to URL: " + url);
            window.location.href = url;
        });

        $(".area").click(function() {
            var area = $(this).data("area");
            var arrange = $(".arrange-option.selected").data("arrange");
            var url = "${pageContext.request.contextPath}/tourlist?pageNo=1&arrange=" + arrange + "&area=" + area;
            console.log("Area clicked: " + area + ", redirecting to URL: " + url);
            window.location.href = url;
        });

        $(".content").click(function() {
            var contentId = $(this).data("contentid");
            var contentTypeId = $(this).data("contenttypeid");
            var url = "${pageContext.request.contextPath}/tourlist/tourInfo?contentId=" + contentId + "&contentTypeId=" + contentTypeId;
            console.log("Content clicked, redirecting to URL: " + url);
            window.location.href = url;
        });

        // Initialize the selected arrange option
        var selectedArrange = "${selectedArrange}";
        console.log("Initial selected arrange option: " + selectedArrange);
        $(".arrange-option[data-arrange='" + selectedArrange + "']").addClass("selected");
        updateDistanceVisibility();
    });
    </script>
</body>
</html>
