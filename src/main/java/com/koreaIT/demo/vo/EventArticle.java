package com.koreaIT.demo.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EventArticle {
	private int id;
	private String regDate;
	private String updateDate;
	private String startDate;
	private String endDate;
	private String winningDate;
	private int memberId;
	private String name;
	private String title;
	private String kategorie;
	private String goods;
	private String needs;
	private int price;
	private String period;
	private String image;
	private String site;
	private int hitCount;
	private int save;
	private int progress;
	private String writerName;
	private boolean actorCanChangeData;
	private int goodReactionPoint;
}