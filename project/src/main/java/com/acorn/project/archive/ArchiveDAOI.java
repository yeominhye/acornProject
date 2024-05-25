package com.acorn.project.archive;



public interface ArchiveDAOI {

	int insert(Archive archive);

	int delete(Archive archive);

	Archive selectOne(Archive archive);

}