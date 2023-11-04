package com.koreaIT.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.dto.KakaoTokenResponse;
import com.koreaIT.demo.dto.KakaoUserInfoResponse;
import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.Rq;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UsrKakaoController {
	private final KakaoTokenJsonData kakaoTokenJsonData;
	private final KakaoUserInfo kakaoUserInfo;
	private MemberService memberService;
	private Rq rq;
	
	@Autowired
	public UsrKakaoController(KakaoTokenJsonData kakaoTokenJsonData,KakaoUserInfo kakaoUserInfo,  MemberService memberService, Rq rq) {
		this.kakaoTokenJsonData = kakaoTokenJsonData;
		this.kakaoUserInfo = kakaoUserInfo;
		this.memberService = memberService;
		this.rq = rq;
	}
	
	@RequestMapping("/usr/member/kakaoOauth")
	public String kakaoOauth(@RequestParam("code") String code, Model model) {
		
		log.info("인가 코드를 이용하여 토큰을 받습니다.", code);
		
        KakaoTokenResponse kakaoTokenResponse = kakaoTokenJsonData.getToken(code);
        log.info("토큰에 대한 정보입니다.{}",kakaoTokenResponse);
        
        KakaoUserInfoResponse userInfo = kakaoUserInfo.getUserInfo(kakaoTokenResponse.getAccess_token());
        log.info("회원 정보 입니다.{}",userInfo);
        
        Member member = memberService.getMemberByEmail(userInfo.getKakao_account().getEmail());
    	
        String email = userInfo.getKakao_account().getEmail();
        
    	if(member == null) {
    		model.addAttribute("email", email);
    		return "/usr/member/joinToKakao";
    		
    	} else if(member != null) {
    		
    		doKakaoLogin(member.getEmail());
    		
    	}
        
		return "redirect:/usr/eventArticle/listEventArticle";
	}
	
	
	@ResponseBody
	public String doKakaoLogin(String email) {
		
		Member member = memberService.getMemberByEmail(email);
		
		rq.login(member);
		
		return Util.jsReplace(Util.f("%s 회원님 환영합니다~!", member.getNickname()), "/");
	}
	
}