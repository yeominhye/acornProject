package com.acorn.project.board;

import java.util.List;

public interface BoardDAOI {

	// 목록 전체조회
	List<Board> selectAll(int board_type);

	// 1개 상세조회
	Board selectOne(String board_code);
	
	// 상세조회 시 view증가
	int updateViews(Board board);
	
	// theme로 조회
	List<Board> selectTheme(String board_theme);
	
	// user_id로 조회
	List<Board> selectUser(String user_id);
	
	// user_id+문의 조회
	List<Board> selectMyinqu(String user_id);
	
	// 게시판 등록
	int insertBoard(Board board);

	// 변경
	int updateBoard(Board board);

	// 삭제
	int deleteBoard(String board_code);

	// 제목, 작성자, 내용으로 검색
	List<Board> getList(SearchCondition search);

}