package com.koreaIT.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileVO {
	private int id;
	private String orgNm;
	private String savedNm;
	private String savedPath;
	private String relTypeCode;
	private int relId;
}