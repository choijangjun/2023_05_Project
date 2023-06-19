package com.koreaIT.demo.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.SaveEventArticleService;
import com.koreaIT.demo.vo.EventArticle;
import com.koreaIT.demo.vo.Rq;
import com.koreaIT.demo.vo.SaveEventArticle;

@Controller
public class UsrSaveEventArticleController {

	private SaveEventArticleService saveEventArticleService;
	private Rq rq;
	
	@Autowired
	public UsrSaveEventArticleController(SaveEventArticleService saveEventArticleService, Rq rq) {
		this.saveEventArticleService = saveEventArticleService;
		this.rq = rq;
	}
	
	@RequestMapping("/usr/saveEventArticle/getSaveEventArticle")
	@ResponseBody
	public SaveEventArticle getSaveEventArticle(int relId, String relTypeCode) {
		
		SaveEventArticle saveEventArticle = saveEventArticleService.getSaveEventArticle(rq.getLoginedMemberId(), relId, relTypeCode);
		
		return saveEventArticle;
	}
	
	@RequestMapping("/usr/myPage/myEventArticle")
	public String showSaveList(Model model, @RequestParam(defaultValue = "1") int page, 
			@RequestParam(defaultValue = "") String searchKeyword) {
		
		int saveEventArticleCnt = saveEventArticleService.getSaveEventArticleCnt(rq.getLoginedMemberId(), searchKeyword);
		int progressSaveEventArticleCnt = saveEventArticleService.getProgressSaveEventArticleCnt(rq.getLoginedMemberId(), searchKeyword);
		int endSaveEventArticleCnt = saveEventArticleService.getEndSaveEventArticleCnt(rq.getLoginedMemberId(), searchKeyword);
		int itemsInAPage = 15;
		
		int pagesCount = (int) Math.ceil((double) saveEventArticleCnt / itemsInAPage);
		int progressPagesCount = (int) Math.ceil((double) progressSaveEventArticleCnt / itemsInAPage);
		int endPagesCount = (int) Math.ceil((double) endSaveEventArticleCnt / itemsInAPage);
		
		int pagesInASaveEvent = 10;
		
		int startPage = (int) Math.floor((double) page / pagesInASaveEvent) * pagesInASaveEvent + 1;
		int progressStartPage = (int) Math.floor((double) page / pagesInASaveEvent) * pagesInASaveEvent + 1;
		int endStartPage = (int) Math.floor((double) page / pagesInASaveEvent) * pagesInASaveEvent + 1;
		
		List<EventArticle> saveEventArticles = saveEventArticleService.getSaveEventArticles(rq.getLoginedMemberId(), searchKeyword, itemsInAPage, page);
		List<EventArticle> progressSaveEventArticles = saveEventArticleService.getProgressSaveEventArticles(rq.getLoginedMemberId(), searchKeyword, itemsInAPage, page);
		List<EventArticle> endSaveEventArticles = saveEventArticleService.getEndSaveEventArticles(rq.getLoginedMemberId(), searchKeyword, itemsInAPage, page);
		
		model.addAttribute("itemsInAPage", itemsInAPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("progressStartPage", progressStartPage);
		model.addAttribute("endStartPage", endStartPage);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("progressPagesCount", progressPagesCount);
		model.addAttribute("endPagesCount", endPagesCount);
		model.addAttribute("page", page);
		model.addAttribute("saveEventArticleCnt", saveEventArticleCnt);
		model.addAttribute("progressSaveEventArticleCnt", progressSaveEventArticleCnt);
		model.addAttribute("endSaveEventArticleCnt", endSaveEventArticleCnt);
		model.addAttribute("saveEventArticles", saveEventArticles);
		model.addAttribute("progressSaveEventArticles", progressSaveEventArticles);
		model.addAttribute("endSaveEventArticles", endSaveEventArticles);
		
		return "usr/myPage/myEventArticle";
	}
	
	@RequestMapping("/usr/saveEventArticle/doInsertSaveEventArticle")
	@ResponseBody
	public void doInsertSaveEventArticle(int relId, String relTypeCode){
		
		
		SaveEventArticle saveEventArticle = saveEventArticleService.getSaveEventArticle(rq.getLoginedMemberId(), relId, relTypeCode);
		
		if (saveEventArticle != null) {
			saveEventArticleService.doDeleteSaveEventArticle(rq.getLoginedMemberId(), relId, relTypeCode);
		}
		
		saveEventArticleService.doInsertSaveEventArticle(rq.getLoginedMemberId(), relId, relTypeCode);
		
	}
	
	@RequestMapping("/usr/saveEventArticle/doDeleteSaveEventArticle")
	@ResponseBody
	public void doDeleteSaveEventArticle(int relId, String relTypeCode) {
		
		saveEventArticleService.doDeleteSaveEventArticle(rq.getLoginedMemberId(), relId, relTypeCode);
		
	}
	
}
//	
//	
//	
//}