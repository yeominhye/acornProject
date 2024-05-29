package com.acorn.project.map;

import java.util.Map;

public interface MapsDAOI {

	Maps selectByBoard(String boardCode) throws Exception;

	int insertMaps(Maps maps) throws Exception;

	int count() throws Exception;
}
