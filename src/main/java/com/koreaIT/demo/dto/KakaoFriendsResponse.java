package com.koreaIT.demo.dto;
import lombok.Data;

@Data
public class KakaoFriendsResponse {
    private Long id;
    private String uuid;
    private Boolean favorite;
    private Integer profile_nickname;
    private String profile_thumbnail_image;
    private Integer total_count;
}