package com.koreaIT.demo.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreaIT.demo.repository.SaveEventArticleRepository;
import com.koreaIT.demo.vo.EventArticle;
import com.koreaIT.demo.vo.SaveEventArticle;

@Service
public class SaveEventArticleService {
	
	private SaveEventArticleRepository saveEventArticleRepository;
	
	@Autowired
	public SaveEventArticleService(SaveEventArticleRepository saveEventArticleRepository) {
		this.saveEventArticleRepository = saveEventArticleRepository;
	}

	public void doInsertSaveEventArticle(int loginedMemberId, int relId, String relTypeCode) {
		saveEventArticleRepository.doInsertSaveEventArticle(loginedMemberId, relId, relTypeCode);
	}
	
	public void doDeleteSaveEventArticle(int loginedMemberId, int relId, String relTypeCode) {
		saveEventArticleRepository.doDeleteSaveEventArticle(loginedMemberId, relId, relTypeCode);
	}

	public SaveEventArticle getSaveEventArticle(int loginedMemberId, int relId, String relTypeCode) {
		return saveEventArticleRepository.getSaveEventArticle(loginedMemberId, relId, relTypeCode);
		
	}

	public List<EventArticle> getSaveEventArticles(int loginedMemberId, String searchKeyword, int itemsInAPage, int page) {
		
		int limitStart = (page - 1) * itemsInAPage;
		
		return saveEventArticleRepository.getSaveEventArticles(loginedMemberId, searchKeyword, limitStart, itemsInAPage);
	}

	public List<EventArticle> getProgressSaveEventArticles(int loginedMemberId, String searchKeyword, int itemsInAPage,
			int page) {
		
		int limitStart = (page - 1) * itemsInAPage;
		
		return saveEventArticleRepository.getProgressSaveEventArticles(loginedMemberId, searchKeyword, limitStart, itemsInAPage);
	}
	
	public List<EventArticle> getEndSaveEventArticles(int loginedMemberId, String searchKeyword, int itemsInAPage,
			int page) {
		
		int limitStart = (page - 1) * itemsInAPage;
		
		return saveEventArticleRepository.getEndSaveEventArticles(loginedMemberId, searchKeyword, limitStart, itemsInAPage);
	}
	
	public int getSaveEventArticleCnt(int loginedMemberId, String searchKeyword) {
		return saveEventArticleRepository.getSaveEventArticleCnt(loginedMemberId, searchKeyword);
	}

	public int getProgressSaveEventArticleCnt(int loginedMemberId, String searchKeyword) {
		return saveEventArticleRepository.getProgressSaveEventArticleCnt(loginedMemberId, searchKeyword);
	}

	public int getEndSaveEventArticleCnt(int loginedMemberId, String searchKeyword) {
		return saveEventArticleRepository.getEndSaveEventArticleCnt(loginedMemberId, searchKeyword);
	}

	
}