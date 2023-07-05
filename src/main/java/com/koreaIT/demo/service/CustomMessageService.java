package com.koreaIT.demo.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreaIT.demo.dto.DefaultMessageDto;

@Service
public class CustomMessageService {

	@Autowired
	MessageService messageService;

	public boolean sendMyMessage() {
		DefaultMessageDto myMsg = new DefaultMessageDto();
		myMsg.setBtnTitle("이벤트 자세히 보러가기");
		myMsg.setWebUrl("");
		myMsg.setObjType("text");
		myMsg.setMobileUrl("");
		myMsg.setText("https://www.musinsa.com/event/raffles?raffles_include_state=A");

		String accessToken = AuthService.authToken;

		return messageService.sendMessage(accessToken, myMsg);
	}
}