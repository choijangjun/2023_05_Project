package com.koreaIT.demo.dto;

import lombok.Data;

@Data
public class FailureInfo {
    private Integer code;
    private String msg;
    private String[] receiver_uuids;
}