<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴</title>
<style>
.wrap {
   /* width: 500px;s */
   margin: 0 auto;
}

.alert-box {
   /* border: 1px solid black; */
   text-align: center;
   font-size: 12pt;
}

h1 {
   padding-bottom: 10px;
   border-bottom: 2px solid black;
}

.notice {
   margin: 0 auto;
   width: 100%;
   text-align: center;
}

.button-section {
   margin-top: 20px;
}

button {
   border: 2px solid black;
   border-radius: 5px;
   background-color: transparent;
   cursor: pointer;
   width: 80px;
   height: 30px;
   margin: 10px;
}

button:hover {
   font-weight: bold;
   background-color: rgb(255, 240, 254);
}

/* .delete:hover{
            background-color: rgb(255, 240, 254);
        } */
</style>
<script>
   
function confirmDelete() {
    document.getElementById("deleteForm").addEventListener("submit", function(event) {
        event.preventDefault(); 

        fetch(this.action, {
            method: this.method,
            body: new FormData(this),
        })
        .then(response => {
            if (response.ok) {
                // 서버 응답이 성공일 때
                if(opener) {
                    opener.reload(); // 부모 창 새로고침
                    opener.goHome(); // 부모 창 홈으로 이동하는 함수 호출
                }
                window.close(); // 창 닫기
            } else {
                // 서버 응답이 실패일 때
                alert("다시 시도하세요.");
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });
}


   
</script>
</head>
<body>
   <div class="wrap">
      <div class="alert-box">
         <h1>회원탈퇴</h1>
         <p class="notice">
            확인을 누르시면 회원 탈퇴가 진행됩니다.<br> 모든 정보와 보유한 포인트는 완전히 삭제되며<br> 탈퇴
            후 계정 복구는 불가합니다.
         </p>
         <div class="button-section">
            <form id="deleteForm"
               action="${pageContext.request.contextPath}/user/delete_process.do"
               method="post">
               <input type="hidden" name="userId" value="${user.userId}">
               <button class="delete" onclick="confirmDelete()">확인</button>
               <button type="button" class="cancel" onclick="window.close()">취소</button>
            </form>
         </div>
      </div>
   </div>

</body>
</html>