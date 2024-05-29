package com.acorn.project.map;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class RetrieveExample {

    public static void main(String[] args) throws JsonParseException, JsonMappingException, IOException {
        String boardCode = "example2";
        
        // 데이터베이스에서 JSON 데이터 조회
        List<Day> days = retrieveData(boardCode);
        
        // 조회 결과 출력
        if (days != null) {
            for (Day day : days) {
                System.out.println("Day: " + day.getDay());
                System.out.println("Day Info: " + day.getDayInfo());
                System.out.println("Markers:");
                for (Marker marker : day.getMarkers()) {
                    System.out.println("  Latitude: " + marker.getLatitude());
                    System.out.println("  Longitude: " + marker.getLongitude());
                    System.out.println("  Marker Info: " + marker.getMarkerInfo());
                }
                System.out.println();
            }
        }
    }

    public static List<Day> retrieveData(String boardCode) throws JsonParseException, JsonMappingException, IOException {
        String url = "jdbc:mysql://localhost:3306/testdb";
        String username = "root";
        String password = "dualsp99";

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            String sql = "SELECT days FROM maptbl WHERE board_code = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, boardCode);
                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
                    String daysJson = rs.getString("days");
                    ObjectMapper objectMapper = new ObjectMapper();
                    return objectMapper.readValue(daysJson, new TypeReference<List<Day>>() {});
                }
            }
        } catch (SQLException e){
        	e.printStackTrace();
        }
        return null;
    }
}

