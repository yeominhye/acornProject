package com.acorn.project.archive;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ArchiveService implements ArchiveServiceI {
	
	@Autowired
	ArchiveDAO dao;
	
	@Override
	public int insert(Archive archive) {
		return dao.insert(archive);
	}
	
	@Override
	public int delete(Archive archive) {
		return dao.delete(archive);
	}

	@Override
	public Archive checkArch(Archive archive) {
		return dao.selectOne(archive);
	}
	
}
