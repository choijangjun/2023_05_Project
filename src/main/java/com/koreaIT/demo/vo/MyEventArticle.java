package com.koreaIT.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyEventArticle {
	private int id;
	private String regDate;
	private String updateDate;
	private int memberId;
	private String name;
	private String goods;
	private String needs;
	private int price;
	private String period;
	private String image;
	private String site;
	private int hitCount;
	private boolean end;
	private String writerName;
	private boolean actorCanChangeData;
	private int goodReactionPoint;
}