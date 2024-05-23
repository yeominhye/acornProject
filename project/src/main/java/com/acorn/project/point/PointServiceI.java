package com.acorn.project.point;

import java.util.List;

import com.acorn.project.user.User;

public interface PointServiceI {

	int count();

	List<Point> getListAll() throws Exception;

	List<Point> getPointOne(String userCode) throws Exception;

	int buyBoard(Point point, User user) throws Exception;

	int buyPoint(int pointAmount, String userCode) throws Exception;

	int pointExchange(int pointAmount, String userCode) throws Exception;
}