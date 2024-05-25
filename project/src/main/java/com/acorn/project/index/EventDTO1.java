package com.acorn.project.index;

import org.json.JSONObject;

public class EventDTO1 {
	
	Object title;
	Object firstimage;
	Object addr1;
	Object addr2;
	Object eventstartdate;
	Object eventenddate;
	Object contentid;
	Object contenttypeid;
	
	public EventDTO1() {
		// TODO Auto-generated constructor stub
	}

	public Object getTitle() {
		return title;
	}

	public void setTitle(Object title) {
		this.title = title;
	}

	public Object getFirstimage() {
		return firstimage;
	}

	public void setFirstimage(Object firstimage) {
		this.firstimage = firstimage;
	}

	public Object getAddr1() {
		return addr1;
	}

	public void setAddr1(Object addr1) {
		this.addr1 = addr1;
	}

	public Object getAddr2() {
		return addr2;
	}

	public void setAddr2(Object addr2) {
		this.addr2 = addr2;
	}

	public Object getEventstartdate() {
		return eventstartdate;
	}

	public void setEventstartdate(Object eventstartdate) {
		this.eventstartdate = eventstartdate;
	}

	public Object getEventenddate() {
		return eventenddate;
	}

	public void setEventenddate(Object eventenddate) {
		this.eventenddate = eventenddate;
	}



	public Object getContentid() {
		return contentid;
	}

	public void setContentid(Object contentid) {
		this.contentid = contentid;
	}

	public Object getContenttypeid() {
		return contenttypeid;
	}

	public void setContenttypeid(Object contenttypeid) {
		this.contenttypeid = contenttypeid;
	}

	public EventDTO1(Object title, Object firstimage, Object addr1, Object addr2, Object eventstartdate,
			Object eventenddate, Object contentid, Object contenttypeid) {
		super();
		this.title = title;
		this.firstimage = firstimage;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.eventstartdate = eventstartdate;
		this.eventenddate = eventenddate;
		this.contentid = contentid;
		this.contenttypeid = contenttypeid;
	}

}