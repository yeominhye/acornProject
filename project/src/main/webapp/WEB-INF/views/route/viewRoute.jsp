<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Route</title>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7560b5ddb94a9dc91354ef62a6b750ee"></script>
</head>
<body>
    <h1>${route.title}</h1>
    <p>${route.date}</p>
    <p>${route.region}</p>
    <p>${route.category}</p>
    <div id="map"></div>
    <div id="dayPlans">
        <c:forEach var="dayPlan" items="${route.dayPlans}">
            <h2>Day ${dayPlan.day}</h2>
            <p>${dayPlan.comments}</p>
            <div id="map${dayPlan.day}"></div>
        </c:forEach>
    </div>
    <script>
        function loadMap(day) {
            const mapContainer = document.getElementById(`map${day}`);
            const mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667),
                level: 3
            };
            const map = new kakao.maps.Map(mapContainer, mapOption);
        }

        document.addEventListener("DOMContentLoaded", function() {
            loadMap(1);
        });
    </script>
</body>
</html>
