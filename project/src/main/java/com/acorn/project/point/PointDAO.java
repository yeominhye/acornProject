package com.acorn.project.point;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.project.user.User;
import com.acorn.project.user.UserDAO;

@Repository
public class PointDAO implements PointDAOI  {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.acorn.PointMapper.";
    
    @Autowired
    UserDAO userDAO;

    
	@Override
	public int count() {
		return session.selectOne(namespace+"count");
	}
	
	@Override
    public List<Point> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
    }

	@Override
    public List<Point> selectOne(String userCode) throws Exception {
        return session.selectList(namespace+"selectOne", userCode);
    }

	@Override
    public int buyBoard(Point point, User user) throws Exception {
        return session.insert(namespace+"buyBoard", point);
    }

	@Override
	public int buyPoint(int pointAmount, String userCode) throws Exception {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("pointAmount", pointAmount);
	    paramMap.put("userCode", userCode);
	    return session.insert(namespace+"buyPoint", paramMap);
	}

	@Override
    public int pointExchange(int pointAmount, String userCode) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("pointAmount", pointAmount);
	    paramMap.put("userCode", userCode);
        return session.insert(namespace+"pointExchange", paramMap);
    }
	
	@Override
	public List<Point> selectPointsWithinDateRange(String userCode, String startDate, String endDate) throws Exception {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("userCode", userCode);
        paramMap.put("startDate", startDate);
        paramMap.put("endDate", endDate);
        return session.selectList(namespace + "selectPointsWithinDateRange", paramMap);
    }
}

 