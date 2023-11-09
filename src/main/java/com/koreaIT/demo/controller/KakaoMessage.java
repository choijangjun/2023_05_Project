package com.koreaIT.demo.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;

import com.koreaIT.demo.dto.FailureInfo;

import lombok.RequiredArgsConstructor;
import reactor.core.publisher.Mono;

@Component
@RequiredArgsConstructor
public class KakaoMessage {
	private final WebClient webClient;
    private static final String TOKEN_URI ="https://kapi.kakao.com/v1/api/talk/friends/message/send";
    private static final String TEMPLATE_ID = "95647";
    
    public FailureInfo doKakaoMessage(String[] firstUuid, String token) {
        String uri = TOKEN_URI + "?template_id=" + TEMPLATE_ID + "&receiver_uuids=" + "[\"rZykkKeTpJOmirmKuY62gbeOopuom6Kars0\"]";
        System.out.println(uri);

        Mono<FailureInfo> response = webClient.post()
                .uri(uri)
                .header("Authorization", "Bearer " + token)
                .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                .retrieve()
                .bodyToMono(FailureInfo.class);
        return response.block();
    }

}
