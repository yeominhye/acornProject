package com.acorn.project.comment;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/test.xml" , "file:src/main/webapp/WEB-INF/spring/**/root-context.xml"} )
public class CommentDAOTest {

	@Autowired
	CommentDAO dao;
	
	@Test
	public void test() {
		String boardCode ="b0003";
		System.out.println(dao.count(boardCode));
		assertTrue(dao.count(boardCode)==3);
	}

}
