package com.acorn.project.point;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.acorn.project.user.domain.User;
import com.acorn.project.user.repository.UserDAO;
import com.acorn.project.user.repository.UserDAOI;
import com.acorn.project.point.domain.Point;
import com.acorn.project.point.repository.PointDAO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml" , "file:src/main/webapp/WEB-INF/spring/**/test.xml"} )
 
public class PointDaoTest {	
	@Autowired
	 PointDAO dao;
  
	//@Test
	public void test() throws Exception {
		int count = dao.count();
		assertTrue(count >= 1);
	}
	
	//@Test
	public void selectAllTest() throws Exception {
		System.out.println("All : ");
		System.out.println(dao.selectAll());
		assertTrue(dao.selectAll().size() >= 1);
	}
	
	//@Test
	public void buyBoardTest() throws Exception {
	    Point point = new Point();
	    point.setBoardCode("b0002");
	    point.setPointAmount(100);
	    User user = new User();
	}
	
	@Test
	public void buyPointTest() throws Exception {
		String userCode = "u0001";
		int pointAmount = 100;
		int result = dao.buyPoint(pointAmount, userCode);
		assertTrue(result == 1);
		
	}
}
