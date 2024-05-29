package com.acorn.project.map;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class InsertExample {

    public static void main(String[] args) {
        // 예시 데이터 생성
        Maps maps = new Maps();
        maps.setBoardCode("example");

        Day day1 = new Day();
        day1.setDay(1);
        day1.setDayInfo("첫 번째 날의 정보입니다.");
        day1.setMarkers(Arrays.asList(
            new Marker(112.212, 121.122, "마커 설명입니다."),
            new Marker(112.222, 322.111, "또 다른 마커 설명입니다.")
        ));

        Day day2 = new Day();
        day2.setDay(2);
        day2.setDayInfo("두 번째 날의 정보입니다.");
        day2.setMarkers(Collections.singletonList(
            new Marker(123.456, 654.321, "또 다른 날의 마커 설명입니다.")
        ));

        maps.setDays(Arrays.asList(day1, day2));

        // JSON 변환
        ObjectMapper objectMapper = new ObjectMapper();
        String daysJson;
        try {
            daysJson = objectMapper.writeValueAsString(maps.getDays());
            // 데이터베이스에 삽입하는 코드
            insertData("example", daysJson);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
    }

    public static void insertData(String boardCode, String daysJson) {
        String url = "jdbc:mysql://localhost:3306/testdb";
        String username = "root";
        String password = "dualsp99";

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            String sql = "INSERT INTO maptbl (mapCode, board_code, days) VALUES (?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, "mapCode1"); // mapCode는 PRIMARY KEY로 자동 증가하거나 고유한 값을 설정해야 합니다.
                pstmt.setString(2, boardCode);
                pstmt.setString(3, daysJson);
                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
