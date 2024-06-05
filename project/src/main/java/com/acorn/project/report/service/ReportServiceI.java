package com.acorn.project.report.service;

import java.util.List;

import com.acorn.project.report.domain.Report;

public interface ReportServiceI {

	int register(Report report);

	List<Report> getList();

}