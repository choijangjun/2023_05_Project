package com.koreaIT.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.koreaIT.demo.service.AuthService;
import com.koreaIT.demo.service.CustomMessageService;

@RestController
public class BaseController {

	@Autowired 
	AuthService authService;

	@Autowired
	CustomMessageService customMEssageService;

	@RequestMapping("/kakaotalk")
	public String serviceStart(String code) {
		if(authService.getKakaoAuthToken(code)) {
			customMEssageService.sendMyMessage();
			return "메시지 전송 성공";
		}else {
			return "토큰발급 실패";
		}
	} 
}