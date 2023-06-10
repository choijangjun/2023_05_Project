package com.koreaIT.demo.repository;


import org.apache.ibatis.annotations.Mapper;

import com.koreaIT.demo.vo.SaveEventArticle;

@Mapper
public interface SaveEventArticleRepository {
	
	public void doInsertSaveEventArticle(int loginedMemberId, int relId, String relTypeCode);
	
	public void doDeleteSaveEventArticle(int loginedMemberId, int relId, String relTypeCode);

	public SaveEventArticle getSaveEventArticle(int loginedMemberId, int relId, String relTypeCode);

	
}