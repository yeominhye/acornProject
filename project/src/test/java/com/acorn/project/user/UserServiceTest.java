package com.acorn.project.user;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.acorn.project.user.UserServiceI;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml" , "file:src/main/webapp/WEB-INF/spring/**/test.xml"} )
public class UserServiceTest {
	
	@Autowired
	UserServiceI service;

	
	
	// @Test
	public void test1() throws Exception {
		System.out.println(service.getUserById("test05"));
		assertNotNull(service.getUserById("test05"));
	}
	
	@Test
    public void testFindUserId() throws Exception {
        // 테스트에 사용할 사용자 이름과 전화번호
        String userName = "John Doe";
        String userTel = "123-456-7890";
        
        String userId = service.findUserId(userName, userTel);
        System.out.println("User ID: " + userId);

        // 검증
        // 사용자 ID가 null이 아니면서 비어 있지 않은 경우
        assertNotNull(userId);
        assertFalse(userId.isEmpty());
    }
	
	
	@Test
    public void testFindUserPw() throws Exception {
        // 테스트에 사용할 사용자 이름과 전화번호
		String userId = "example_id";
        String userName = "John Doe";
        String userTel = "123-456-7890";
        
        String userPw = service.findUserPw(userId, userName, userTel);
        System.out.println("User Pw: " + userPw);

        // 검증
        // 사용자 ID가 null이 아니면서 비어 있지 않은 경우
        assertNotNull(userPw);
        assertFalse(userPw.isEmpty());
	}
	
	
	@Test
    public void testUpdatePassword() throws Exception {
        String userId = "example_id";
        String newPw = "1234";
        int affectedRows = service.updateUserPw(userId, newPw);

        System.out.println("Number of affected rows: " + affectedRows);

        assertTrue(affectedRows >= 1);
    }
	
//	@Test
//	public void test2() throws Exception {
//		Member member = new Member("test11","1234","장주원","010-2222-2222");
//		int result = service.regMember(member);
//		System.out.println(result);
//		assertTrue(result == 1);
//	}
//	
//	@Test
//	public void test3() throws Exception {
//		Member member = new Member("test11","88","장주원","010-77-2222");
//		int result = service.modMember(member);
//		System.out.println(result);
//		assertTrue(result == 1);
//	}
	
	//@Test
	public void test4() throws Exception {
		int result = service.delUser("test11");
		System.out.println(result);
		assertTrue(result == 1);
	}
//	
//	@Test
//	public void test5() {
//		Member member = new Member("test05", "1111", "aaa", "0220");
//		assertNotNull(service.loginCheck(member));
//		System.out.println(service.loginCheck(member));
//	}
	
	
	
	
	@Test
	public void test6() throws Exception {
		System.out.println(service.getUserList());
		assertTrue(service.getUserList().size() >= 1);
	}
}
