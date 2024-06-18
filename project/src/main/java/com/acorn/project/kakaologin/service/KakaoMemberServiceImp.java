//package com.acorn.project.kakaologin.service;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.acorn.project.kakaologin.domain.KakaoUserDTO;
//import com.acorn.project.kakaologin.repository.KakaoMemberRepositoryI;
//
//@Service
//public class KakaoMemberServiceImp implements KakaoMemberServiceI {
//
//	@Autowired
//	KakaoMemberRepositoryI dao;
//
//	@Override
//	public int registerMember(KakaoUserDTO kakaoUserDTO) {
//		// TODO Auto-generated method stub
//		// 카카오 유저 정보 저장
//		return dao.insert(kakaoUserDTO);
//	}
//
//	@Override
//	public List<KakaoUserDTO> getMemberList() {
//		// TODO Auto-generated method stub
//		// 카카오 유저 조회
//		return dao.selectAll();
//	}
//
//}
