package com.acorn.project.comment;

import java.util.List;

public interface CommentServiceI {

	List<Comment> getCommentByCode(String code);
	
	int count(String boardCode);

	int register(Comment comment);

	int modify(Comment comment);

	int delete(String code);

}