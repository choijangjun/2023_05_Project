package com.koreaIT.demo.controller;

import org.springframework.ui.Model;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String showSaveList(Model model) {
		
		List<EventArticle> saveEventArticles = saveEventArticleService.getSaveEventArticles(rq.getLoginedMemberId());
		
		model.addAttribute("saveEventArticles", saveEventArticles);
		
		System.out.println(saveEventArticles);
		
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