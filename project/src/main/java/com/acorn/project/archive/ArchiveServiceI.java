package com.acorn.project.archive;

public interface ArchiveServiceI {

	int insert(Archive archive);

	int delete(Archive archive);

	Archive checkArch(Archive archive);

}