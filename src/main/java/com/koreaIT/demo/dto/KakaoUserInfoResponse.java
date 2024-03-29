package com.koreaIT.demo.dto;

import lombok.Data;

@Data
public class KakaoUserInfoResponse {
    private Long id;
    private String connected_at;
    private KakaoAccount kakao_account;
}