<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
=======
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
>>>>>>> cdca20d2d50a0bbc97931e8ca14ffa0c61f76286
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>행사/축제</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/eventlist.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
<<<<<<< HEAD
.filter-keep-btn:hover,
.filter-keep-btn.hovered {
    color: white;
    background-color: #E78181;
}
.filter-keep-btn.clicked {
    color: white;
    background-color: #E78181;
=======
.container {
   width: 1100px;
   height: 1440px;
   margin: 75px auto;
   display: flex;
   justify-content: space-between;
}

.side-container {
   position: relative;
   width: 210px;
   margin-top: 90px;
   height: 1440px;
}

.side {
   position: -webkit-sticky; /* 사파리를 위한 코드 */
   position: sticky;
   top: 100px;
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

.local-box, .month-box {
   margin: 10px auto;
   width: 98%;
   display: flex;
   flex-wrap: wrap;
   justify-content: space-between;
}

.area, .month {
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
>>>>>>> cdca20d2d50a0bbc97931e8ca14ffa0c61f76286
}
</style>
</head>
<body>
<div class="wrap">
<<<<<<< HEAD
    <%@ include file="../nav.jsp"%>
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
                <div class="side-name">월</div>
                <div class="month-box">
                    <div class="month filter-keep-btn" data-month="01">1월</div>
                    <div class="month filter-keep-btn" data-month="02">2월</div>
                    <div class="month filter-keep-btn" data-month="03">3월</div>
                    <div class="month filter-keep-btn" data-month="04">4월</div>
                    <div class="month filter-keep-btn" data-month="05">5월</div>
                    <div class="month filter-keep-btn" data-month="06">6월</div>
                    <div class="month filter-keep-btn" data-month="07">7월</div>
                    <div class="month filter-keep-btn" data-month="08">8월</div>
                    <div class="month filter-keep-btn" data-month="09">9월</div>
                    <div class="month filter-keep-btn" data-month="10">10월</div>
                    <div class="month filter-keep-btn" data-month="11">11월</div>
                    <div class="month filter-keep-btn" data-month="12">12월</div>
                </div>
                <div class="filter-btn-box">
                    <div class="filter-reset-btn filter-keep-btn" id="resetBtn">초기화</div>
                </div>
            </div>
        </div>
        <div class="section">
            <div class="section-name">
                # 행사/축제
                <hr>
            </div>
            <div class="content-box">
                <c:forEach var="item" items="${eventList}">
                    <div class="content" data-contentid="${item.contentid}" data-contenttypeid="${item.contenttypeid}">
                        <div class="content-img">
                            <img src="${item.firstimage}">
                        </div>
                        <div class="content-info">
                            <div class="info-name">${item.title}</div>
                            <div class="info-local">${item.addr1}</div>
                            <div class="info-local">${item.eventstartdate} ~ ${item.eventenddate}</div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="more-btn-box">
                <div class="more-btn" id="eventMoreBtn">다음페이지</div>
            </div>
        </div>
    </div>
    <%@ include file="../footer-sub.jsp"%>
=======
   <!-- nav -->
   <%@ include file="../nav.jsp"%>
   
   <div class="container">
      <div class="side-container">
         <div class="side" id="sideElement">
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
            <div class="filter-btn-box">
               <div class="filter-reset-btn" id="resetBtn">초기화</div>
               <!-- 보류 -->
            </div>
         </div>
      </div>

      <div class="section">
         <div class="section-name">
            # 행사/축제
            <hr>
         </div>
         <div class="content-box">

            <c:forEach var="item" items="${eventList}">
               <div class="content" data-contentid="${item.contentid}"
                  data-contenttypeid="${item.contenttypeid}">
                  <div class="content-img">
                     <img src="${item.firstimage}">
                  </div>
                  <div class="content-info">
                     <div class="info-name">${item.title}</div>
                     <div class="info-local">${item.addr1}</div>
                     <div class="info-local">${item.eventstartdate} ~ ${item.eventenddate}</div>
                  </div>
               </div>
            </c:forEach>
         </div>
         <div class="more-btn-box">
               <div class="more-btn" id="eventMoreBtn">다음페이지</div>
            </div>
      </div>
   </div>
   
   <!-- footer -->
   <%@ include file="../footer-sub.jsp"%>
>>>>>>> cdca20d2d50a0bbc97931e8ca14ffa0c61f76286
</div>
<script>
$(document).ready(function() {
    // 페이지 로드 시 저장된 클릭 상태 복구
    var clickedArea = localStorage.getItem("clickedArea");
    var clickedMonth = localStorage.getItem("clickedMonth");

<<<<<<< HEAD
    if (clickedArea) {
        $(".filter-keep-btn").removeClass("clicked");
        $(".filter-keep-btn[data-area='" + clickedArea + "']").addClass("clicked");
    }
=======
   <script>
   $(document).ready(function() {
        // 더보기 버튼 클릭 이벤트 핸들러
        $("#eventMoreBtn").click(function() {
            // 현재 페이지 번호를 가져오기
            var currentPage = parseInt("${currentPage}");
            // 다음 페이지 번호 계산
            var nextPage = currentPage + 1;
            // 페이지 이동
            window.location.href = "${pageContext.request.contextPath}/eventlist?pageNo=" + nextPage;
        });
    });
    
    var localBtns = document.querySelectorAll('.local');
    var monthBtns = document.querySelectorAll('.month');
    var resetBtn = document.querySelector('.filter-reset-btn');
>>>>>>> cdca20d2d50a0bbc97931e8ca14ffa0c61f76286

    if (clickedMonth) {
        $(".filter-keep-btn").removeClass("clicked");
        $(".filter-keep-btn[data-month='" + clickedMonth + "']").addClass("clicked");
    }

    // filter-keep-btn에 대한 클릭 이벤트 핸들러
    $(".filter-keep-btn").click(function() {
        // 이전에 선택된 버튼의 스타일 제거
        $(".filter-keep-btn").removeClass("clicked");

        // 클릭한 버튼에 스타일 추가
        $(this).addClass("clicked");

        // localStorage에 클릭한 버튼 저장
        var clickedArea = $(this).data("area");
        var clickedMonth = $(this).data("month");

        if (clickedArea) {
            localStorage.setItem("clickedArea", clickedArea);
            localStorage.removeItem("clickedMonth");
        }

        if (clickedMonth) {
            localStorage.setItem("clickedMonth", clickedMonth);
            localStorage.removeItem("clickedArea");
        }
    });

    // 초기화 버튼 클릭 이벤트 핸들러
    $("#resetBtn").click(function() {
        $(".filter-keep-btn").removeClass("clicked");
        localStorage.removeItem("clickedArea");
        localStorage.removeItem("clickedMonth");
        window.location.href = "${pageContext.request.contextPath}/eventlist";
    });
<<<<<<< HEAD

    // 이벤트 목록 클릭 시 상세 페이지로 이동
    $(".content").click(function() {
        var contentId = $(this).data("contentid");
        var contentTypeId = $(this).data("contenttypeid");
        window.location.href = "${pageContext.request.contextPath}/eventlist/eventInfo?contentId=" + contentId + "&contentTypeId=" + contentTypeId;
    });

    // 더보기 버튼 클릭 이벤트 핸들러
    $("#eventMoreBtn").click(function() {
        var currentPage = parseInt("${currentPage}");
        var nextPage = currentPage + 1;
        window.location.href = "${pageContext.request.contextPath}/eventlist?pageNo=" + nextPage;
    });

    // 페이지 로드 시 선택된 월 및 지역에 스타일 적용
    var selectedMonth = "${selectedMonth}";
    var selectedArea = "${selectedArea}";
    $(".filter-keep-btn").removeClass("clicked");
    $(".filter-keep-btn[data-month='" + selectedMonth + "']").addClass("clicked");
    $(".filter-keep-btn[data-area='" + selectedArea + "']").addClass("clicked");

    // 클릭 이벤트 핸들러 등록
    $(".month, .area").click(function() {
        var selectedYear = new Date().getFullYear();
        var selectedMonth = $(this).data("month") || "";
        var selectedArea = $(this).data("area") || "";
        window.location.href = "${pageContext.request.contextPath}/eventlist?year=" + selectedYear + "&month=" + selectedMonth + "&area=" + selectedArea;
    });
});
</script>
=======
   </script>
>>>>>>> cdca20d2d50a0bbc97931e8ca14ffa0c61f76286
</body>
</html>
