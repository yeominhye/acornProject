package com.acorn.project.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentService implements CommentServiceI {
	
	@Autowired
	CommentDAOI dao;
	
	@Override
	public List<Comment> getCommentByCode(String code){
		return dao.selectByBoard(code);
	}
	
	@Override
	public int count(String boardCode) {
		return dao.count(boardCode);
	}
	
	@Override
	public int register(Comment comment) {
		return dao.insert(comment);
	}
	
	@Override
	public int modify(Comment comment) {
		return dao.update(comment);
	}
	
	@Override
	public int delete(String code) {
		return dao.delete(code);
	}

	
}
