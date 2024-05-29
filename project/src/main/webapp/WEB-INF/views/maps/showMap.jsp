<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Show Map</title>
</head>
<body>
<h1>Map Information</h1>
제목 : ${board.boardTitle}<br>
내용 : ${board.boardContent}<br>
테마 : ${board.boardTheme}<br>
기간 : ${board.boardTourdays}<br>
작성시간 : ${board.boardWritedate}<br>
포인트 : ${board.boardPoint}<br>
타입 : ${board.boardType}<br>
지역 : ${board.boardRegion}<br>

<c:forEach items="${board.days}" var="day">
    <h2>Day ${day.day}: ${day.dayInfo}</h2>
    <ul>
        <c:forEach items="${day.markers}" var="marker">
            <li>Latitude: ${marker.latitude}, Longitude: ${marker.longitude}, explain: ${marker.markerExplain}</li>
        </c:forEach>
    </ul>
</c:forEach>

</body>
</html>