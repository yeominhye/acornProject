package com.acorn.project.archive;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ArchiveDAO implements ArchiveDAOI {

	@Autowired
	private SqlSession session;
	private String namespace = "com.acorn.archiveMapper.";
	
	@Override
	public int insert(Archive archive) {
		return session.insert(namespace+"insert", archive);
	}
	
	@Override
	public int delete(Archive archive) {
		return session.delete(namespace+"delete", archive);
	}

	@Override
	public Archive selectOne(Archive archive) {
		return session.selectOne(namespace+"selectOne", archive);
	}
}