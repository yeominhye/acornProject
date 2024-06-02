<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="nav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>경로당</title>
    <!-- reset.css -->	
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" >

    <!-- index.css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css?after" >

    <!-- index.js -->
<%--     <script defer src="${pageContext.request.contextPath}/resources/js/home.js"></script> --%>
    
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    
   <!-- google-font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
</head>
<body>
	<div class="wrap">

        <!-- header --> 
        <header>
            <div class="header-container">
                <div class="header-text-box">
                    <div class="header-text01">경로를 공유하는 당신</div>
                    <div class="header-text02">경로당</div>
                   <img class="header-img4" src="${pageContext.request.contextPath}/resources/img/header-img04.png" alt="">
                </div>
            </div>
            <div class="header-img-box">
                <img class="header-img2" src="${pageContext.request.contextPath}/resources/img/header-map.png" alt="">
                <img class="header-img0" src="${pageContext.request.contextPath}/resources/img/header-img.png" alt="">
                <img class="header-img1" src="${pageContext.request.contextPath}/resources/img/header-img01.png" alt="">
            </div>
        </header>

		<!-- section-01 -->
		<section>
			<div class="section-container">
				<div class="section-slide">
					<div class="section-slide-items">
						<div class="slide-item slide-item01 area" data-area="1">
							<!-- id는 지역명으로 -->
							<img
								src="${pageContext.request.contextPath}/resources/img/header-icon01.png"
								alt="">
							<div>전체</div>
						</div>
						<div class="slide-item slide-item02 area" data-area="1">
							<img
								src="${pageContext.request.contextPath}/resources/img/header-icon02.png"
								alt="">
							<div>서울</div>
						</div>
						<div class="slide-item slide-item03 area" data-area="2">
							<img
								src="${pageContext.request.contextPath}/resources/img/header-icon03.png"
								alt="">
							<div>인천</div>
						</div>
						<div class="slide-item slide-item04 area" data-area="3">
							<img
								src="${pageContext.request.contextPath}/resources/img/header-icon04.png"
								alt="">
							<div>대전</div>
						</div>
						<div class="slide-item slide-item05 area" data-area="4">
							<img
								src="${pageContext.request.contextPath}/resources/img/header-icon05.png"
								alt="">
							<div>대구</div>
						</div>
						<div class="area slide-item slide-item06" data-area="31">
							<img
								src="${pageContext.request.contextPath}/resources/img/header-icon06.png"
								alt="">
							<div>경기</div>
						</div>
						<div class="slide-item slide-item07 area" data-area="6">
							<img
								src="${pageContext.request.contextPath}/resources/img/header-icon07.png"
								alt="">
							<div>부산</div>
						</div>
						<div class="slide-item slide-item08 area" data-area="7">
							<img
								src="${pageContext.request.contextPath}/resources/img/header-icon08.png"
								alt="">
							<div>울산</div>
						</div>
						<div class="slide-item slide-item09 area" data-area="5">
							<img
								src="${pageContext.request.contextPath}/resources/img/header-icon09.png"
								alt="">
							<div>광주</div>
						</div>
						<div class="slide-item slide-item10 area" data-area="32">
							<img
								src="${pageContext.request.contextPath}/resources/img/header-icon10.png"
								alt="">
							<div>강원</div>
						</div>
						<div class="slide-item slide-item11 area" data-area="33">
							<img
								src="${pageContext.request.contextPath}/resources/img/header-icon11.png"
								alt="">
							<div>충북</div>
						</div>
						<div class="slide-item slide-item19 area" data-area="34">
							<img
								src="${pageContext.request.contextPath}/resources/img/header-icon12.png"
								alt="">
							<div>충남</div>
						</div>
						<div class="slide-item slide-item13 area" data-area="35">
							<img
								src="${pageContext.request.contextPath}/resources/img/header-icon13.png"
								alt="">
							<div>경북</div>
						</div>
						<div class="slide-item slide-item14 area" data-area="36">
							<img
								src="${pageContext.request.contextPath}/resources/img/header-icon14.png"
								alt="">
							<div>경남</div>
						</div>
						<div class="slide-item slide-item15 area" data-area="37">
							<img
								src="${pageContext.request.contextPath}/resources/img/header-icon15.png"
								alt="">
							<div>전북</div>
						</div>
						<div class="slide-item slide-item16 area" data-area="38">
							<img
								src="${pageContext.request.contextPath}/resources/img/header-icon16.png"
								alt="">
							<div>전남</div>
						</div>
						<div class="slide-item slide-item17 area" data-area="39">
							<img
								src="${pageContext.request.contextPath}/resources/img/header-icon17.png"
								alt="">
							<div>제주</div>
						</div>
						<div class="slide-item slide-item18 area" data-area="8">
							<img
								src="${pageContext.request.contextPath}/resources/img/header-icon18.png"
								alt="">
							<div>세종</div>
						</div>
					</div>
				</div>
				
				<button class="local-slide-btn local-back"><img src="${pageContext.request.contextPath}/resources/img/slide-back-btn.png" alt="" ></button>
                <button class="local-slide-btn local-next"><img src="${pageContext.request.contextPath}/resources/img/slide-next-btn.png" alt=""></button>

				<div class="route-box">
                    <div class="title-text"><span class="local-name">전체,</span> 인기루트</div>
                    <div class="route-text"><a href="#">더보기</a></div>
                    <div class="route-items">                        
                        <div class="route-item route-item01">
                            <a href="#"> <!-- 루트 상세 페이지 -->
                                <div class="route-img-box">
                                    <img class="route-img" src="https://via.placeholder.com/250x250.jpg" alt="">
                                </div>
                                <div class="route-top-info">
                                    <div class="likes-info">
                                        <div class="like-icon"><img src="https://via.placeholder.com/25x25.jpg" alt=""></div>
                                        <div class="like-int">3,180</div>
                                    </div>
                                    <div class="user-info">
                                        <div class="user-name">뽀대왕자님</div>
                                        <div class="check-icon"><img src="https://via.placeholder.com/25x25.jpg" alt=""></div>
                                    </div>
                                <!-- 잠금 아이콘도 여기 넣기 -->
                                </div>
                         <div class="route-title">
                                    <div class="local-box">경기</div>
                                           <div class="route-name-box">
                                        <div class="route-name">가평 유럽마을 당일치기 일정</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="route-item route-item02">
                            <a href="#"> <!-- 루트 상세 페이지 -->
                                <div class="route-img-box">
                                    <img class="route-img" src="https://via.placeholder.com/250x250.jpg" alt="">
                                </div>
                                <div class="route-top-info">
                                    <div class="likes-info">
                                        <div class="like-icon"><img src="https://via.placeholder.com/25x25.jpg" alt=""></div>
                                        <div class="like-int">3,180</div>
                                    </div>
                                    <div class="user-info">
                                        <div class="user-name">뽀대왕자님</div>
                                        <div class="check-icon"><img src="https://via.placeholder.com/25x25.jpg" alt=""></div>
                                    </div>
                                <!-- 잠금 아이콘도 여기 넣기 -->
                                </div>
                                <div class="route-title">
                                    <div class="local-box">경기</div>
                                    <div class="route-name-box">
                                        <div class="route-name">부천 맛집만 쏙쏙 다녀오는 2박 3일 일정</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="route-item route-item03">
                            <a href="#"> <!-- 루트 상세 페이지 -->
                                <div class="route-img-box">
                                    <img class="route-img" src="https://via.placeholder.com/250x250.jpg" alt="">
                                </div>
                                <div class="route-top-info">
                                    <div class="likes-info">
                                        <div class="like-icon"><img src="https://via.placeholder.com/25x25.jpg" alt=""></div>
                                        <div class="like-int">3,180</div>
                                    </div>
                                    <div class="user-info">
                                        <div class="user-name">뽀대왕자님</div>
                                        <div class="check-icon"><img src="https://via.placeholder.com/25x25.jpg" alt=""></div>
                                    </div>
                                <!-- 잠금 아이콘도 여기 넣기 -->
                                </div>
                                <div class="route-title">
                                    <div class="local-box">경기</div>
                                    <div class="route-name-box">
                                        <div class="route-name">부평 술집거리 3박 4일 탐험</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="route-item route-item04">
                            <a href="#"> <!-- 루트 상세 페이지 -->
                                <div class="route-img-box">
                                    <img class="route-img" src="https://via.placeholder.com/250x250.jpg" alt="">
                                </div>
                                <div class="route-top-info">
                                    <div class="likes-info">
                                        <div class="like-icon"><img src="https://via.placeholder.com/25x25.jpg" alt=""></div>
                                        <div class="like-int">3,180</div>
                                    </div>
                                    <div class="user-info">
                                        <div class="user-name">뽀대왕자님</div>
                                        <div class="check-icon"><img src="https://via.placeholder.com/25x25.jpg" alt=""></div>
                                    </div>
                                <!-- 잠금 아이콘도 여기 넣기 -->
                                </div>
                                <div class="route-title">
                                    <div class="local-box">경기</div>
                                    <div class="route-name-box">
                                        <div class="route-name">제주도 오름 위주 5박 6일 일정</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <hr class="section-hr">
                </div>
                
				<div class="tour-box">
					<div class="title-text">
						<span class="local-name">전체,</span> 인기 관광지
					</div>
					<div class="see-text tour-text">
						<a href="#" class="load-more-btn" data-type="tour">더보기</a>
					</div>
					<div class="tour-container" id="tourContainer">
						<!-- 관광 정보 -->
					</div>
				</div>
			</div>
		</section>

		<div class="event-box">
			<div class="title-text">축제·행사</div>
			<div class="calendar">
				<hr>
				<div class="month-box">
					<div class="calendar-year">2024</div>
					<div class="month month-1" data-month="01">1월</div>
					<div class="month month-2" data-month="02">2월</div>
					<div class="month month-3" data-month="03">3월</div>
					<div class="month month-4" data-month="04">4월</div>
					<div class="month month-5" data-month="05">5월</div>
					<div class="month month-6" data-month="06">6월</div>
					<div class="month month-7" data-month="07">7월</div>
					<div class="month month-8" data-month="08">8월</div>
					<div class="month month-9" data-month="09">9월</div>
					<div class="month month-10" data-month="01">10월</div>
					<div class="month month-11" data-month="11">11월</div>
					<div class="month month-12" data-month="12">12월</div>
				</div>
			</div>
			<div class="event-text">
				<a href="#" class="load-more-btn" data-type="event">더보기</a>
			</div> 	
			<div class="event-container" id="eventContainer">
				<!-- 행사 정보 -->
			</div>
		</div>
		
		<!-- footer -->
        <footer>
            <div class="footer-container">
                <div class="footer-img">
                    <div class="wave"></div>
                    <div class="wave"></div>
                </div>
                <div class="footer-text-box">
                    <div class="footer-text">
                        <div class="footer-text01">
                            <img src="${pageContext.request.contextPath}/resources/img/logo2.png" alt="logo-icon">  
                        </div>
                        <div class="footer-text02">
                            <div class="page-info">
                                <span><strong>주소 l</strong> 서울시 서울구 서울로 777-77 서울타워 7층</span>
                                <span><strong>TEL l</strong> 02-123-4567</span>
                                <span><strong>FAX l</strong> 02-849-8462</span>
                            </div>
                        </div>
                        <div class="footer-text03">
                            <div class="copyright-info">
                                <span><img src="${pageContext.request.contextPath}/resources/img/footer-img.png" alt=""></span>
                                <span><img src="${pageContext.request.contextPath}/resources/img/footer-img01.png" alt=""></span>
                            </div>
                        </div>
                        <div class="footer-text04">
                            <div class="footer-social-icons footer-social-ins">
                                <img src="${pageContext.request.contextPath}/resources/img/footer-social-ins.png" alt="">
                            </div>
                            <div class="footer-social-icons footer-social-fb">
                                <img src="${pageContext.request.contextPath}/resources/img/footer-social-fb.png" alt="">
                            </div>
                            <div class="footer-social-icons footer-social-ytb">
                                <img src="${pageContext.request.contextPath}/resources/img/footer-social-ytb.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
	</div>

