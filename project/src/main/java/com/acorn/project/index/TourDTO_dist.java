package com.acorn.project.index;

import com.acorn.project.like.Like;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class TourDTO_dist {
	Object title;
	Object firstimage;
	Object addr1;
	Object addr2;
	double dist;
	Object contentid;
	Object contenttypeid;
	double mapx;
	double mapy;
	
}