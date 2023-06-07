package com.koreaIT.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.EventArticleService;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Article;
import com.koreaIT.demo.vo.Board;
import com.koreaIT.demo.vo.EventArticle;
import com.koreaIT.demo.vo.ResultData;
import com.koreaIT.demo.vo.Rq;

@Controller
public class UsrEventArticleController {

	private EventArticleService eventArticleService;
	private Rq rq;

	@Autowired
	public UsrEventArticleController(EventArticleService eventArticleService, Rq rq) {
		this.eventArticleService = eventArticleService;
		this.rq = rq;
	}
	
	@RequestMapping("/usr/eventArticle/listToSearchKeyword")
	public String showListToSearchKeyword(Model model, @RequestParam(defaultValue = "name") String searchKeywordType,
			@RequestParam(defaultValue = "") String searchKeyword) {
		List<EventArticle> eventArticles = eventArticleService.getEventArticlesToSecrchKeyword(searchKeywordType, searchKeyword);
//		String[] checkKeywords = checkKeyword.split(",");
		
		int eventArticlesCnt = eventArticleService.getEventArticlesCntToSecrchKeyword(searchKeywordType, searchKeyword);
		
		model.addAttribute("eventArticlesCnt", eventArticlesCnt);
		model.addAttribute("eventArticles", eventArticles);
		model.addAttribute("searchKeywordType", searchKeywordType);
		model.addAttribute("searchKeyword", searchKeyword);
		
		return "usr/eventArticle/listToSearchKeyword";
	}
	
	@RequestMapping("/usr/eventArticle/listToCheckKeyword")
	public String showList(Model model, @RequestParam(defaultValue = "") List<String> checkKeyword) {
//		String[] checkKeywords = checkKeyword.split(",");
		List<EventArticle> eventArticles = eventArticleService.getEventArticlesToCheckKeyword(checkKeyword);
		
		int eventArticlesCnt = eventArticleService.getEventArticlesCntToCheckKeyword(checkKeyword);
		
		model.addAttribute("eventArticlesCnt", eventArticlesCnt);
		model.addAttribute("eventArticles", eventArticles);
		model.addAttribute("checkKeyword", checkKeyword);
		
		return "usr/eventArticle/listToCheckKeyword";
	}
	
	@RequestMapping("/")
	public String showRoot() {
		return "redirect:/usr/eventArticle/listToSearchKeyword";
	}
//	@RequestMapping("/")
//	public String showRoot() {
//		return "redirect:/usr/eventArticle/list";
//	}
	
//	@RequestMapping("/usr/myPage/myEventArticle")
//	public String showList(Model model, int id, @RequestParam(defaultValue = "1") int page, 
//			@RequestParam(defaultValue = "title") String searchKeywordType,
//			@RequestParam(defaultValue = "") String searchKeyword) {
//
//		if (page <= 0) {
//			return rq.jsReturnOnView("페이지번호가 올바르지 않습니다", true);
//		}
//
//		int articlesCnt = eventArticleService.getEventArticlesCnt(searchKeywordType, searchKeyword);
//
//		int itemsInAPage = 10;
//
//		int pagesCount = (int) Math.ceil((double) articlesCnt / itemsInAPage);
//
//		List<Article> articles = eventArticleService.getMyEventArticles(id, itemsInAPage, page);
//
//		model.addAttribute("pagesCount", pagesCount);
//		model.addAttribute("page", page);
//		model.addAttribute("articlesCnt", articlesCnt);
//		model.addAttribute("articles", articles);
//		model.addAttribute("searchKeyword", searchKeyword);
//		model.addAttribute("searchKeywordType", searchKeywordType);
//
//		return "usr/myPage/myEventArticle";
//	}
//	
//	@RequestMapping("/usr/eventArticle/share")
//	public String showShare() {
//		return "usr/eventArticle/share";
//	}
//	
	
//	
//	@RequestMapping("/usr/eventArticle/test1")
//	public String test1() {
//		
//		return "usr/common/search";
//	}
//	@RequestMapping("/usr/eventArticle/test2")
//	@ResponseBody
//	public String test2(@RequestParam List<String> checkKeyword) {
//		
//		for (String str : checkKeyword) {
//			System.out.println(str);
//		}
//		
//		return "test";
//	}
	
}