<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Map Form</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            var dayCount = 1; // 시작할 때 하나의 일정이 이미 있음

            // 일정 추가 버튼 클릭 시
            $('#addDayButton').click(function() {
                dayCount++;
                var dayHtml = '<div class="day-container">' +
                                  '<h2>Day ' + dayCount + '</h2>' +
                                  '<label for="days[' + (dayCount-1) + '].dayInfo">Day ' + dayCount + ' Info:</label>' +
                                  '<input type="text" id="days[' + (dayCount-1) + '].dayInfo" name="days[' + (dayCount-1) + '].dayInfo" required><br>' +
                                  '<div class="marker-container">' +
                                      '<h3>Markers</h3>' +
                                      '<button class="addMarkerButton" data-day="' + dayCount + '">Add Marker</button>' +
                                  '</div>' +
                              '</div>';
                $('#daysContainer').append(dayHtml);
            });

            // 마커 추가 버튼 클릭 시
            $(document).on('click', '.addMarkerButton', function() {
                var dayNumber = $(this).data('day');
                var markerHtml = '<div class="marker">' +
                                     '<label for="days[' + (dayNumber-1) + '].markers[' + (dayNumber-1) + '].latitude">Latitude:</label>' +
                                     '<input type="text" id="days[' + (dayNumber-1) + '].markers[' + (dayNumber-1) + '].latitude" name="days[' + (dayNumber-1) + '].markers[' + (dayNumber-1) + '].latitude" required>' +
                                     '<label for="days[' + (dayNumber-1) + '].markers[' + (dayNumber-1) + '].longitude">Longitude:</label>' +
                                     '<input type="text" id="days[' + (dayNumber-1) + '].markers[' + (dayNumber-1) + '].longitude" name="days[' + (dayNumber-1) + '].markers[' + (dayNumber-1) + '].longitude" required>' +
                                     '<label for="days[' + (dayNumber-1) + '].markers[' + (dayNumber-1) + '].markerInfo">Marker Info:</label>' +
                                     '<input type="text" id="days[' + (dayNumber-1) + '].markers[' + (dayNumber-1) + '].markerInfo" name="days[' + (dayNumber-1) + '].markers[' + (dayNumber-1) + '].markerInfo" required>' +
                                 '</div>';
                $(this).parent().append(markerHtml);
            });
        });
    </script>
</head>
<body>
    <h1>Create a Map</h1>
    
    <form action="/project/maps/create" method="post" id="createMapForm">



        <label for="boardCode">Board Code:</label>
        <input type="text" id="boardCode" name="boardCode" required><br><br>
        
        <div id="daysContainer">
            <div class="day-container">
                <h2>Day 1</h2>
                <label for="days[0].dayInfo">Day 1 Info:</label>
                <input type="text" id="days[0].dayInfo" name="days[0].dayInfo" required><br>
                <div class="marker-container">
                    <h3>Markers</h3>
                    <button class="addMarkerButton" data-day="1">Add Marker</button>
                </div>
            </div>
        </div>
        
        <button type="button" id="addDayButton">Add Day</button>
        <br><br>
        
        <input type="submit" value="Create Map">
    </form>
</body>
</html>
