package com.acorn.project.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class InsertExample {

    public static void main(String[] args) {
        // 예시 데이터 생성
        RouteBoard routeBoard = new RouteBoard();
        routeBoard.setUserCode("u0001");
        routeBoard.setBoardContent("example content");
        routeBoard.setBoardPoint(200);
        routeBoard.setBoardRegion(2);
        routeBoard.setBoardTheme(2);
        routeBoard.setBoardTitle("example title");
        routeBoard.setBoardTourdays(2);
        routeBoard.setBoardType(0);
        routeBoard.setBoardViews(0);
        
        Day day1 = new Day();
        day1.setDay(1);
        day1.setDayInfo("첫 번째 날의 정보입니다.");
        day1.setMarkers(Arrays.asList(
            new Marker(112.212, 121.122, "마커 설명입니다.", "마커1 타이틀", "마커1 포지션"),
            new Marker(443.222, 112.124, "또 다른 마커 설명입니다.", "마커2 타이틀", "마커2 포지션"),
            new Marker(12.222, 654.124, "또 다른 마커 설명입니다.", "마커3 타이틀", "마커3 포지션")
        ));

        Day day2 = new Day();
        day2.setDay(2);
        day2.setDayInfo("두 번째 날의 정보입니다.");
        day2.setMarkers(Arrays.asList(
            new Marker(123.456, 654.321, "또 다른 날의 마커 설명입니다.", null, null),
            new Marker(123.456, 654.321, "또 다른 날의 마커 설명입니다.", null, null)
        ));

        routeBoard.setDays(Arrays.asList(day1, day2));

        // JSON 변환
        ObjectMapper objectMapper = new ObjectMapper();
        String daysJson;
        try {
            daysJson = objectMapper.writeValueAsString(routeBoard.getDays());
            // 데이터베이스에 삽입하는 코드
            insertData(routeBoard, daysJson);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
    }

    public static void insertData(RouteBoard routeBoard, String daysJson) {
        String url = "jdbc:mysql://localhost:3306/testdb";
        String username = "root";
        String password = "dualsp99";

        String sql = "INSERT INTO boardtbl (userCode, boardTitle, boardContent, boardTheme, boardTourdays, boardWritedate, boardViews, boardPoint, boardType, boardRegion, days) VALUES (?, ?, ?, ?, ?, NOW(), ?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, routeBoard.getUserCode());
            pstmt.setString(2, routeBoard.getBoardTitle());
            pstmt.setString(3, routeBoard.getBoardContent());
            pstmt.setInt(4, routeBoard.getBoardTheme());
            pstmt.setInt(5, routeBoard.getBoardTourdays());
            pstmt.setInt(6, routeBoard.getBoardViews());
            pstmt.setInt(7, routeBoard.getBoardPoint());
            pstmt.setInt(8, routeBoard.getBoardType());
            pstmt.setInt(9, routeBoard.getBoardRegion());
            pstmt.setString(10, daysJson);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
