//package com.acorn.project.kakaologin.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.acorn.project.kakaologin.service.KakaoMemberServiceI;
// 
//
//@Controller
//public class KakaoController {
//
//	@Autowired
//	KakaoMemberServiceI service;
//
// 
//
//	@GetMapping("/login")
//	public String logintest() {
//		// 유저 로그인
//		return "/login/login";
//	}
//
//	@PostMapping("/kakaoForm")
//	public String sendData(@RequestParam String user_kakao, @RequestParam String nickname,
//			@RequestParam String profile_image, Model model) {
//		// 카카오 api호출 
//		model.addAttribute("user_kakao", user_kakao);
//		model.addAttribute("nickname", nickname);
//		model.addAttribute("profile_image", profile_image);
//		return "/saveUser/saveUser";
//	}
//
// 
//}
