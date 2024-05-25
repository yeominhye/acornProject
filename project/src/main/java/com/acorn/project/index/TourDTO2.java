package com.acorn.project.index;

import org.json.JSONObject;

public class TourDTO2 {
	
	Object title;
	Object tel;
	Object firstimage;
	Object homepage;
	Object addr1;
	Object overview;
	
public TourDTO2() {
	// TODO Auto-generated constructor stub
}

public Object getTitle() {
	return title;
}

public void setTitle(Object title) {
	this.title = title;
}

public Object getTel() {
	return tel;
}

public void setTel(Object tel) {
	this.tel = tel;
}

public Object getFirstimage() {
	return firstimage;
}

public void setFirstimage(Object firstimage) {
	this.firstimage = firstimage;
}

public Object getHomepage() {
	return homepage;
}

public void setHomepage(Object homepage) {
	this.homepage = homepage;
}

public Object getAddr1() {
	return addr1;
}

public void setAddr1(Object addr1) {
	this.addr1 = addr1;
}

public Object getOverview() {
	return overview;
}

public void setOverview(Object overview) {
	this.overview = overview;
}

public TourDTO2(Object title, Object tel, Object firstimage, Object homepage, Object addr1, Object overview) {
	super();
	this.title = title;
	this.tel = tel;
	this.firstimage = firstimage;
	this.homepage = homepage;
	this.addr1 = addr1;
	this.overview = overview;
}



}
