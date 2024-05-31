package com.acorn.project.board;

import java.util.List;

public interface BoardDAOI {

	// 게시글 수
	int selectTotalCount(int boardType);
	
	// 목록 전체조회
	List<Board> selectAll( int boardType,  int currentPage);

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
	List<Board> getList(SearchCondition search, int cuurentPage);
	
	// 검색 내용 수
	int getListCount(SearchCondition search);

	RouteBoard selectRoute(String boardCode);

	int insertRoute(RouteBoard routeBoard) throws Exception;


}