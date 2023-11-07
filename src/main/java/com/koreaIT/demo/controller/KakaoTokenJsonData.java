package com.koreaIT.demo.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;

import com.koreaIT.demo.dto.KakaoTokenResponse;

import lombok.RequiredArgsConstructor;
import reactor.core.publisher.Mono;

@Component
@RequiredArgsConstructor
public class KakaoTokenJsonData {
	private final WebClient webClient;
    private static final String TOKEN_URI = "https://kauth.kakao.com/oauth/token";
    private static String REDIRECT_URI;
    private static final String GRANT_TYPE = "authorization_code";
    private static final String CLIENT_ID = "1ce061089c0f3113b3087e913c3f1f8a";

    public KakaoTokenResponse getToken(String type, String code) {
    	if(type == "kakaoLogin") {
    		REDIRECT_URI = "http://127.0.0.1:8082/usr/member/kakaoLogin";
    	} else if(type == "kakaoMessage") {
    		REDIRECT_URI = "http://127.0.0.1:8082/usr/member/kakaoMessage";
    	} else if(type == "kakaoLogout") {
    		REDIRECT_URI = "http://127.0.0.1:8082/usr/member/kakaoLogout";
    	}
        String uri = TOKEN_URI + "?grant_type=" + GRANT_TYPE + "&client_id=" + CLIENT_ID + "&redirect_uri=" + REDIRECT_URI + "&code=" + code;
        System.out.println(uri);

        Mono<KakaoTokenResponse> response = webClient.post()
                .uri(uri)
                .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                .retrieve()
                .bodyToMono(KakaoTokenResponse.class);

        return response.block();
    }

}
