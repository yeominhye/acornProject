package com.acorn.project.map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MapsDAO implements MapsDAOI {

    @Autowired
    private SqlSession sqlSession; // sqlSession 변수명 수정: session -> sqlSession

    private static String namespace = "com.acorn.MapsMapper.";

    @Override
    public int count() throws Exception {
        return sqlSession.selectOne(namespace + "count");
    }

    @Override
    public Maps selectByBoard(String boardCode) throws Exception {
        Maps maps = sqlSession.selectOne(namespace + "selectMaps", boardCode);

        if (maps != null) {
            try {
                System.out.println("JSON Days: " + maps.getDays());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return maps;
    }

    @Override
    public int insertMaps(Maps maps) throws Exception {
        return sqlSession.insert(namespace + "insertMaps", maps);
    }
}
