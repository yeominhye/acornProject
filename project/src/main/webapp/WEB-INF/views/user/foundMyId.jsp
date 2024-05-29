<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Found User ID</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" >
    <style>
        .wrap {
            position: relative;
            width: 1000px;
            height: 600px;
    		box-shadow: 2px 10px 20px rgba(22,20,19,0.4);
            border-radius: 20px;

            display: flex;
            margin: 75px auto;
        }
        .container {
            display: flex;
            flex-direction: column;
            width: 600px;
            height: 600px;
            padding: 50px;
        }
        .text {
            flex: 1;
            border-bottom: 2px solid lightgray;
        }
        .text h1 {
            margin-bottom: 5px;
        }
        .id, .btn-box, .btn {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .id {
            position: relative;
            flex: 3;
        }
        .id p {
            font-size: 28px;
            cursor: pointer;
            font-weight: bold;
        }
        .id span {
            position: absolute;
            font-size: 16px;
            color: #939393;
            bottom: 90px;
        }

        .btn-box {
            flex: 1;
        }
        .btn-box .btn {
            background-color: #f5f5f5;

            width: 90px;
            height: 30px;
            margin: 0 15px;
            border-radius: 20px;
        }
        .btn-box .btn:nth-child(2) {
            width: 140px;
        }
        .btn:hover {
            background-color: #ffc9c9   ;
        }

        .img {
            width: 400px;
            height: 600px;
            background-image: url("${pageContext.request.contextPath}/resources/img/find-id.jpg");
            background-size: 100%;
            border-radius: 0 20px 20px 0;
        }
    </style>
</head>
<body>
	<%@ include file="../nav-sub.jsp" %>
	
	<div class="wrap">

        <div class="container">
            <div class="text">
                <h1>내 아이디 찾기</h1>
                고객님의 정보와 일치하는 아이디입니다.
            </div>

            <div class="id">
                <% String foundMyId = (String) session.getAttribute("foundMyId"); %>
	    		<% if (foundMyId != null) { %>
	                <p><%= foundMyId %></p>
				<% } else { %>
	        		<p>사용자 아이디를 찾을 수 없습니다.</p>
	    		<% } %>
                <span>아이디를 클릭해 복사하세요!</span>
            </div>

            <div class="btn-box">
                <div class="btn"><a href="login.do">로그인</a></div>
                <div class="btn"><a href="/project/user/findMyInfo.do">비밀번호 찾기</a></div>
            </div>
        </div>
        
        <div class="img"></div>
        
    </div>
    
	<%@ include file="../footer-sub.jsp" %>
    <script>
        document.querySelectorAll('p').forEach(function(paragraph) {
            paragraph.addEventListener('click', function() {
                const tempTextarea = document.createElement('textarea');
                tempTextarea.value = this.textContent;
                document.body.appendChild(tempTextarea);

                tempTextarea.select();
                document.execCommand('copy');

                document.body.removeChild(tempTextarea);

                alert('텍스트가 복사되었습니다: ' + this.textContent);
            });
        });
    </script>
    
</body>
</html>
