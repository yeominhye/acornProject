package com.acorn.project.map;

public interface MapsServiceI {

	int count() throws Exception;

	Maps selectByBoard(String boardCode) throws Exception;

	int insertMaps(Maps maps) throws Exception;

}
