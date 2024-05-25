package com.acorn.project.index;

import org.json.JSONObject;

public class EventDTO2 {
	
	Object eventstartdate;
	Object eventenddate;
	Object eventhomepage;
	Object eventplace;
	Object sponsor1;
	Object sponsor2;
	Object sponsor2tel;
	Object subevent;
	Object usetimefestival;
	
public EventDTO2() {
	// TODO Auto-generated constructor stub
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

public Object getEventhomepage() {
	return eventhomepage;
}

public void setEventhomepage(Object eventhomepage) {
	this.eventhomepage = eventhomepage;
}

public Object getEventplace() {
	return eventplace;
}

public void setEventplace(Object eventplace) {
	this.eventplace = eventplace;
}

public Object getSponsor1() {
	return sponsor1;
}

public void setSponsor1(Object sponsor1) {
	this.sponsor1 = sponsor1;
}

public Object getSponsor2() {
	return sponsor2;
}

public void setSponsor2(Object sponsor2) {
	this.sponsor2 = sponsor2;
}

public Object getSponsor2tel() {
	return sponsor2tel;
}

public void setSponsor2tel(Object sponsor2tel) {
	this.sponsor2tel = sponsor2tel;
}

public Object getSubevent() {
	return subevent;
}

public void setSubevent(Object subevent) {
	this.subevent = subevent;
}

public Object getUsetimefestival() {
	return usetimefestival;
}

public void setUsetimefestival(Object usetimefestival) {
	this.usetimefestival = usetimefestival;
}

public EventDTO2(Object eventstartdate, Object eventenddate, Object eventhomepage, Object eventplace, Object sponsor1,
		Object sponsor2, Object sponsor2tel, Object subevent, Object usetimefestival) {
	super();
	this.eventstartdate = eventstartdate;
	this.eventenddate = eventenddate;
	this.eventhomepage = eventhomepage;
	this.eventplace = eventplace;
	this.sponsor1 = sponsor1;
	this.sponsor2 = sponsor2;
	this.sponsor2tel = sponsor2tel;
	this.subevent = subevent;
	this.usetimefestival = usetimefestival;
}


}
