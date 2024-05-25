<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="nav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Document</title>
    <!-- reset.css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" >

    <!-- index.css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css" >

    <!-- index.js -->
    <script defer src="${pageContext.request.contextPath}/resources/js/home.js"></script>
</head>
<body>
    <div class="wrap">
      
        <!-- header --> 
        <header>
            <div class="header-container">
                <div class="header-text-box">
                    <div class="header-text01">국내여행,<br>경로를 공유하는 당신</div>
                    <div class="header-text02">경로당</div>
                </div>
            </div>
        </header>

        <!-- section-01 -->
        <section>
            <div class="section-container">
                <div class="section-slide">
                    <div class="section-slide-items">
                        <div class="slide-item slide-item01" id="#"> <!-- id는 지역명으로 -->
                            <img src="https://via.placeholder.com/80x80.jpg" alt="">
                            <div>전체</div>
                        </div>
                        <div class="slide-item slide-item02">
                            <img src="https://via.placeholder.com/80x80.jpg" alt="">
                            <div>서울</div>
                        </div>
                        <div class="slide-item slide-item03">
                            <img src="https://via.placeholder.com/80x80.jpg" alt="">
                            <div>인천</div>
                        </div>
                        <div class="slide-item slide-item04">
                            <img src="https://via.placeholder.com/80x80.jpg" alt="">
                            <div>대전</div>
                        </div>
                        <div class="slide-item slide-item05">
                            <img src="https://via.placeholder.com/80x80.jpg" alt="">
                            <div>대구</div>
                        </div>
                        <div class="slide-item slide-item06">
                            <img src="https://via.placeholder.com/80x80.jpg" alt="">
                            <div>경기</div>
                        </div>
                        <div class="slide-item slide-item07">
                            <img src="https://via.placeholder.com/80x80.jpg" alt="">
                            <div>부산</div>
                        </div>
                        <div class="slide-item slide-item08">
                            <img src="https://via.placeholder.com/80x80.jpg" alt="">
                            <div>울산</div>
                        </div>
                        <div class="slide-item slide-item09">
                            <img src="https://via.placeholder.com/80x80.jpg" alt="">
                            <div>광주</div>
                        </div>
                        <div class="slide-item slide-item10">
                            <img src="https://via.placeholder.com/80x80.jpg" alt="">
                            <div>강원</div>
                        </div>
                        <div class="slide-item slide-item11">
                            <img src="https://via.placeholder.com/80x80.jpg" alt="">
                            <div>충북</div>
                        </div>
                        <div class="slide-item slide-item12">
                            <img src="https://via.placeholder.com/80x80.jpg" alt="">
                            <div>충남</div>
                        </div>
                        <div class="slide-item slide-item13">
                            <img src="https://via.placeholder.com/80x80.jpg" alt="">
                            <div>경북</div>
                        </div>
                        <div class="slide-item slide-item14">
                            <img src="https://via.placeholder.com/80x80.jpg" alt="">
                            <div>경남</div>
                        </div>
                        <div class="slide-item slide-item15">
                            <img src="https://via.placeholder.com/80x80.jpg" alt="">
                            <div>전북</div>
                        </div>
                        <div class="slide-item slide-item16">
                            <img src="https://via.placeholder.com/80x80.jpg" alt="">
                            <div>전남</div>
                        </div>
                        <div class="slide-item slide-item17">
                            <img src="https://via.placeholder.com/80x80.jpg" alt="">
                            <div>제주</div>
                        </div>
                        <div class="slide-item slide-item">
                            <img src="https://via.placeholder.com/80x80.jpg" alt="">
                            <div>세종</div>
                        </div>
                    </div>
                </div>
                <button class="local-slide-btn local-back"><img src="${pageContext.request.contextPath}/resources/img/slide-back-btn.png" alt="" ></button>
                <button class="local-slide-btn local-next"><img src="${pageContext.request.contextPath}/resources/img/slide-next-btn.png" alt=""></button>
                
                <div class="route-box">
                    <div class="title-text"><span class="local-name">전체,</span> 인기루트</div>
                    <div class="see-text route-text"><a href="#">더보기</a></div>
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
                    <div class="title-text"><span class="local-name">전체,</span> 인기루트</div>
                    <div class="see-text tour-text"><a href="#">더보기</a></div>
                    <div class="tour-container">
                        <div class="tour-item">
                            <div class="tour-img">
                                <img src="https://via.placeholder.com/350x210.jpg" alt="">
                            </div>
                            <div class="tour-info">
                                <div class="local-box">경기</div>
                                <div class="tour-name">낙원동 포장마차거리</div>
                            </div>
                        </div>
                        <div class="tour-item">
                            <div class="tour-img">
                                <img src="https://via.placeholder.com/350x210.jpg" alt="">
                            </div>
                            <div class="tour-info">
                                <div class="local-box">경기</div>
                                <div class="tour-name">낙원동 포장마차거리</div>
                            </div>
                        </div>
                        <div class="tour-item">
                            <div class="tour-img">
                                <img src="https://via.placeholder.com/350x210.jpg" alt="">
                            </div>
                            <div class="tour-info">
                                <div class="local-box">경기</div>
                                <div class="tour-name">낙원동 포장마차거리</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="festival-box">
            <div class="title-text">축제·행사</div>
            <div class="calendar">
                <hr>
                <div class="month-box">
                    <div class="calendar-year">2024</div>
                    <div class="month month-1" id="month-1">1월</div>
                    <div class="month month-2" id="month-2">2월</div>
                    <div class="month month-3" id="month-3">3월</div>
                    <div class="month month-4" id="month-4">4월</div>
                    <div class="month month-5" id="month-5">5월</div>
                    <div class="month month-6" id="month-6">6월</div>
                    <div class="month month-7" id="month-7">7월</div>
                    <div class="month month-8" id="month-8">8월</div>
                    <div class="month month-9" id="month-9">9월</div>
                    <div class="month month-10" id="month-10">10월</div>
                    <div class="month month-11" id="month-11">11월</div>
                    <div class="month month-12" id="month-12">12월</div>
                </div>
            </div>
            <div class="festival-content">
                <div class="section_02-item">
                    <a href="#">
                        <img src="https://via.placeholder.com/300x400.jpg" alt=""> <!-- ajax -->
                    </a>
                </div>
                <div class="festival-item">
                    <a href="#">
                        <img src="https://via.placeholder.com/300x400.jpg" alt=""> <!-- ajax -->
                    </a>
                </div>
                <div class="festival-item">
                    <a href="#">
                        <img src="https://via.placeholder.com/300x400.jpg" alt=""> <!-- ajax -->
                    </a>
                </div>
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
                            <img src="https://via.placeholder.com/150x50.jpg" alt="logo-icon">  
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
                                <span><img src="https://via.placeholder.com/100x50.jpg" alt=""></span>
                                <span><img src="https://via.placeholder.com/100x50.jpg" alt=""></span>
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
</body>
</html>
