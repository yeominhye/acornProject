package com.acorn.project.board;

import java.util.List;

public interface BoardServiceI {
	
	int selectTotalCount(int boardType);
	
	List<Board> getBoardBytype(int board_type,int Page);

	Board getBoardBycode(String board_code);
	
	int updateViews(String boardCode);
	
	List<Board> getBoardBytheme(String board_theme);
	
	int selectUserCount(String user_id);
	
	List<Board> getBoardByuser(String user_id, int currentPage);
	
	int MyArchCount(String user_id);
	
	List<Board> selectUserArch(String user_id, int cuurentPage);
	
	List<Board> getInquByuser(String user_id);

	int regBoard(Board board);

	int modiBoard(Board board);

	int delBoard(String board_code);
	
	List<Board> getList(SearchCondition search, int page);
	
	int getListCount(SearchCondition search);

	RouteBoard selectRoute(String boardCode) throws Exception;

	int insertRoute(RouteBoard routeBoard) throws Exception;

	List<String> selectMyBuyBoard(String userCode);



}