package com.koreaIT.demo.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;

import com.koreaIT.demo.dto.KakaoFriendsResponse;

import lombok.RequiredArgsConstructor;
import reactor.core.publisher.Flux;

@Component
@RequiredArgsConstructor
public class KakaoFriendsInfo {
	private final WebClient webClient;
    private static final String getFrieds_URI = "https://kapi.kakao.com/v1/api/talk/friends";
    
    public KakaoFriendsResponse getFreindsUuid(String token) {
        String uri = getFrieds_URI;
        System.out.println(uri);
        
        Flux<KakaoFriendsResponse> response = webClient.get()
                .uri(uri)
                .header("Authorization", "Bearer " + token)
                .retrieve()
                .bodyToFlux(KakaoFriendsResponse.class);

        return response.blockFirst();
    }

}
