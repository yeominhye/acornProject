package com.acorn.project.point;

import java.util.List;

import com.acorn.project.user.User;

public interface PointDAOI {

	int count();

	List<Point> selectAll() throws Exception;

	List<Point> selectOne(String userCode) throws Exception;
	
	int buyPoint(int pointAmount, String userCode) throws Exception;

	int buyBoard(Point point, User user) throws Exception;

	int pointExchange(int pointAmount, String userCode) throws Exception;
}