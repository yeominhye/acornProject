package com.acorn.project.like;

public interface LikeDAOI {

	int insertLike(Like like);

	int deleteLike(Like like);
	
	Like selectOne(Like like);

}