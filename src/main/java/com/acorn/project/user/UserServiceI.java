package com.acorn.project.user;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface UserServiceI {

	User getUserById(String user_id) throws Exception;

	List<User> getUserList() throws Exception;

	int regUser(User user) throws Exception;

	int modUser(User user) throws Exception;

	int delUser(String userId) throws Exception;

	User loginCheck(User user, HttpSession session);
	
	void logout(HttpSession session);
	
	int nicknameCheck(String nickname);
	
	int userTelCheck(String nickname);
	
	String findUserId(String userName, String userTel);

	String findUserPw(String userId, String userName, String userTel);

	int updateUserPw(String userId, String newPw);
	
	int updatePoint(int pointAmount, User user);
}