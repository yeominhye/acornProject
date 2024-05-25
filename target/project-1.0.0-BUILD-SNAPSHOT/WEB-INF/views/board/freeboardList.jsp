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
</head>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
	    var currentURL = window.location.href;
	    
	    var urlParts = currentURL.split("=");
	    var lastValue = urlParts[urlParts.length - 1];
	    
		var header = document.querySelector("h2");
	    if (lastValue === "-1") {
	       header.innerText = "전체글";
	        
    	} else if(lastValue ==="1"){	
    		  header.innerText = "여행후기";
    	} else if(lastValue ==="2"){	
    		  header.innerText = "꿀팁공유";
    	} else if(lastValue ==="3"){	
    		  header.innerText = "질문있어요!";
    	}else if(lastValue ==="4"){	
    		  header.innerText = "수다방";
    	}else if(lastValue ==="5"){	
    		  header.innerText = "동행구해요";
    	}else{
    		console.log("오류");
    	}
	});
	
</script>

<body>
    <div class="wrap">
        <div class="all_menu">
            <div class="side_menu">
            	<div class="side_menu_set">
	                <h3><a href="/project/board/free?type=-1" >자유게시판</a></h3>
	                <ul>
	                	<li> <a href="/project/board/free?type=-1"> 전체글</a></li>
	                    <li> <a href="/project/board/free?type=1"> 여행후기</a></li>
	                    <li> <a href="/project/board/free?type=2">  꿀팁공유</a></li>
	                    <li> <a href="/project/board/free?type=3" > 질문있어요!</a></li>
	                    <li> <a href="/project/board/free?type=4" > 수다방</a></li>
	                    <li> <a href="/project/board/free?type=5" > 동행구해요!</a></li>
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
                            <% int index =0; %>
                            <c:forEach var="list" items="${freeBoardList}" varStatus="loop">
                            <% index++;%>
                       		 <tr>
                                <td>${freeBoardList.size() - loop.index}</td>
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
					<div class="paging">
				        <div style="display: flex; align-items: center;">
				          <!-- Fontawesome Icon -->
				          <i class="fa-solid fa-angles-left" id="first_page"></i>
				          <i class="fa-solid fa-angle-left" id="prev_page"></i>
				          <!--  -->
				          <div class="pages">
				            <span class="active">1</span>
				            <span>2</span>
				            <span>3</span>
				            <span>4</span>
				            <span>5</span>
				          </div>
				          <!-- Fontawesome Icon -->
				          <i class="fa-solid fa-angle-right" id="next_page"></i>
				          <i class="fa-solid fa-angles-right" id="last_page"></i>
				        </div>
                	</div>
            	</div>
                <div class="search_form">
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
                </div>
            </div>
        </div>
    </div>
</body>
</html>