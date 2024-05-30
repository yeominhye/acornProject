<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../nav-sub.jsp" %>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/freeboard.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function() {
            typeTitle();
        });

        function searchCheck() {
            var condition = document.getElementsByName("condition")[0].value;
            if (condition === "") {
                alert("검색 조건을 선택해주세요.");
                return false; // 폼 전송을 중단합니다.
            }
            return true; // 폼을 제출합니다.
        }
        
        function typeTitle() {
            var currentURL = window.location.href;
            var urlParts = currentURL.split("type=");
            var lastPart = urlParts[urlParts.length - 1]; // type= 뒤의 값만 가져오기
            var lastValue = lastPart.split("&")[0]; // '&' 문자 이후의 값은 무시

            var header = document.querySelector("h2");

            // 헤더 텍스트 설정
            if (lastValue === "-1") {
                header.innerText = "전체글";
            } else if (lastValue === "1") {
                header.innerText = "여행후기";
            } else if (lastValue === "2") {
                header.innerText = "꿀팁공유";
            } else if (lastValue === "3") {
                header.innerText = "질문있어요!";
            } else if (lastValue === "4") {
                header.innerText = "수다방";
            } else if (lastValue === "5") {
                header.innerText = "동행구해요";
            } else {
                header.innerText = "전체글";
            }
        }
    </script>
</head>
<body>
    <div class="wrap">
        <div class="all_menu">
            <div class="side_menu">
                <div class="side_menu_set">
                    <h3><a href="/project/board/free?type=-1">자유게시판</a></h3>
                    <ul>
                        <li><a href="/project/board/free?type=-1">전체글</a></li>
                        <li><a href="/project/board/free?type=1">여행후기</a></li>
                        <li><a href="/project/board/free?type=2">꿀팁공유</a></li>
                        <li><a href="/project/board/free?type=3">질문있어요!</a></li>
                        <li><a href="/project/board/free?type=4">수다방</a></li>
                        <li><a href="/project/board/free?type=5">동행구해요!</a></li>
                    </ul>
                </div>
            </div>
            <div class="notice">
                <h2 id="changeTitle">0</h2>
                <a class="write-link" href="/project/board/free/reg">글쓰기</a>
                <div class="notice_list">
                    <table>
                        <thead>
                            <tr>
                                <td class="td1">번호</td>
                                <td class="td2">글제목</td>
                                <td class="td3">작성자</td>
                                <td class="td4">작성시간</td>
                                <td class="td5">조회수</td>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- DB 연동해서 불러오기 -->
                            <c:forEach var="list" items="${freeBoardList}" varStatus="status">
                                <tr>
                                    <td>${(paging.totRecords - (status.index + 1) - ((paging.currentPage - 1) * paging.pageSize))+1}</td>
                                    <td class="td-title"><a href="/project/board/free/${list.boardCode}">${list.boardTitle}</a></td>
                                    <td>${list.nickname}</td>
                                    <td>${list.boardWritedate}</td>
                                    <td>${list.boardViews}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class=""> <!-- page_number -->
                    <div class=""> <!-- paging -->
                    
                    <c:if test="${ empty search.condition}">
                    	<c:if test="${paging.currentGrp > 1}">
                            <a href="/project/board/free?type=${type}&page=${paging.grpStartPage - 1}">[ 이전 ]</a>
                        </c:if>
                        <c:forEach var="i" begin="${paging.grpStartPage}" end="${paging.grpEndPage}">
                            <a href="/project/board/free?type=${type}&page=${i}" onclick="typeTitle()" >[ ${i} ]</a>
                        </c:forEach>
                        <c:if test="${paging.grpEndPage <  paging.totalPage}">
                            <a href="/project/board/free?type=${type}&page=${paging.grpEndPage + 1}">[ 다음 ]</a>
                        </c:if>
                    </c:if>
                    
                   <c:if test="${ not empty search.condition}">
                    	<c:if test="${paging.currentGrp > 1}">
                            <a href="/project/board/free/search?page=${paging.grpStartPage - 1}" >[ 이전 ]</a>
                        </c:if>
                        <c:forEach var="i" begin="${paging.grpStartPage}" end="${paging.grpEndPage}">
                            <a href="/project/board/free/search?condition=${search.condition}&keyword=${search.keyword}&start=${search.start}&page=${i}">[ ${i} ]</a>
                        </c:forEach>
                        <c:if test="${paging.grpEndPage <  paging.totalPage}">
                            <a href="/project/board/free/search?page=${paging.grpEndPage + 1}">[ 다음 ]</a>
                        </c:if>
                    </c:if> 
                    
                       
                    </div>
                </div>
                <div class="search_form">
                    <form action="/project/board/free/search" method="get" class="search-form-inner" onsubmit="return searchCheck()">
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
    </div>
    <%@ include file="../footer-sub.jsp" %>
</body>
</html>
