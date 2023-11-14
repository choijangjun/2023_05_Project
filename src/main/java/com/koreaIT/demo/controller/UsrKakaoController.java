package com.koreaIT.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.dto.Friend;
import com.koreaIT.demo.dto.KakaoFriendsResponse;
import com.koreaIT.demo.dto.KakaoTokenResponse;
import com.koreaIT.demo.dto.KakaoUserInfoResponse;
import com.koreaIT.demo.service.EventArticleService;
import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.EventArticle;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.Rq;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UsrKakaoController {
	private final KakaoTokenJsonData kakaoTokenJsonData;
	private final KakaoUserInfo kakaoUserInfo;
	private final KakaoFriendsInfo kakaoFriendsInfo;
	private final KakaoMessage kakaoMessage;
	private final KakaoLogout kakaoLogout;
	private EventArticleService eventArticleService;
	private MemberService memberService;
	private Rq rq;
	
	@Autowired
	public UsrKakaoController(KakaoTokenJsonData kakaoTokenJsonData,KakaoUserInfo kakaoUserInfo, KakaoFriendsInfo kakaoFriendsInfo, KakaoMessage kakaoMessage, KakaoLogout kakaoLogout, EventArticleService eventArticleService, MemberService memberService, Rq rq) {
		this.kakaoTokenJsonData = kakaoTokenJsonData;
		this.kakaoUserInfo = kakaoUserInfo;
		this.kakaoFriendsInfo = kakaoFriendsInfo;
		this.kakaoMessage = kakaoMessage;
		this.kakaoLogout = kakaoLogout;
		this.eventArticleService = eventArticleService;
		this.memberService = memberService;
		this.rq = rq;
	}
	
	@RequestMapping("/usr/member/kakaoLogin")
	public String kakaoLogin(@RequestParam("code") String code, Model model) {
		
		String type = "kakaoLogin";
		
		
		log.info("인가 코드를 이용하여 토큰을 받습니다.{}", code);
		
        KakaoTokenResponse kakaoTokenResponse = kakaoTokenJsonData.getToken(type, code);
        log.info("토큰에 대한 정보입니다.{}",kakaoTokenResponse);
        
        KakaoUserInfoResponse userInfo = kakaoUserInfo.getUserInfo(kakaoTokenResponse.getAccess_token());
        log.info("회원 정보 입니다.{}",userInfo);
        
        Member member = memberService.getMemberByEmail(userInfo.getKakao_account().getEmail());
    	
        String email = userInfo.getKakao_account().getEmail();
        
    	if(member == null) {
    		model.addAttribute("email", email);
    		return "/usr/member/joinToKakao";
    		
    	} else if(member != null) {
    		
    		rq.login(member);   		
    	}
        
		return "redirect:/usr/eventArticle/listEventArticle";
	}
	
	@RequestMapping("/usr/member/kakaoLogout")
	public String kakaoLogout(@RequestParam("code") String code) {
		String type = "kakaoLogout";
		
		log.info("인가 코드를 이용하여 토큰을 받습니다.", code);
		
        KakaoTokenResponse kakaoTokenResponse = kakaoTokenJsonData.getToken(type, code);
        log.info("토큰에 대한 정보입니다.{}",kakaoTokenResponse);
        
        
        kakaoLogout.doKakaoLogout(kakaoTokenResponse.getAccess_token());
        
        rq.logout();
        
		return "redirect:/usr/eventArticle/listEventArticle";
	}
	
	@RequestMapping("/usr/member/kakaoMessage")
	public String kakaoMessage(@RequestParam("code") String code, String state, Model model) {
		String type = "kakaoMessage";
		log.info("인가 코드를 이용하여 토큰을 받습니다.", code);
		int id = Integer.parseInt(state);
        KakaoTokenResponse kakaoTokenResponse = kakaoTokenJsonData.getToken(type, code, id);
        log.info("토큰에 대한 정보입니다.{}",kakaoTokenResponse);
        
        KakaoFriendsResponse friendsInfo = kakaoFriendsInfo.getFreindsUuid(kakaoTokenResponse.getAccess_token());
        log.info("친구들의 정보 입니다.{}",friendsInfo);
        List<String> uuids = new ArrayList<String>();
        
        Friend[] friends = friendsInfo.getElements();
        for (int i = 0; i < friends.length; i++) {           
        		uuids.add(friends[i].getUuid());        
        	}
        
        log.info("친구들의 uuid정보 입니다.{}",uuids);
        
        EventArticle eventArticle = eventArticleService.getEventArticleMessage(id);
        kakaoMessage.doKakaoMessage(uuids, kakaoTokenResponse.getAccess_token(), eventArticle);
        
		return "redirect:/usr/eventArticle/listEventArticle";
	}
	
	@ResponseBody
	public String doKakaoLogin(String email) {
		
		Member member = memberService.getMemberByEmail(email);
		
		rq.login(member);
		
		return Util.jsReplace(Util.f("%s 회원님 환영합니다~!", member.getNickname()), "/");
	}
	
}