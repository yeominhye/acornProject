package com.acorn.project.event;

import org.json.JSONObject;

import com.acorn.project.like.Like;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class EventDTO3 {
	
	Object firstimage;
	Object overview;
	double mapx;
	double mapy;
	Object addr1;
	Object title;

}