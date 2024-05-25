<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">
<title>Insert title here</title>
</head>
<body>

	<div class="my_wrap">
		<!-- 반응형 (915) 탑부분 -->
		<div class="my_ban_top">
			<div class="my_ban_show">
				<div class="my_ban_img">
					<img
						src="${pageContext.request.contextPath}/resources/img/myimg.png"
						alt="본인이미지" style="width: 130px; height: 160px;">
				</div>
				<div class="my_ban_name">
					<span>${user.nickname}<span
						style="font-weight: bolder; margin-left: 20px;"> 님의 마이페이지</span> <span><a
							href="#" class="ban_span">정보변경</a></span></span>
				</div>
				<div class="my_ban_point">
					<div class="my_ban_point_text">
						<span style="font-weight: 500;"> ${user.userPoint}</span> <span
							style="color: rgb(209, 209, 55)">P</span>
					</div>
					<a class="my_ban_point_btn" href="/project/point/pointCharge.do"><span>충전</span></a>
				</div>
				<div class="my_ban_icon">
					<ul>
						<li><img
							src="${pageContext.request.contextPath}/resources/img/document 1.png"><br>
							<span style="padding-left: 8px;">1:1문의내역</span></li>
						<li><img
							src="${pageContext.request.contextPath}/resources/img/point.png"><br>
							<span style="padding-left: 8px;">포인트 내역</span></li>
						<li><img
							src="${pageContext.request.contextPath}/resources/img/pen.png"><br>
							<span style="padding-left: 20px;">정보수정</span></li>
						<li><img
							src="${pageContext.request.contextPath}/resources/img/peopelout.png"><br>
							<span style="padding-left: 20px;">회원탈퇴</span></li>
					</ul>
				</div>
			</div>
		</div>




		<!-- 전체 pc 탑 부분 (1200px)-->
		<div class="my_top">
			<div class="my_nav">
				<ul>
					<li style="font-weight: bolder;"><a
						href="/project/board/my/inquiry6">내 문의내역</a></li>
					<li><a href="/project/point/showMyPoint.do">포인트 내역</a></li>
					<li><a href="/project/user/modifyInfo.do">내 정보 변경</a></li>
					<!-- <li><a href="/project/user/deleteInfo.do">회원 탈퇴</a></li>  -->
					<li><a onclick="deleteAccount()" style="cursor: pointer;">회원
							탈퇴</a></li>
				</ul>
			</div>

			<div class="my_show">
				<div class="my_show_top">
					<div class="my_img">
						<img
							src="${pageContext.request.contextPath}/resources/img/myimg.png"
							alt="본인이미지" style="width: 130px; height: 160px;">
					</div>
					<div class="my_name">
						<span> ${user.nickname}<span
							style="font-weight: bolder; margin-left: 50px;"> 님의 마이페이지</span></span>
					</div>
				</div>
				<div class="my_point">
					<div class="my_point_text">
						<span style="font-weight: 500;"> ${user.userPoint}</span> <span
							style="color: rgb(209, 209, 55)">P</span>
					</div>
					<a class="my_point_btn" href="/project/point/pointCharge.do"><span
						style="color: gray; font-size: smaller;">충전</span></a>
				</div>
			</div>
			<div class="my_active" style="font-weight: bolder;">나의 활동</div>
		</div>

		<div class="my_list">
			<div class="my_list_ul">
				<ul>
					<li><a href="#" style="font-weight: bolder;">작성한 글</a></li>
					<li><a href="#">스크랩</a></li>
					<li><a href="#">추천한 글</a></li>
					<li><a href="#">구매한 글</a></li>
					<li><a href="#">내 댓글</a></li>
				</ul>


				<table class="my_list_board">
					<tr class="each-post">
						<td class="index">No.</td>
						<td class="title">제목</td>
						<td class="boardType">카테고리</td>
						<td class="date">작성날짜</td>
					</tr>
					<%
					int index = 0;
					%>
					<c:forEach var="board" items="${list}">
						<%
						index++;
						%>
						<tr class="each-post">
							<td class="post-index"><%=index%></td>
							<td class="post-title" style="text-align: center;"
								title="${board.boardTitle}"><a
								href="/project/board/my/${board.boardCode}">${board.boardTitle}</a>
							</td>
							<td class="post-boardType">${board.boardType}</td>
							<td class="post-date">${board.boardWritedate}</td>
						</tr>
					</c:forEach>
				</table>

			</div>
		</div>

		<script>
			function changeType() {
				let typeElements = document.querySelectorAll(".post-boardType"); // boardType 클래스를 모두 선택합니다.

				typeElements.forEach(function(typeElement) { // 각 선택된 요소에 대해 반복합니다.
					let value = parseInt(typeElement.innerHTML, 10);

					switch (value) {
					case 0:
						typeElement.innerHTML = "루트게시판";
						break;
					case 1:
						typeElement.innerHTML = "여행후기";
						break;
					case 2:
						typeElement.innerHTML = "꿀팁공유";
						break;
					case 3:
						typeElement.innerHTML = "질문있어요!";
						break;
					case 4:
						typeElement.innerHTML = "수다방";
						break;
					case 5:
						typeElement.innerHTML = "동행 구해요!";
						break;
					case 6:
						typeElement.innerHTML = "문의";
						break;
					default:
						typeElement.innerHTML = "에러";
					}
				});
			}
			window.onload = function() {
				changeType(); // 페이지가 로드될 때 자동으로 함수 호출
			};
		</script>


		<!-- 탈퇴 팝업 -->
		<script>
			function deleteAccount() {

				url = "deleteInfo.do"
				open(
						url,
						"confirm",
						"menubar=no, statusbar=no, scrollbar=no, width=500, height=250, left=600, top=350 ");
			}

			function reload() {
				setTimeout(function() {
					location.reload();
				}, 300);
			}

			function goHome() {
				window.location.href = "/project/"
			}
		</script>
</body>
</html>