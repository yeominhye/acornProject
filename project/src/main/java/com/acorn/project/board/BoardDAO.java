package com.acorn.project.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO implements BoardDAOI {
	
	@Autowired
	private SqlSession session;
	private String namespace = "com.acorn.boardMapper.";
	
	
	// 전체 목록 조회
	@Override
	public List<Board> selectAll( int boardType ,   int currentPage){
		
		 //현재페이지정보,  전체레코드수      // 1    1:5     // 2   == > 5-10
		int pageSize=15;
	 
		int start  =   (currentPage  -1) *pageSize  +1;
		int  end  =   currentPage * pageSize;
	 	
		Map info = new  HashMap();
		info.put("boardType",  boardType);
		info.put("start",  start);
		info.put("end", end);
		
		return session.selectList(namespace+"selectAll", info );
	}
	
	// 1개 상세조회
	@Override
	public Board selectOne(String board_code) {
		return session.selectOne(namespace+"selectOne", board_code);
	}
	
	// 상세조회 시 view증가
	@Override
	public int updateViews(Board board) {
		return session.update(namespace+"updateView", board);
	}
	
	// theme 조회
	@Override
	public List<Board> selectTheme(String board_theme) {
		return session.selectList(namespace+"selectTheme",board_theme);
	}
	
	// user_id로 조회
	@Override
	public List<Board> selectUser(String user_id) {
		return session.selectList(namespace+"selectMy",user_id);
	}
	
	// user_id+문의 조회
	@Override
	public List<Board> selectMyinqu(String user_id) {
		return session.selectList(namespace+"selectMyinqu",user_id);
	}
	
	// 게시판 등록
	@Override
	public int insertBoard(Board board) {
		return session.insert(namespace+"insert",board);
	}
	
	// 변경
	@Override
	public int updateBoard(Board board) {
		return session.update(namespace+"update",board);
	}
	
	// 삭제
	@Override
	public int deleteBoard(String board_code) {
		return session.delete(namespace+"delete",board_code);
	}
	
	// 제목, 작성자, 내용으로 검색
	@Override
	public List<Board> getList(SearchCondition search){
		return session.selectList(namespace+"selectSearch",search);
	}

	 

}
