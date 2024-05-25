package com.acorn.project.point;

import java.util.List;
import java.util.Map;

import com.acorn.project.user.User;

public interface PointDAOI {

	int count();

	List<Point> selectAll() throws Exception;

	List<Map<String, Object>> selectOne(String userCode) throws Exception;
	
	int buyPoint(int pointAmount, String userCode) throws Exception;

	int buyBoard(Point point, User user) throws Exception;

	int pointExchange(int pointAmount, String userCode) throws Exception;

	List<Map<String, Object>> selectPointsWithinDateRange(String userCode, String startDate, String endDate) throws Exception;
}