package com.koreaIT.demo.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;


import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class KakaoLogout {
	private final WebClient webClient;
    private static final String TOKEN_URI = "https://kapi.kakao.com/v1/user/logout";

    public void doKakaoLogout(String token) {
        String uri = TOKEN_URI;
        System.out.println(uri);

        webClient.post()
                .uri(uri)
                .header("Authorization", "Bearer " + token);

    }

}
