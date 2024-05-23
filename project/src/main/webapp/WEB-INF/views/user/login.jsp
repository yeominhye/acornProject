<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>로그인 및 회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/login.css">
    <script>
        $(document).ready(function() {
            $("#btnLogin").click(function(){
                var userId = $("#loginUserId").val();
                var userPw = $("#loginUserPw").val(); 
                if(userId == ""){
                    $("#loginUserId").focus();
                    return;
                }
                if(userPw == ""){ 
                    $("#loginUserPw").focus();
                    return;
                }
                document.loginForm.action = "${path}/user/login_check.do";
                document.loginForm.submit();
            });

            $("#registerUserId").on('input', function() {
                var userId = $(this).val();
                $.ajax({
                    type: "POST",
                    url: "${path}/user/check_id.do",
                    data: {userId: userId},
                    success: function(data) {
                        if (data == "duplicate") {
                            $("#idCheckMsg").text("이미 사용 중인 아이디입니다.");
                            $("#registerBtn").prop("disabled", true);
                            $("input:not(#registerUserId), button").on('mousedown click keydown focusin', function(e) {
                                e.preventDefault();
                                return false;
                            });
                        } else {
                            $("#idCheckMsg").text("");
                            $("#registerBtn").prop("disabled", false);
                            $('input:not(#registerUserId), button').off('mousedown click keydown focusin');
                        }
                    }
                });
            });

            $("#userTel").on('input', function() {
                var userTel = $(this).val().replace(/[^0-9]/g, '');
                var formattedTel = formatPhoneNumber(userTel);
                $(this).val(formattedTel);

                if (userTel.length >= 11) {
                    $.ajax({
                        type: "POST",
                        url: "${path}/user/check_userTel.do",
                        data: {userTel: formattedTel},
                        success: function(data) {
                            if (data == "duplicate") {
                                $("#userTelCheckMsg").text("이미 가입된 전화번호입니다.");
                                $("#registerBtn").prop("disabled", true);
                                $("input:not(#userTel), button").on('mousedown click keydown focusin', function(e) {
                                    e.preventDefault();
                                    return false;
                                });
                            } else {
                                $("#userTelCheckMsg").text("");
                                $("#registerBtn").prop("disabled", false);
                                $('input:not(#userTel), button').off('mousedown click keydown focusin');
                            }
                        }
                    });
                } else {
                    $("#userTelCheckMsg").text("전화번호는 최소 11자리 이상 입력해야 합니다.");
                    $("#registerBtn").prop("disabled", true);
                    $("input:not(#userTel), button").on('mousedown click keydown focusin', function(e) {
                        e.preventDefault();
                        return false;
                    });
                }
            });

            $("#registerUserPw").on('input', function() {
                var userPw = $(this).val();
                var regex = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/;
                
                if (!regex.test(userPw)) {
                    $("#pwError").text("비밀번호는 영문자와 숫자의 조합으로 최소 8자리 이상이어야 합니다.");
                    $("#registerBtn").prop("disabled", true);
                    $("input:not(#registerUserPw), button").on('mousedown click keydown focusin', function(e) {
                        e.preventDefault();
                        return false;
                    });
                } else {
                    $("#pwError").text("");
                    $("#registerBtn").prop("disabled", false);
                    $('input:not(#registerUserPw), button').off('mousedown click keydown focusin');
                }
            });

            function formatPhoneNumber(phoneNumber) {
                return phoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
            }
        });
    </script>
</head>

