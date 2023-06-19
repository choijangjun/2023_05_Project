package com.koreaIT.demo.repository;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.koreaIT.demo.vo.EventArticle;
import com.koreaIT.demo.vo.SaveEventArticle;

@Mapper
public interface SaveEventArticleRepository {
	
	public void doInsertSaveEventArticle(int loginedMemberId, int relId, String relTypeCode);
	
	public void doDeleteSaveEventArticle(int loginedMemberId, int relId, String relTypeCode);

	public SaveEventArticle getSaveEventArticle(int loginedMemberId, int relId, String relTypeCode);

	public List<EventArticle> getSaveEventArticles(int loginedMemberId, String searchKeyword, int limitStart, int itemsInAPage);

	public int getSaveEventArticleCnt(int loginedMemberId, String searchKeyword);

	public int getProgressSaveEventArticleCnt(int loginedMemberId, String searchKeyword);

	public int getEndSaveEventArticleCnt(int loginedMemberId, String searchKeyword);

	public List<EventArticle> getProgressSaveEventArticles(int loginedMemberId, String searchKeyword, int limitStart,
			int itemsInAPage);

	public List<EventArticle> getEndSaveEventArticles(int loginedMemberId, String searchKeyword, int limitStart,
			int itemsInAPage);


	
}