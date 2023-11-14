package com.koreaIT.demo.dto;
import lombok.Data;

@Data
public class TextLink {
    private String object_type;
    private String text;
    private Link link;
}