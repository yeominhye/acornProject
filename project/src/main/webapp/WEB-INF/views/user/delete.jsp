<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원 탈퇴</title>
    <script>
        function confirmDelete() {
            var result = confirm("정말로 탈퇴하시겠습니까?");
            if (result) {
                document.getElementById("deleteForm").submit();
            } else {
                return false;
            }
        }
    </script>
</head>
<body>
<a href="/project/">홈</a>
    <h2>회원 탈퇴</h2>
    <form id="deleteForm" action="${pageContext.request.contextPath}/user/delete_process.do" method="post">
        <input type="hidden" name="userId" value="${user.userId}">
        <p>회원 탈퇴를 진행하시려면 아래 버튼을 클릭하세요.</p>
        <button type="button" onclick="confirmDelete()">탈퇴하기</button>
        <a href="${pageContext.request.contextPath}/">취소</a>
    </form>
</body>
</html>
