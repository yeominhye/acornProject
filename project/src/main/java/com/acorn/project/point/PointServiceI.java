package com.acorn.project.point;

import java.util.List;
import java.util.Map;

import com.acorn.project.user.User;

public interface PointServiceI {

	int count();

	List<Point> getListAll() throws Exception;

	List<Map<String, Object>> getPointOne(String userCode) throws Exception;

	int buyBoard(Point point, User user) throws Exception;

	int buyPoint(int pointAmount, String userCode) throws Exception;

	int pointExchange(int pointAmount, String userCode) throws Exception;

	List<Map<String, Object>> getPointsWithinDateRange(String userCode, String startDate, String endDate) throws Exception;
}