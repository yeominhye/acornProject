package com.acorn.project.report.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.project.report.domain.Report;

@Repository
public class ReportDAO implements ReportDAOI {
	
	@Autowired
	private SqlSession session;
	private String namespace="com.acorn.reportMapper.";
	
	
	@Override
	public List<Report> selectAll(){
		return session.selectList(namespace+"selectAll");
	}
	
	
	@Override
	public int insert(Report report) {
		return session.insert(namespace+"insert", report);
	}
}
