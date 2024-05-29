<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Show Map</title>
</head>
<body>
<h1>Map Information</h1>

<c:forEach items="${maps.days}" var="day">
    <h2>Day ${day.day}: ${day.dayInfo}</h2>
    <ul>
        <c:forEach items="${day.markers}" var="marker">
            <li>Latitude: ${marker.latitude}, Longitude: ${marker.longitude}, Info: ${marker.markerInfo}</li>
        </c:forEach>
    </ul>
</c:forEach>

</body>
</html>
