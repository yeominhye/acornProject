<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../nav.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/freeboard.css" >
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" >
<script type="text/javascript">ㅈ
	function changeTitle(event) {
	    event.preventDefault(); // 링크 기본 동작 막기
	    var newTitle = event.target.textContent.trim();
	    document.querySelector('h2.changeTitle').textContent = newTitle;
	}
	
	window.onload = function() {
	    var links = document.querySelectorAll('.side_menu ul li a');
	    links.forEach(function(link) {
	        link.addEventListener('click', changeTitle);
	    });
	}
</script>
</head>
<body>

<div class="wrap">
        <!-- 게시판 -->
        <div class="all_menu">
            <div class="side_menu">
                <h3>자유게시판</h3>
                <ul>
                	<li> <a href="/project/board/free?type=-1" onclick="changeTitle()">전체보기</a></li>
                    <li> <a href="/project/board/free?type=1"> 여행후기</a></li>
                    <li> <a href="/project/board/free?type=2"> 꿀팁공유</a></li>
                    <li> <a href="/project/board/free?type=3"> 질문있어요!</a></li>
                    <li> <a href="/project/board/free?type=4"> 수다방</a></li>
                    <li> <a href="/project/board/free?type=5"> 동행구해요!</a></li>
                </ul>
            </div>
            <div class="notice">
                <h2 class="changeTitle">수다방</h2>
                <a class="write-link" href="/project/board/free/reg">글쓰기</a>
                
                <form action="free/search" method="get">
					<select name="condition">
						<option value="">선택하시오</option>
						<option value="writer">작성자</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="keyword">
					<button>검색</button>
				</form>
				
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
                            <tr>
                                <!-- DB 연동해서 불러오기 -->
                                <td>0</td>
                                <td class="td22"><a href="">안녕하세요!! 이번에 여행다녀왔는데 넘재밌어요</a></td>
                                <td>dd</td>
                                <td>2024.05.03</td>
                                <td>22</td>
                            </tr>
                            
                            <% int index =0; %>
                            <c:forEach var="list" items="${freeBoardList}">
                            <% index++;%>
                       		 <tr>
                                <td><%=index%></td>
                                <td class="td22"><a href="/project/board/free/${list.boardCode}">${list.boardTitle}</a></td>
                                <td>${list.nickname}</td>
                                <td>${list.boardWritedate}</td>
                                <td>${list.boardViews}</td>
                            </tr>
                       		</c:forEach>
                            
                        </tbody>
                    </table>
                </div>
                <div class="page_number">
                    페이징영역<br>
                    1 2 3 4 5 >>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>