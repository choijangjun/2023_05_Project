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
import com.koreaIT.demo.vo.EventArticle;
import com.koreaIT.demo.vo.Rq;

@Controller
public class UsrEventArticleController {
	
	private EventArticleService eventArticleService;
	private Rq rq;
	
	@Autowired
	public UsrEventArticleController(EventArticleService eventArticleServices, Rq rq) {
		
		this.eventArticleService = eventArticleServices;
		this.rq = rq;
	}
	
	@RequestMapping("/usr/eventArticle/writeEventArticle")
	public String writeEventArticle() {
		return "usr/eventArticle/writeEventArticle";
	}
	
	@RequestMapping("/usr/eventArticle/doWriteEventArticle")
	@ResponseBody
	public String doWriteEventArticle(String startDate, String endDate, String winningDate, String name, String title, String goods, String needs, int price, String image, String site,@RequestParam(value = "kategorie") List<String> kategorie) {


		eventArticleService.writeEventArticle(rq.getLoginedMemberId(), startDate, endDate, winningDate, name, title, goods, needs, price, image, site);
		
		eventArticleService.doInsertKategorie(kategorie,rq.getLoginedMemberId());
		
		return Util.jsReplace(Util.f("%s 관련 이벤트 등록이 완료되었습니다", name),"/usr/eventArticle/listEventArticle");
	}
	
	@RequestMapping("/usr/eventArticle/modifyEventArticle")
	public String modifyEventArticle(Model model, int id) {
		
		EventArticle eventArticle = eventArticleService.getEventArticle(id);
		
		model.addAttribute("eventArticle", eventArticle);
		
		return "/usr/eventArticle/modifyEventArticle";
	}
	
	@RequestMapping("/usr/eventArticle/doModifyEventArticle")
	@ResponseBody
	public String doModifyEventArticle(int id, String startDate, String endDate, String winningDate, String name, String title,  String goods, String needs, int price, String image, String site,@RequestParam(value = "kategorie") List<String> kategorie) {


		eventArticleService.doModifyEventArticle(id, startDate, endDate, winningDate, name, title, goods, needs, price, image, site);
		
		eventArticleService.doDeleteEventKategorie(id);
		
		eventArticleService.doModifyKategorie(kategorie, id);

		return Util.jsReplace(Util.f("%s 관련 이벤트 수정이 완료되었습니다", name),"/usr/eventArticle/myWriteEventArticle");
	}
	
	@RequestMapping("/usr/eventArticle/doDeleteEventArticle")
	@ResponseBody
	public String doDeleteEventArticle(int id) {

		eventArticleService.doDeleteEventArticle(id);
		
		eventArticleService.doDeleteEventKategorie(id);
		
		return Util.jsReplace(Util.f("이벤트가 삭제되었습니다"),"/usr/eventArticle/myWriteEventArticle");
	}
	
	@RequestMapping("/usr/eventArticle/doDeleteEventKategorie")
	@ResponseBody
	public void doDeleteEventKategorie(int id) {
		
		eventArticleService.doDeleteEventKategorie(id);
	}
	
	@RequestMapping("/usr/myPage/myWriteEventArticle")
	public String showSaveList(Model model, @RequestParam(defaultValue = "1") int page, 
			@RequestParam(defaultValue = "") String searchKeyword, @RequestParam(defaultValue = "3") int progress) {
		eventArticleService.updateEventArticlePG();
		int myWriteEventArticleCnt = eventArticleService.getMyWriteEventArticleCnt(rq.getLoginedMemberId(), searchKeyword, progress);
		int itemsInAPage = 15;
		
		int pagesCount = (int) Math.ceil((double) myWriteEventArticleCnt / itemsInAPage);
		
		int pagesInASaveEvent = 5;
		
		int startPage = (int) Math.floor((double) page / pagesInASaveEvent) * pagesInASaveEvent + 1;
		
		List<EventArticle> myWriteEventArticles = eventArticleService.getMyWriteEventArticles(rq.getLoginedMemberId(), searchKeyword, progress);
		
		
		model.addAttribute("progress", progress);
		model.addAttribute("itemsInAPage", itemsInAPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("page", page);
		model.addAttribute("myWriteEventArticleCnt", myWriteEventArticleCnt);
		model.addAttribute("myWriteEventArticles", myWriteEventArticles);
		
		return "usr/myPage/myWriteEventArticle";
	}
	
	@RequestMapping("/usr/eventArticle/listEventArticle")
	public String showList(Model model, @RequestParam(value = "", required = false) List<String> checkKeyword, 
			@RequestParam(defaultValue = "name") String searchKeywordType, 
			@RequestParam(defaultValue = "") String searchKeyword) {
		
		eventArticleService.updateEventArticlePG();
		
		List<EventArticle> eventArticles = eventArticleService.getEventArticles(checkKeyword, searchKeywordType, searchKeyword, rq.getLoginedMemberId());
		
		int eventArticlesCnt = eventArticleService.getEventArticlesCnt(checkKeyword, searchKeywordType, searchKeyword);
		
		
		
		
		model.addAttribute("eventArticlesCnt", eventArticlesCnt);
		model.addAttribute("eventArticles", eventArticles);
		model.addAttribute("searchKeywordType", searchKeywordType);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("checkKeyword", checkKeyword);
		
		return "usr/eventArticle/listEventArticle";
	}  
	
	@RequestMapping("/")
	public String showRoot() {
		return "redirect:/usr/eventArticle/listEventArticle";
	}

	

	
}