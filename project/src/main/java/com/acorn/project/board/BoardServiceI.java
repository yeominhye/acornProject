package com.acorn.project.board;

import java.util.List;

public interface BoardServiceI {
	
	int selectTotalCount();
	
	List<Board> getBoardBytype(int board_type,int Page);

	Board getBoardBycode(String board_code);
	
	int updateViews(Board board);
	
	List<Board> getBoardBytheme(String board_theme);
	
	List<Board> getBoardByuser(String user_id);
	
	List<Board> getInquByuser(String user_id);

	int regBoard(Board board);

	int modiBoard(Board board);

	int delBoard(String board_code);
	
	List<Board> getList(SearchCondition search);

}