<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>route</title>
    
    <!-- reset.css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" >
    
    <!-- style -->
    <style>
      .container {
         width: 1100px;
         height: 1440px;
         margin: 75px auto;
         display: flex;
         justify-content: space-between;
        }
        
        /***********
        *** side ***
        ***********/
        .side-container {
            position: relative;
            width: 210px;
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
            border-bottom: 1.5px solid black;
            padding-bottom: 3px;
        }
        .local-box, .theme-box, .tourdays-box {
            margin: 10px auto 25px auto;
            width: 98%;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .local, .theme, .tourdays {
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
        .tourdays {
            width: 55px;
            height: 25px;
            line-height: 25px;
        }
        #tourdays-4, #tourdays-5 {
            width: 75px;
        }
        
        /***********
        ** section**
        ***********/
        .section {
            position: relative;
            width: 850px
        }
        .section-name {
            font-size: 24px;
            font-weight: bold;
        }
        .section-name hr {
            margin: 10px 0 50px 0;
            color: black;
        }
        .route-table {
            margin: 50px auto;
            background-color: #F9F9F9;
            width: 800px;
            height: 220px;
            margin-bottom: 15px;
            
            border-collapse: separate;
         border-spacing: 0 20px;
        }
        .route-content {
           margin-bottom: 15px;
        }
        .route-img {
            /* 가운데정렬 */
            width: 330px;
            height: 220px;
        }
        .route-img img {
            max-width: 100%;
            height: auto;
        }
        .route-info {
            position: relative;
        }
        .info-01, .info-03, .user-info {
            display: flex;
        }
        .route-info > div {
            position: absolute;
            left: 10px;
            width: 450px;
        }
        .info-01 {
            top: 10px;
        }
        .route-name {
            font-size: 18px;
            font-weight: bold;
        }
        .info-02 {
            top: 40px;
            font-size: 12px;
        }
        .route-tag {
            font-weight: bold;
            color: #7b7b7b;
        }
        .route-content {
            padding-top: 20px;
        }
        .info-03 {
            font-size: 14px;
            height: 25px;
            bottom: 10px;
            line-height: -10px;
        }
        .likes-info {
            display: flex;
            color: #E78181;
        }
        .like-icon {
            margin-right: 5px;
        }
        .views-icon {
            margin-left: 10px;
        }
        .user-info {
            position: absolute;
            right: 0;
        }
        .user-name {
            font-size: 16px;
            font-weight: bold;
        }
        .check-icon {
            margin-left: 2px;
        }
        .local-icon {
            display: flex;
            justify-content: center;
            padding-bottom: 2px;
            margin: 2px 5px 0 0;

            width: 50px;
            height: 20px;
            border-radius: 5px;

            background-color: #C5C5C5;
            color: #5c5c5c;
            font-weight: bold;
        }
        .route-info {
            width: 470px;
            height: 220px;
        }
        .info-01, .info-03, .user-info {
            display: flex;
        }
        
        .search_form {
         width: 600px;
         /* background-color: aqua; */
         text-align: center;
         padding: 20px;
         margin: 0 auto;
      }
      .section-name hr {
          height: 2px;
            background: black;
        }
      
      .search-form-inner {
         display: flex;
      }
      
      .search_form select {
         width: 100px;
         height: 30px;
         border-radius: 5px;
         margin-right: 5px;
      }
      
      .search_form input {
         width: 400px;
         height: 30px;
         text-indent: 10px;
         outline: none;
         border-radius: 5px;
         margin-right: 5px;
         border: 1px solid black;
      }
      
      .search_form button {
         width: 50px;
         height: 30px;
         border-radius: 5px;
         border: 1px solid black;
      }
      .write-link {
         float: right;
         border: 1.3px solid rgb(97, 97, 97);
         border-radius: 5px;
         /* background-color: rgb(206, 206, 206); */
         padding: 3px 8px 3px 8px;
         margin-bottom: 10px;
         color: black;
         font-size: 10pt;
         margin-right: 10px;
      }
      .route-tr {
         margin-bottom: 15px;
      }
    </style>
</head>
<body>
    <div class="wrap">
    
        <!-- nav -->
        <%@ include file="../nav.jsp" %>
        
        <!-- container -->
        <div class="container">
           <!-- 사이드 네비 -->
            <div class="side-container">
                <div class="side">

                    <div class="side-name">지역</div>
                    <div class="local-box">
                    	<div class="local" id="local0">서울</div>
                        <div class="local" id="local1">인천</div>
                        <div class="local" id="local2">대전</div>
                        <div class="local" id="local3">대구</div>
                        <div class="local" id="local4">경기</div>
                        <div class="local" id="local5">부산</div>
                        <div class="local" id="local6">울산</div>
                        <div class="local" id="local7">광주</div>
                        <div class="local" id="local8">강원</div>
                        <div class="local" id="local9">충북</div>
                        <div class="local" id="local10">충남</div>
                        <div class="local" id="local11">경북</div>
                        <div class="local" id="local12">경남</div>
                        <div class="local" id="local13">전북</div>
                        <div class="local" id="local14">전남</div>
                        <div class="local" id="local15">제주</div>
                        <div class="local" id="local16">세종</div>
                    </div>

                    <div class="side-name">테마</div>
                    <div class="theme-box">
                    	<div class="theme" id="theme1">#나홀로 힐링</div>
                        <div class="theme" id="theme2">#연인과 데이트</div>
                        <div class="theme" id="theme3">#친구들과</div>
                        <div class="theme" id="theme4">#가족 나들이</div>
                        <div class="theme" id="theme5">#모임 단체 여행</div>
                    </div>
                    
                    <div class="side-name">기간</div>
                    <div class="tourdays-box">
                        <div class="tourdays" id="tourdays1">당일</div>
                        <div class="tourdays" id="tourdays2">2~4일</div>
                        <div class="tourdays" id="tourdays3">5~9일</div>
                        <div class="tourdays" id="tourdays4">10~19일</div>
                        <div class="tourdays" id="tourdays5">20일 이상</div>
                    </div>

                    <div class="filter-btn-box">
                    <div class="filter-reset-btn" id="searchBtn">
                            검색
                        </div>
                        <div class="filter-reset-btn" id="resetBtn">
                            초기화
                        </div>
                        
                        <!-- 보류 -->
                    </div>
                    
                </div>
            </div>
        
           <!-- 루트 목록 -->
           <div class="section">
              <div class="section-name">
                  경로 게시판
                  <hr>
              </div>
            <a class="write-link" href="/project/board/route/create">글쓰기</a>
            <table class="route-table">
                <c:forEach var="list" items="${routeBoardList}" varStatus="status">
                <span id="cif"></span>
					<tr>
						<td class="route-info">
							<div class="route-img">
								<img src="https://via.placeholder.com/330x220.jpg" alt="">
							</div>
			                <div>
			                	<div class="info-01">
			                		<div class="local-icon">
			                			<c:choose>
			                				<c:when test="${list.boardRegion == 0}">서울</c:when>
			                				<c:when test="${list.boardRegion == 1}">인천</c:when>
			                				<c:when test="${list.boardRegion == 2}">대전</c:when>
			                				<c:when test="${list.boardRegion == 3}">대구</c:when>
			                				<c:when test="${list.boardRegion == 4}">경기</c:when>
			                				<c:when test="${list.boardRegion == 5}">부산</c:when>
			                				<c:when test="${list.boardRegion == 6}">울산</c:when>
			                				<c:when test="${list.boardRegion == 7}">광주</c:when>
			                				<c:when test="${list.boardRegion == 8}">강원</c:when>
			                				<c:when test="${list.boardRegion == 9}">충북</c:when>
			                				<c:when test="${list.boardRegion == 10}">충남</c:when>
			                				<c:when test="${list.boardRegion == 11}">경북</c:when>
			                				<c:when test="${list.boardRegion == 12}">경남</c:when>
			                				<c:when test="${list.boardRegion == 13}">전북</c:when>
			                				<c:when test="${list.boardRegion == 14}">전남</c:when>
			                				<c:when test="${list.boardRegion == 15}">제주</c:when>
			                				<c:when test="${list.boardRegion == 16}">세종</c:when>
			                			</c:choose>
			                		</div>
			                		<div class="route-name">
			                			<a href="${pageContext.request.contextPath}/board/route/${list.boardCode}">${list.boardTitle}</a>
			                		</div>
			                	</div>
				                <div class="info-02">
				                	<div class="route-tag">
				                		<span>${list.boardTourdays}일 여행</span>
				                		<span>
				                			<c:choose>
				                				<c:when test="${list.boardTheme == 1}">#나홀로 힐링</c:when>
				                				<c:when test="${list.boardTheme == 2}">#연인과 데이트</c:when>
				                				<c:when test="${list.boardTheme == 3}">#친구들과</c:when>
				                				<c:when test="${list.boardTheme == 4}">#가족 나들이</c:when>
				                				<c:when test="${list.boardTheme == 5}">#모임 단체 여행</c:when>
				                			</c:choose>
				                		</span>
				                	</div>
				                	<div class="route-content">
				                		${list.boardTitle} 
				                	</div>
				                	
				                	<!-- 날짜 임의 작성 -->
				                	<div class="route-writeDate">
				                		${list.boardWritedate} 
				                	</div>
				                </div>
				                <div class="info-03">
				                	<div class="likes-info">
				                		<div class="like-icon"><img src="https://via.placeholder.com/25x25.jpg" alt=""></div>
				                		<!-- <span class="like-int">3,180</span> -->
				                		<div class="views-icon">views</div>
				                		<span class="views-int">${list.boardViews}</span>
				                	</div>
				                	<div class="user-info">
				                		<div class="user-name">${list.nickname}</div>
				                		<div class="check-icon"><img src="https://via.placeholder.com/25x25.jpg" alt=""></div>
				                	</div>
				                </div>
				            </div>
				        </td>
				    </tr>
				    <span id="/cif"></span>
                </c:forEach>
            <tr></tr> <!-- 이거 지우면 저 울어요 -종범- -->
            </table>
            
            
            		<div class="page_number"> <!-- page_number -->
                    <<div class="paging">
					    <c:if test="${empty search.condition}">
					        <c:if test="${paging.currentGrp > 1}">
					            <a href="/project/board/route?page=${paging.grpStartPage - 1}&region=${param.region}&theme=${param.theme}&tourdays=${tourdays}">이전</a>
					        </c:if>
					        <c:forEach var="i" begin="${paging.grpStartPage}" end="${paging.grpEndPage}">
					            <a class="paging_i" href="/project/board/route?page=${i}&region=${param.region}&theme=${param.theme}&tourdays=${tourdays}">${i}</a>
					        </c:forEach>
					        <c:if test="${paging.grpEndPage < paging.totalPage}">
					            <a href="/project/board/route?page=${paging.grpEndPage + 1}&region=${param.region}&theme=${param.theme}&tourdays=${tourdays}">다음</a>
					        </c:if>
					    </c:if>
					    <c:if test="${not empty search.condition}">
					        <c:if test="${paging.currentGrp > 1}">
					            <a href="/project/board/route/search?page=${paging.grpStartPage - 1}&condition=${search.condition}&keyword=${search.keyword}&start=${search.start}">이전</a>
					        </c:if>
					        <c:forEach var="i" begin="${paging.grpStartPage}" end="${paging.grpEndPage}">
					            <a class="paging_i" href="/project/board/route/search?page=${i}&condition=${search.condition}&keyword=${search.keyword}&start=${search.start}">${i}</a>
					        </c:forEach>
					        <c:if test="${paging.grpEndPage < paging.totalPage}">
					            <a href="/project/board/route/search?page=${paging.grpEndPage + 1}&condition=${search.condition}&keyword=${search.keyword}&start=${search.start}">다음</a>
					        </c:if>
					    </c:if>
					</div>

                </div>
              <div class="search_form">
                    <form action="/project/board/route/search" method="get" class="search-form-inner" onsubmit="return searchCheck()">
                        <select name="condition">
                            <option value="">선택하시오</option>
                            <option value="writer">작성자</option>
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                        </select>
                        <input type="text" name="keyword">
                        <input type="hidden" name="start" value="1">
                        <div><button>검색</button></div>
                    </form>
                </div>
           </div>
       </div>
       
       
       
       
       
       <!-- footer -->
      <%@ include file="../footer-sub.jsp" %>
   </div>
   
    <!-- script -->
    <script>
    var localBtns = document.querySelectorAll('.local');
    var themeBtns = document.querySelectorAll('.theme');
    var tourdaysBtns = document.querySelectorAll('.tourdays');
    var resetBtn = document.querySelector('#resetBtn');
    var searchBtn = document.querySelector('#searchBtn');

    var selectedRegion = null;
    var selectedTheme = null;
    var selectedTourdays = null;

    var previousLocalBtn = null;
    var previousthemeBtn = null;
    var previoustourdaysBtn = null;
    
    
    function localBtnEvent() {
        this.classList.add('clickEvent');
        selectedRegion = this.id.replace('local', '');
        if (previousLocalBtn && previousLocalBtn !== this) {
            previousLocalBtn.classList.remove('clickEvent');
        }

        previousLocalBtn = this;

    }

    function themeBtnEvent() {
        this.classList.add('clickEvent');
        selectedTheme = this.id.replace('theme', ''); 
        if (previousthemeBtn && previousthemeBtn !== this) {
        	previousthemeBtn.classList.remove('clickEvent');
        }

        previousthemeBtn = this;
    }

    function tourdaysBtnEvent() {
        this.classList.add('clickEvent');
        selectedTourdays = this.id.replace('tourdays', '');
        if (previoustourdaysBtn && previoustourdaysBtn !== this) {
        	previoustourdaysBtn.classList.remove('clickEvent');
        }

        previoustourdaysBtn = this;
    }

    function resetBtnEvent() {
        localBtns.forEach(function(btn) {
            btn.classList.remove('clickEvent');
        });

        themeBtns.forEach(function(btn) {
            btn.classList.remove('clickEvent');
        });

        tourdaysBtns.forEach(function(btn) {
            btn.classList.remove('clickEvent');
        });

        selectedRegion = null;
        selectedTheme = null;
        selectedTourdays = null;
    }

    function searchBtnEvent() {
        var url = "/project/board/route?";
        if (selectedRegion) {
            url += "region=" + selectedRegion + "&";
        } else {
        	url += "region=&";	
        }
        
        if (selectedTheme) {
            url += "theme=" + selectedTheme + "&";
        } else {
        	url += "theme=&";
        }
        if (selectedTourdays) {
            url += "tourdays=" + selectedTourdays;
        } else {
        	url += "tourdays=&";
        }
        if (url.endsWith("&")) {
            url = url.slice(0, -1); // 맨 끝의 & 제거
        }
        window.location.href = url;
    }

    localBtns.forEach(function(btn) {
        btn.addEventListener("click", localBtnEvent);
    });

    themeBtns.forEach(function(btn) {
        btn.addEventListener("click", themeBtnEvent);
    });

    tourdaysBtns.forEach(function(btn) {
        btn.addEventListener("click", tourdaysBtnEvent);
    });

    resetBtn.addEventListener("click", resetBtnEvent);
    searchBtn.addEventListener("click", searchBtnEvent);
    
    function searchCheck() {
        var condition = document.getElementsByName("condition")[0].value;
        if (condition === "") {
            alert("검색 조건을 선택해주세요.");
            return false;
        }
        return true;
    }
</script>

</body>
</html>