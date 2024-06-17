package com.acorn.project.kakaologin.service;

import java.util.List;

import com.acorn.project.kakaologin.domain.KakaoUserDTO;

public interface KakaoMemberServiceI {
	
	// 카카오 유저 저장
	public int registerMember(KakaoUserDTO kakaoUserDTO);
	//카카오 유저 조회
	public List<KakaoUserDTO> getMemberList();
}
