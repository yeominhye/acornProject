package com.acorn.project.report.repository;

import java.util.List;

import com.acorn.project.report.domain.Report;

public interface ReportDAOI {

	List<Report> selectAll();

	int insert(Report report);

}