<body>
    <div class="container">
        <div class="overlay" id="overlay">
            <div class="sign-in" id="sign-in">
                <h1>안녕하세요</h1>
                <p>우리와 함께하려면 당신의 개인정보를 입력해주세요</p>
                <button class="switch-button" id="slide-right-button">로그인</button>
            </div>
            <div class="sign-up" id="sign-up">
                <h1>Hello, Friend!</h1>
                <p>Enter your personal details and start a journey with us</p>
                <button class="switch-button" id="slide-left-button">회원가입</button>
            </div>
        </div>
        <div class="form">
        
            <div class="sign-in" id="sign-in-info">
                <h1>로그인</h1>
                <div class="social-media-buttons">
                    <div class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="#000000" d="M17,2V2H17V6H15C14.31,6 14,6.81 14,7.5V10H14L17,10V14H14V22H10V14H7V10H10V6A4,4 0 0,1 14,2H17Z" />
                        </svg>
                    </div>
                    <div class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="#000000" d="M23,11H21V9H19V11H17V13H19V15H21V13H23M8,11V13.4H12C11.8,14.4 10.8,16.4 8,16.4C5.6,16.4 3.7,14.4 3.7,12C3.7,9.6 5.6,7.6 8,7.6C9.4,7.6 10.3,8.2 10.8,8.7L12.7,6.9C11.5,5.7 9.9,5 8,5C4.1,5 1,8.1 1,12C1,15.9 4.1,19 8,19C12,19 14.7,16.2 14.7,12.2C14.7,11.7 14.7,11.4 14.6,11H8Z" />
                        </svg>
                    </div>
                    <div class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="#000000" d="M21,21H17V14.25C17,13.19 15.81,12.31 14.75,12.31C13.69,12.31 13,13.19 13,14.25V21H9V9H13V11C13.66,9.93 15.36,9.24 16.5,9.24C19,9.24 21,11.28 21,13.75V21M7,21H3V9H7V21M5,3A2,2 0 0,1 7,5A2,2 0 0,1 5,7A2,2 0 0,1 3,5A2,2 0 0,1 5,3Z" />
                        </svg>
                    </div>
                </div>
                <p class="small">혹은 당신의 정보로 로그인하세요:</p>
                <form id="sign-in-form" name="loginForm" method="post">
                    <input type="text" id="loginUserId" name="userId" placeholder="ID" required/><br>
                    <input type="password" id="loginUserPw" name="userPw" placeholder="Password" required/><br>
                    <c:if test="${message == 'error'}">
                        <div style="color:red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
                    </c:if>
                    <a href="/project/user/findMyInfo.do"><p class="forgot-password">아이디/비밀번호를 잊으셨나요?</p></a>
                    <button type="button" id="btnLogin" class="control-button in">Sign In</button>
                </form>
            </div>

            <div class="sign-up" id="sign-up-info">
                <h1>Create Account</h1>
                <div class="social-media-buttons">
                    <div class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="#000000" d="M17,2V2H17V6H15C14.31,6 14,6.81 14,7.5V10H14L17,10V14H14V22H10V14H7V10H10V6A4,4 0 0,1 14,2H17Z" />
                        </svg>
                    </div>
                    <div class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="#000000" d="M23,11H21V9H19V11H17V13H19V15H21V13H23M8,11V13.4H12C11.8,14.4 10.8,16.4 8,16.4C5.6,16.4 3.7,14.4 3.7,12C3.7,9.6 5.6,7.6 8,7.6C9.4,7.6 10.3,8.2 10.8,8.7L12.7,6.9C11.5,5.7 9.9,5 8,5C4.1,5 1,8.1 1,12C1,15.9 4.1,19 8,19C12,19 14.7,16.2 14.7,12.2C14.7,11.7 14.7,11.4 14.6,11H8Z" />
                        </svg>
                    </div>
                    <div class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="#000000" d="M21,21H17V14.25C17,13.19 15.81,12.31 14.75,12.31C13.69,12.31 13,13.19 13,14.25V21H9V9H13V11C13.66,9.93 15.36,9.24 16.5,9.24C19,9.24 21,11.28 21,13.75V21M7,21H3V9H7V21M5,3A2,2 0 0,1 7,5A2,2 0 0,1 5,7A2,2 0 0,1 3,5A2,2 0 0,1 5,3Z" />
                        </svg>
                    </div>
                </div>
                <p class="small">or use your info for registration:</p>
                <form id="sign-up-form" action="${path}/user/register_process.do" method="post">
                    <input type="text" name="userName" placeholder="Name" required /><br>
                    <input type="text" name="userId" id="registerUserId" placeholder="ID" required /><br><span id="idCheckMsg" style="color:red;"></span>
                    <input type="password" placeholder="Password" name="userPw" id="registerUserPw" required /><br><span id="pwError" style="color:red;"></span>
                    <input type="text" name="userTel" id="userTel" placeholder="tel" required /><br><span id="userTelCheckMsg" style="color:red;"></span>
                    <button type="submit" class="control-button up" id="registerBtn">Sign Up</button>
                </form>
            </div>
        </div>
    </div>
    <script src="${path}/resources/js/login.js"></script>
</body>
</html>
