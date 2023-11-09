package com.koreaIT.demo.dto;
import lombok.Data;

@Data
public class KakaoFriendsResponse {
    private Friend[] elements;
    private Integer total_count;
}