package com.acorn.project.user;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.acorn.project.user.domain.User;
import com.acorn.project.user.repository.UserDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml" , "file:src/main/webapp/WEB-INF/spring/**/test.xml"} )
 
public class UserDaoTest {	
	@Autowired
	 UserDAO dao;
  
	// @Test
	public void test() throws Exception {
		int count = dao.count();
		assertTrue(count >= 1);
	}
	
	// @Test
	public void test2() throws Exception {
		int count = dao.nicknameCheck("n0001");
		System.out.println(count);
		assertTrue(count >= 1);
	}
	
	
	
	// @Test
    public void testFindUserId() throws Exception {
        String userName = "John Doe";
        String userTel = "123-456-7890";
        
        String userId = dao.findUserId(userName, userTel);
        System.out.println("User ID: " + userId);

        assertNotNull(userId);
        assertFalse(userId.isEmpty());
    }
	
	
	// @Test
    public void testFindUserPw() throws Exception {
		String userId = "example_id";
        String userName = "John Doe";
        String userTel = "123-456-7890";
        
        
        String userPw = dao.findUserPw(userId, userName, userTel);
        System.out.println("User Pw: " + userPw);

        assertNotNull(userPw);
        assertFalse(userPw.isEmpty());
    }
	
	// @Test
    public void testUpdatePassword() throws Exception {
        String userId = "example_id";
        String newPassword = "123";
        int affectedRows = dao.updateUserPw(userId, newPassword);

        System.out.println("Number of affected rows: " + affectedRows);

        assertTrue(affectedRows >= 1);
    }
	
    @Test
    public void test3() throws Exception {
        try {
            User user = dao.selectById("example_id");
            System.out.println(user.getUserPoint());
            int pointAmount = 100;
            int result = dao.updatePoint(pointAmount, user);
            assertTrue(result == 1);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
