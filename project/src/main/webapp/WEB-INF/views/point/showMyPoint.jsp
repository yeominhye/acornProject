<%@ page import="com.acorn.project.point.Point" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Points</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/showMypoint.css" >
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    flatpickr(".flatpickr", {
        dateFormat: "Y-m-d"
    });

    const urlParams = new URLSearchParams(window.location.search);
    const startDate = urlParams.get('startDate');
    const endDate = urlParams.get('endDate');

    if (startDate && endDate) {
        document.getElementById('startDate').value = startDate;
        document.getElementById('endDate').value = endDate;
    }

    const form = document.querySelector('form[action="/project/point/showMyPoint.do"]');

    form.addEventListener('submit', function(event) {
        const startDateValue = document.getElementById('startDate').value;
        const endDateValue = document.getElementById('endDate').value;
        const searchValue = document.getElementById('search').value;

        if (!startDateValue || !endDateValue) {
            event.preventDefault();
            return;
        }
    });

    const filterTable = () => {
        const searchValue = document.getElementById('search').value.toLowerCase();
        const tableRows = document.querySelectorAll('.pt_table_info');

        tableRows.forEach(row => {
            const listText = row.querySelector('#t_list').innerText.toLowerCase();
            if (listText.includes(searchValue)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    };

    document.getElementById('search').addEventListener('keyup', filterTable);
});

    
</script>
</head>
<body>
<div class="pt_wrap">
    <!-- 왼쪽 네비 위-->
    <div class="pt_nav">
        <div class="pt_nav_up">
            <div class="pt_nav"></div>
            <div class="pt_nav_h2"><h2>${user.nickname}님</h2></div>
            <div class="pt_nav_pt"><span>포인트</span> <span style="color: rgba(253, 177, 177, 0.924);">${user.userPoint}</span></div>
        </div>
        <div class="pt_nav_down">
            <div class="pt_nav_char"><h1>전체내역</h1>
             <a href="#"> <p>사용내역</p> </a>
             <a href="/project/point/showMyEarnedPoint.do"> <p>획득내역</p> </a>
            </div>
            <div class="pt_nav_all"><h1>충전/환전</h1>
            <a href="/project/point/showMyEarnedPoint.do"> <p>획득내역</p> </a>
            <a href="/project/point/pointCharge.do"> <p>충전하기</p></a>
            <a href="/project/point/pointExchange.do""> <p>환전하기</p></a>
            </div>
        </div>
    </div>
    
    <div class="pt_content">
        <div class="pt_title">포인트 전체내역</div>
        <div class="pt_categori">
            <form action="/project/point/showMyPoint.do" method="GET">
                <div class="pt_date1">
                    <label for="startDate">시작일</label>
                    <input type="text" id="startDate" name="startDate" class="flatpickr" placeholder="날짜 선택">
                </div>
                <div class="pt_date2">
                    <label for="endDate">종료일</label>
                    <input type="text" id="endDate" name="endDate" class="flatpickr" placeholder="날짜 선택">
                </div>
                <div><button id="resetButton" type="button" onclick="location.href='/project/point/showMyPoint.do'">초기화</button></div>
                
                <button type="submit" class="pt_cont_btn">날짜 검색</button>
            </form>
            <div class="pt_search">
                    <input id="search" name="search" placeholder="사용내역을 입력하세요">
                </div>
        </div>

        <table class="pt_table" border="1">
            <thead>
                <tr style="background-color: rgb(201, 201, 201);">
                    <th>날짜</th>
                    <th>사용구분</th>
                    <th>내역</th>
                    <th>사용 포인트</th>
                    <th>잔여 포인트</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${not empty pointList}">
                    <c:forEach var="point" items="${pointList}">
                        <tr class="pt_table_info">
                            <td id="t_date"><c:out value="${point.pointDate}"/></td>
                            <td id="t_division">
                                <c:choose>
                                    <c:when test="${point.pointStatus == 0}">게시글 구매</c:when>
                                    <c:when test="${point.pointStatus == 1}">포인트 충전</c:when>
                                    <c:when test="${point.pointStatus == 2}">포인트 환전</c:when>
                                    <c:when test="${point.pointStatus == 3}">게시글 판매</c:when>
                                </c:choose>
                            </td>
                            <td id="t_list"><c:out value="${point.boardCode}"/></td>
                            <td id="t_use_point"><c:out value="${point.pointAmount}"/></td>
                            <td id="t_left_point"><c:out value="${point.remainingPoints}"/></td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${empty pointList}">
                    <tr>
                        <td colspan="5">No points found.</td>
                    </tr>
                </c:if>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="5"><span style="margin-left: 42px;">합계</span> <span style="float: right; color:red; margin-right: 20px;">${user.userPoint}</span></td>
                </tr>
            </tfoot>
        </table>
    </div>
</div>
</body>
</html>
