package com.acorn.project.like;

public interface LikeServiceI {

	int incrLike(Like like);

	int decrLike(Like like);

	Like checkLike(Like like);
}