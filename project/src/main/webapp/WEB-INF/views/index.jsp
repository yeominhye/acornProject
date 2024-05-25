<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관광 및 행사 정보</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
    <style>
        .wrap { width: 100%; }
        body { font-family: 'Helvetica Neue', Arial, sans-serif; background-color: #f4f4f9; margin: 0; padding: 0; }
        .wrap { display: flex; flex-direction: column; align-items: center; padding: 20px; }
        .container { display: flex; width: 100%; max-width: 1200px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); border-radius: 8px; background-color: #fff; }
        .side-container { flex: 1; padding: 20px; border-right: 1px solid #eaeaea; background-color: #fafafa; border-radius: 8px 0 0 8px; }
        .side-name { font-weight: bold; margin-bottom: 20px; font-size: 1.2em; color: #333; }
        .local-box, .month-box { display: flex; flex-wrap: wrap; gap: 10px; }
        .area, .month { padding: 10px 20px; border: 1px solid #ddd; border-radius: 5px; cursor: pointer; transition: background-color 0.3s, transform 0.3s; background-color: #fff; }
        .area:hover, .month:hover { background-color: #eaeaea; transform: translateY(-3px); }
        .selected { background-color: #dcdcdc; font-weight: bold; }
        .section { flex: 3; padding: 20px; }
        .section-name { font-size: 1.5em; margin-bottom: 20px; color: #333; }
        .section-name hr { border: none; height: 2px; background-color: #ddd; margin: 10px 0; }
        .tour-content, .festival-content { display: flex; flex-wrap: wrap; gap: 20px; }
        .content { display: flex; flex-direction: column; width: calc(33.333% - 20px); padding: 15px; border: 1px solid #ddd; border-radius: 5px; cursor: pointer; transition: transform 0.3s, box-shadow 0.3s; background-color: #fff; }
        .content:hover { transform: translateY(-5px); box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); }
        .content-img img { width: 100%; height: auto; border-radius: 5px; }
        .content-info { margin-top: 10px; text-align: center; }
        .info-name { font-size: 1.1em; margin-bottom: 5px; color: #333; }
        .info-local, .info-time { color: #777; font-size: 0.9em; }
    </style>
</head>
<body>
    <div class="wrap">
        <div class="container">
            <div class="side-container">
                <div class="side-name">지역</div>
                <div class="local-box">
                    <div class="area" data-area="1">서울</div>
                    <div class="area" data-area="2">인천</div>
                    <div class="area" data-area="3">대전</div>
                    <div class="area" data-area="4">대구</div>
                    <div class="area" data-area="5">광주</div>
                    <div class="area" data-area="6">부산</div>
                    <div class="area" data-area="7">울산</div>
                    <div class="area" data-area="8">세종</div>
                    <div class="area" data-area="31">경기도</div>
                    <div class="area" data-area="32">강원도</div>
                    <div class="area" data-area="33">충북</div>
                    <div class="area" data-area="34">충남</div>
                    <div class="area" data-area="35">경북</div>
                    <div class="area" data-area="36">경남</div>
                    <div class="area" data-area="37">전북</div>
                    <div class="area" data-area="38">전남</div>
                    <div class="area" data-area="39">제주</div>
                </div>
                    <c:forEach var="area" items="${areas}">
                        <div class="area" data-area="${area.id}">${area.name}</div>
                    </c:forEach>
                </div>
            </div>

            <div class="section">
                <div class="section-name">
                    # 관광지
                    <hr>
                </div>
                <div class="tour-content">
                    <!-- 관광지 리스트 -->
                    <script>
                        // 스크롤이 움직일때마다 값을 sessionStorage에 넣어줌
                        let scrollHeight = 0;
                        addEventListener('scroll', (event) => {
                            scrollHeight = $(document).scrollTop();
                            sessionStorage.setItem("scrollY", scrollHeight);
                        });

                        // 스크롤 위치 지정
                        $(document).ready(function() {
                            const scrollY = parseInt(sessionStorage.getItem("scrollY"));
                            if(scrollY && scrollY > 0){
                                window.scrollTo(0, scrollY);
                            }
                        });
                    </script>
                    <c:if test="${not empty tourList}">
                        <c:forEach var="item" items="${tourList}">
                            <div class="content" data-contentid="${item.contentid}" data-contenttypeid="${item.contenttypeid}">
                                <div class="content-img">
                                    <img src="${item.firstimage}" alt="${item.title}">
                                </div>
                                <div class="content-info">
                                    <div class="info-name">${item.title}</div>
                                    <div class="info-local">${item.addr1}</div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <button class="load-more-btn" data-type="tour">더보기</button>
                </div>
            </div>

            <div class="side-container">
                <div class="side-name">월</div>
                <div class="month-box">
                    <div class="month" data-month="01">1월</div>
                    <div class="month" data-month="02">2월</div>
                    <div class="month" data-month="03">3월</div>
                    <div class="month" data-month="04">4월</div>
                    <div class="month" data-month="05">5월</div>
                    <div class="month" data-month="06">6월</div>
                    <div class="month" data-month="07">7월</div>
                    <div class="month" data-month="08">8월</div>
                    <div class="month" data-month="09">9월</div>
                    <div class="month" data-month="10">10월</div>
                    <div class="month" data-month="11">11월</div>
                    <div class="month" data-month="12">12월</div>
                </div>
                    <c:forEach var="month" items="${months}">
                        <div class="month" data-month="${month.id}">${month.name}</div>
                    </c:forEach>
                </div>

            <div class="section">
                <div class="section-name">
                    # 축제/행사
                    <hr>
                </div>
                <div class="festival-content">
                    <!-- 행사 리스트 -->
                    <c:if test="${not empty eventList}">
                        <c:forEach var="item" items="${eventList}">
                            <div class="content" data-contentid="${item.contentid}" data-contenttypeid="${item.contenttypeid}">
                                <div class="content-img">
                                    <img src="${item.firstimage}" alt="${item.title}">
                                </div>
                                <div class="content-info">
                                    <div class="info-name">${item.title}</div>
                                    <div class="info-local">${item.addr1}</div>
                                    <div class="info-time">${item.eventstartdate}~${item.eventenddate}</div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <button class="load-more-btn" data-type="event">더보기</button>
                </div>
            </div>
         </div>

    <script>
        $(document).ready(function() {
            $(".load-more-btn").click(function() {
                var type = $(this).data("type");
                var url = type === "tour" ? "${pageContext.request.contextPath}/tourlist" : "${pageContext.request.contextPath}/eventlist";
                window.location.href = url;
            });

            $(".area").click(function() {
                var selectedArea = $(this).data("area");
                window.location.href = "${pageContext.request.contextPath}/index?area=" + selectedArea;
            });

            $(".month").click(function() {
                var selectedMonth = $(this).data("month");
                var selectedYear = new Date().getFullYear();
                window.location.href = "${pageContext.request.contextPath}/index?year=" + selectedYear + "&month=" + selectedMonth;
            });

            $(".content").click(function() {
                var contentId = $(this).data("contentid");
                var contentTypeId = $(this).data("contenttypeid");
                var url = $(this).closest(".tour-content").length ?
                    "${pageContext.request.contextPath}/index/tourInfo?contentId=" + contentId + "&contentTypeId=" + contentTypeId :
                    "${pageContext.request.contextPath}/index/eventInfo?contentId=" + contentId + "&contentTypeId=" + contentTypeId;
                window.location.href = url;
            });

            var selectedMonth = "${selectedMonth}";
            var selectedArea = "${selectedArea}";
            $(".month[data-month='" + selectedMonth + "']").addClass("selected");
            $(".area[data-area='" + selectedArea + "']").addClass("selected");
        });
    </script>
</body>
</html>
