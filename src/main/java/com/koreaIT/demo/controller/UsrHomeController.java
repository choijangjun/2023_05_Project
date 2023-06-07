package com.koreaIT.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreaIT.demo.vo.Rq;

@Controller
public class UsrHomeController {
	private UsrEventArticleController usrEventArticleController; 
	private Rq rq;
	
	@Autowired
	public UsrHomeController(UsrEventArticleController usrEventArticleController, Rq rq) {
		this.usrEventArticleController = usrEventArticleController;
		this.rq = rq;
	}
	
	@RequestMapping("/usr/home/main")
	public String showMain(Model model, @RequestParam(defaultValue = "") String searchKeywordType,
			@RequestParam(defaultValue = "") String searchKeyword, @RequestParam(defaultValue = "") String checkKeywordType,
			@RequestParam(defaultValue = "") String checkKeyword) {
		usrEventArticleController.showList(model, searchKeywordType, searchKeyword, checkKeywordType, checkKeyword);
		return "usr/home/main";
	}
	
	@RequestMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
	
}