package com.koreaIT.demo.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;

import com.koreaIT.demo.dto.KakaoOauthCode;

import lombok.RequiredArgsConstructor;
import reactor.core.publisher.Flux;

@RequiredArgsConstructor
@Component
public class KakaoCode {
    private final WebClient webClient;
    private static final String CODE_URI = "https://kauth.kakao.com/oauth/authorize";
    private static final String RESPONSE_TYPE = "code";
    private static final String CLIENT_ID = "1ce061089c0f3113b3087e913c3f1f8a";
    private static final String REDIRECT_URI = "http://127.0.0.1:8082/usr/member/getToken";
    
    
    public KakaoOauthCode getOauthCode() {
    	String uri = CODE_URI + "?response_type=" + RESPONSE_TYPE + "&client_id=" + CLIENT_ID + "&redirect_uri=" + REDIRECT_URI;

    	Flux<KakaoOauthCode> response = webClient.get()
                .uri(uri)
                .retrieve()
                .bodyToFlux(KakaoOauthCode.class);

        return response.blockFirst();
    }
}