package com.acorn.project.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportService implements ReportServiceI {
	
	@Autowired
	ReportDAO dao;
	
	
	@Override
	public int register (Report report) {
		return dao.insert(report);
	}
	
	@Override
	public List<Report> getList(){
		return dao.selectAll();
	}
}
