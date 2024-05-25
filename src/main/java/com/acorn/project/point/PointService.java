package com.acorn.project.point;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Component;

import com.acorn.project.board.BoardDAO;
import com.acorn.project.user.User;

@Component
public class PointService implements PointServiceI {

	@Inject
	PointDAO dao;
	
	
	@Override
	public int count() {
		return dao.count();
	}
	
	
	
	@Override
	public List<Point> getListAll() throws Exception {
		return dao.selectAll();
	}
	
	@Override
	public List<Point> getPointOne(String userCode) throws Exception {
		return dao.selectOne(userCode);
	}
	
	@Override
	public int buyBoard(Point point, User user) throws Exception {
		return dao.buyBoard(point, user);
	}


	@Override
	public int buyPoint(int pointAmount, String userCode) throws Exception {
		return dao.buyPoint(pointAmount, userCode);
	}

	@Override
	public int pointExchange(int pointAmount, String userCode) throws Exception {
        return dao.pointExchange(pointAmount, userCode);
    }
	
	
}
