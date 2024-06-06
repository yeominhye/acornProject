<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- reset.css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" >

<style>
    footer {
        position: relative;
        width: 100%;
        heigth: 350px;
        padding: 50px;
        background-color: rgb(236, 236, 236);
    }
    .footer-container > * {
        color: rgb(95, 95, 95);
    }
    .footer-container {
        position: relative;
        width: 1100px;
        margin: 0 auto;
    }
    .footer-text01 {
	    width: 180px;
	    height: 70px;
    }
    .footer-text01 img {
	    width: 180px;
	    height: 70px;
    }
    .footer-text02 {
        margin: 25px 0 50px 0;
    }
    .copyright-info span img {
        height: 30px;
        margin-right: 20px;
    }
    .footer-text04 {
        position: absolute;
        
        width: 135px;
        height: 35px;

        display: flex;
        justify-content: space-between;
        right: 0;
        bottom: 0px;
    }
    .footer-social-icons {
        width: 35px;
        height: 35px;
    }
    .footer-social-icons img {
        width: 35px;
        height: 35px;
        filter: grayscale(80%);
        opacity: 0.7;
        border-radius: 50%;
    }
    .footer-social-icons img:hover {
        filter: grayscale(0);
        opacity: 1;
    }
    .footer-text01 a img {
       width: 150px;
       height: 50px;
    }
</style>
</head>
<body>
    <footer>
        <div class="footer-container">
            <div class="footer-text01">
                <a href="/project/">
                    <img src="${pageContext.request.contextPath}/resources/img/logo2.png" alt="logo-icon">  
                </a>
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
                    <span><img src="${pageContext.request.contextPath}/resources/img/footer-img.png" alt="tourApi"></span>
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
    </footer>
</body>
</html>