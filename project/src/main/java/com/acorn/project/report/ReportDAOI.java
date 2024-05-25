package com.acorn.project.report;

import java.util.List;

public interface ReportDAOI {

	List<Report> selectAll();

	int insert(Report report);

}