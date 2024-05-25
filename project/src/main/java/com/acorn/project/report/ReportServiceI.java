package com.acorn.project.report;

import java.util.List;

public interface ReportServiceI {

	int register(Report report);

	List<Report> getList();

}