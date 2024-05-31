package com.acorn.project.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
public class BoardService implements BoardServiceI {
	
	@Autowired
	BoardDAO dao;
	
	@Override
	public int selectTotalCount(int boardType) {
		return dao.selectTotalCount(boardType);
	}
	
	@Override
	public List<Board> getBoardBytype(int boardType, int currentPage){		
		return dao.selectAll(  boardType, currentPage  );
	}

	@Override
	public Board getBoardBycode(String board_code) {
		return dao.selectOne(board_code);
	}
	
	@Override
	public int updateViews(Board board) {
		return dao.updateViews(board);
	}
	
	@Override
	public List<Board> getBoardBytheme(String board_theme) {
		return dao.selectTheme(board_theme);
	}
	
	@Override
	public int selectUserCount(String user_id) {
		return dao.selectUserCount(user_id);
	}
	
	@Override
	public List<Board> getBoardByuser(String user_id, int currentPage) {
		return dao.selectUser(user_id, currentPage);
	}
	
	@Override
	public int MyArchCount(String user_id) {
		return dao.MyArchCount(user_id);
	}
	
	@Override
	public List<Board> selectUserArch(String user_id, int currentPage){
		return dao.selectUserArch(user_id, currentPage);
	}
	
	@Override
	public List<Board> getInquByuser(String user_id) {
		return dao.selectMyinqu(user_id);
	}

	
	@Override
	public int regBoard(Board board) {
		return dao.insertBoard(board);
	}
	
	@Override
	public int modiBoard(Board board) {
		return dao.updateBoard(board);
	}
	
	@Override
	public int delBoard(String board_code) {
		return dao.deleteBoard(board_code);
	}

	@Override
	public List<Board> getList(SearchCondition search, int currentPage) {
		return dao.getList(search, currentPage);
	}
	
	@Override
	public int getListCount(SearchCondition search) {
		return dao.getListCount(search);
	}


	@Override
	public RouteBoard selectRoute(String boardCode) throws Exception {
        return dao.selectRoute(boardCode);
    }
    
	@Override
	public int insertRoute(RouteBoard routeBoard) throws Exception {
        return dao.insertRoute(routeBoard);
    }
}
