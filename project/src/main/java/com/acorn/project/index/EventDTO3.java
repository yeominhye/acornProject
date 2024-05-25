package com.acorn.project.index;

import org.json.JSONObject;

public class EventDTO3 {
	
	Object firstimage;
	Object overview;
	Object mapx;
	Object mapy;
	Object mlevel;
	Object title;
	Object addr1;
	
public EventDTO3() {
	// TODO Auto-generated constructor stub
}

public Object getFirstimage() {
	return firstimage;
}

public void setFirstimage(Object firstimage) {
	this.firstimage = firstimage;
}

public Object getOverview() {
	return overview;
}

public void setOverview(Object overview) {
	this.overview = overview;
}

public Object getMapx() {
	return mapx;
}

public void setMapx(Object mapx) {
	this.mapx = mapx;
}

public Object getMapy() {
	return mapy;
}

public void setMapy(Object mapy) {
	this.mapy = mapy;
}

public Object getMlevel() {
	return mlevel;
}

public void setMlevel(Object mlevel) {
	this.mlevel = mlevel;
}

public Object getTitle() {
	return title;
}

public void setTitle(Object title) {
	this.title = title;
}

public Object getAddr1() {
	return addr1;
}

public void setAddr1(Object addr1) {
	this.addr1 = addr1;
}

public EventDTO3(Object firstimage, Object overview, Object mapx, Object mapy, Object mlevel, Object title,
		Object addr1) {
	super();
	this.firstimage = firstimage;
	this.overview = overview;
	this.mapx = mapx;
	this.mapy = mapy;
	this.mlevel = mlevel;
	this.title = title;
	this.addr1 = addr1;
}


}
