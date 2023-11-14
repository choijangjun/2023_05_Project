package com.koreaIT.demo.controller;
import java.util.HashMap;
import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;

import com.google.gson.Gson;
import com.koreaIT.demo.dto.FailureInfo;
import com.koreaIT.demo.service.SaveEventArticleService;
import com.koreaIT.demo.vo.EventArticle;
import com.koreaIT.demo.vo.Rq;
import com.koreaIT.demo.vo.SaveEventArticle;

import lombok.RequiredArgsConstructor;
import reactor.core.publisher.Mono;

@Component
@RequiredArgsConstructor
public class KakaoMessage {
	private final WebClient webClient;
    private static final String TOKEN_URI ="https://kapi.kakao.com/v1/api/talk/friends/message/send";
    private static final String TEMPLATE_ID = "100581";
    
//    private static final Object TEMPLATE_ARGRS;
    
    public FailureInfo doKakaoMessage(List<String> uuids, String token, EventArticle eventArticle) {
    	
    	System.out.println(eventArticle);
    	
    	Gson gson = new Gson();
    	
    	String jsonUuids = gson.toJson(uuids);
    	
    	HashMap<String, String> TEMPLATE_ARGRS = new HashMap<String, String>();
    	
    	
    	TEMPLATE_ARGRS.put("${TITLE}", eventArticle.getTitle());
    	TEMPLATE_ARGRS.put("BODY", eventArticle.getSite());
    	
    	String template = gson.toJson(TEMPLATE_ARGRS);
    	
    	String uri = TOKEN_URI + "?template_id=" + TEMPLATE_ID + "&template_args=" + template + "&receiver_uuids=" + jsonUuids;
       
    	
    	Mono<FailureInfo> response = webClient.post()
                .uri(uri)
                .header("Authorization", "Bearer " + token)
                .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                .retrieve()
                .bodyToMono(FailureInfo.class);
        return response.block();
    }

}
