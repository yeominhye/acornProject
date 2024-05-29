package com.acorn.project.map;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

@Component
public class MapsService implements MapsServiceI {
	@Inject
	MapsDAO dao;
	
	@Override
	public int count() throws Exception {
        return dao.count();
    }   
    
	@Override
	public Maps selectByBoard(String boardCode) throws Exception {
        return dao.selectByBoard(boardCode);
    }
    
	@Override
	public int insertMaps(Maps maps) throws Exception {
        return dao.insertMaps(maps);
    }
}
