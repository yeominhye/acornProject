package com.acorn.project.index;

import org.json.JSONObject;

public class TourDTO3 {
	
	Object expguide;
	Object infocenter;
	Object restdate;
	Object parking;
	
public TourDTO3() {
	// TODO Auto-generated constructor stub
}

public Object getExpguide() {
	return expguide;
}

public void setExpguide(Object expguide) {
	this.expguide = expguide;
}

public Object getInfocenter() {
	return infocenter;
}

public void setInfocenter(Object infocenter) {
	this.infocenter = infocenter;
}

public Object getRestdate() {
	return restdate;
}

public void setRestdate(Object restdate) {
	this.restdate = restdate;
}

public Object getParking() {
	return parking;
}

public void setParking(Object parking) {
	this.parking = parking;
}

public TourDTO3(Object expguide, Object infocenter, Object restdate, Object parking) {
	super();
	this.expguide = expguide;
	this.infocenter = infocenter;
	this.restdate = restdate;
	this.parking = parking;
}



}
