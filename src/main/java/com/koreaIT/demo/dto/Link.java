package com.koreaIT.demo.dto;
import lombok.Data;

@Data
public class Link {
    private String web_url;
    private String mobile_web_url;
    private String android_execution_params;
    private String ios_execution_params;
}