<script>
    $(document).ready(function() {
        function fetchData() {
            // Fetch event data
            $.ajax({
                url: "${pageContext.request.contextPath}/ajax/eventlist",
                type: "GET",
                success: function(data) {
                    updateEventList(data);
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching event list:", error);
                }
            });
            // Fetch tourism data
            $.ajax({
                url: "${pageContext.request.contextPath}/ajax/tourlist",
                type: "GET",
                success: function(data) {
                    updateTourList(data);
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching tour list:", error);
                }
            });
        }

        // Fetch initial data on page load
        fetchData();

        // Click handler for area selection
        $(".area").click(function() {
            var selectedArea = $(this).data("area");
            $.ajax({
                url: "${pageContext.request.contextPath}/ajax/tourlist",
                type: "GET",
                data: {
                    area: selectedArea
                },
                success: function(data) {
                    updateTourList(data);
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching tour list:", error);
                }
            });
        });

        // Click handler for month selection
        $(".month").click(function() {
            var selectedMonth = $(this).data("month");
            var selectedYear = new Date().getFullYear();
            $.ajax({
                url: "${pageContext.request.contextPath}/ajax/eventlist",
                type: "GET",
                data: {
                    year: selectedYear,
                    month: selectedMonth
                },
                success: function(data) {
                    updateEventList(data);
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching event list:", error);
                }
            });
        });

        function processAddress(addr1) {
            if (addr1.startsWith('경상') || addr1.startsWith('전라') || addr1.startsWith('충청')) {
                return addr1.substring(0, 1) + addr1.substring(2, 3);
            }
            return addr1.substring(0, 2);
        }

        // Function to update tourism section
        function updateTourList(data) {
            $("#tourContainer").empty();
            $.each(data, function(i, item) {
                var processedAddr = processAddress(item.addr1);
                var tourItem = '<div class="tour-item content" data-contentid="' + item.contentid + '" data-contenttypeid="' + item.contenttypeid + '">' +
                                   '<div class="tour-img">' +
                                       '<img src="' + item.firstimage + '" alt="' + item.title + '">' +
                                   '</div>' +
                                   '<div class="tour-info">' +
                                       '<div class="local-box">' +
                                           processedAddr +
                                       '</div>' +
                                       '<div class="tour-name">' + item.title + '</div>' +
                                   '</div>' +
                               '</div>';
                $("#tourContainer").append(tourItem);
            });
        }

        // Function to update event section
        function updateEventList(data) {
            $("#eventContainer").empty();
            $.each(data, function(i, item) {
                var processedAddr = processAddress(item.addr1);
                var eventItem = '<div class="event-item content" data-contentid="' + item.contentid + '" data-contenttypeid="' + item.contenttypeid + '">' +
                                   '<div class="event-img">' +
                                       '<img src="' + item.firstimage + '" alt="' + item.title + '">' +
                                   '</div>' +
                                   '<div class="event-info">' +
                                       '<div class="local-box">' +
                                           processedAddr +
                                       '</div>' +
                                       '<div class="event-name">' + item.title + '</div>' +
                                   '</div>' +
                               '</div>';
                $("#eventContainer").append(eventItem);
            });
        }

        // Handler for load more button
        $(".load-more-btn").click(function() {
            var type = $(this).data("type");
            var url = type === "tour" ? "${pageContext.request.contextPath}/tourlist" : "${pageContext.request.contextPath}/eventlist";
            window.location.href = url;
        });

        // Handler for content click (assuming delegation due to dynamic content)
        $(document).on("click", ".content", function() {
            var contentId = $(this).data("contentid");
            var contentTypeId = $(this).data("contenttypeid");
            var url = "";

            if ($(this).hasClass("tour-item")) {
                url = "${pageContext.request.contextPath}//tourInfo?contentId=" + contentId + "&contentTypeId=" + contentTypeId;
            } else if ($(this).hasClass("event-item")) {
                url = "${pageContext.request.contextPath}//eventInfo?contentId=" + contentId + "&contentTypeId=" + contentTypeId;
            }

            window.location.href = url;
        });

        // Automatically select previously selected month and area
        var selectedMonth = "${selectedMonth}";
        var selectedArea = "${selectedArea}";
        $(".month[data-month='" + selectedMonth + "']").addClass("selected");
        $(".area[data-area='" + selectedArea + "']").addClass("selected");
    });
</script>


</body>
</html>