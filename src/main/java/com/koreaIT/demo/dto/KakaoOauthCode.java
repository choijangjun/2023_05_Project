package com.koreaIT.demo.dto;

import lombok.Data;

@Data
public class KakaoOauthCode {
    private String code;
    private String error;
}