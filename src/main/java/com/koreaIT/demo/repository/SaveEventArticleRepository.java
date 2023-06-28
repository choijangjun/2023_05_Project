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

	public List<EventArticle> getSaveEventArticles(int loginedMemberId, String searchKeyword, int progress);

	public int getSaveEventArticleCnt(int loginedMemberId, String searchKeyword, int progress);

}