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
	
	@Override
	// 게시판 수
	public int selectTotalCount(int boardType) {
		return session.selectOne(namespace+"selectTotalCount",boardType);
	}
	
	// 전체 목록 조회
	@Override
	public List<Board> selectAll( int boardType ,   int currentPage){
		
		 //현재페이지정보,  전체레코드수      
	  	int  pageSize  =   15;		
		 int offset = (currentPage - 1) * pageSize;  
	 	
		
	 	
		Map info = new  HashMap();
		info.put("boardType",  boardType);
		info.put("offset",  offset);   
		info.put("pageSize", pageSize);
		
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
	
	@Override
	public int selectUserCount(String user_id) {
		return session.selectOne(namespace+"selectMyCount", user_id);
	}
	
	// user_id로 조회
	@Override
	public List<Board> selectUser(String user_id, int currentPage) {
		
		 //현재페이지정보,  전체레코드수      
	  	int  pageSize  =   10;		
		 int offset = (currentPage - 1) * pageSize;  

		Map<String, Object> info = new  HashMap();
		info.put("userId", user_id);
		info.put("offset",  offset);   
		info.put("pageSize", pageSize);
		
		return session.selectList(namespace+"selectMy",info);
	}
	
	@Override
	public int MyArchCount(String user_id) {
		return session.selectOne(namespace+"MyArchCount",user_id);
	}
	
	// userId로 스크랩조회
	@Override
	public List<Board> selectUserArch(String user_id, int currentPage){
		//현재페이지정보,  전체레코드수      
	  	int  pageSize  =   10;		
		 int offset = (currentPage - 1) * pageSize;  

		Map<String, Object> info = new  HashMap();
		info.put("userId", user_id);
		info.put("offset",  offset);   
		info.put("pageSize", pageSize);
		
		return session.selectList(namespace+"selectMyarchive",info);
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
	public List<Board> getList(SearchCondition search, int currentPage){		
		
		int pageSize=15;	
		int  start  =   (currentPage  -1) *pageSize;
	 	search.setStart(start);

		return session.selectList(namespace+"selectSearch",search);
	}
	
	// 검색 내용 수
	@Override
	public int getListCount(SearchCondition search) {
		return session.selectOne(namespace+"selectSearchCount", search);
	}

	@Override
	public RouteBoard selectRoute(String boardCode) { 
		return session.selectOne(namespace+"selectRoute", boardCode);
	}
	 
	
	@Override
	 public int insertRoute(RouteBoard routeBoard) throws Exception {
	    return session.insert(namespace + "insertRoute", routeBoard);
	}

}
