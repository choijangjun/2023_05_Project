package com.koreaIT.demo.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.koreaIT.demo.service.FileService;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.FileVO;
import com.koreaIT.demo.vo.Rq;

@Controller
public class FileUpload {
	
	private FileService fileService;
	private Rq rq;
	
	@Autowired
	public FileUpload(FileService fileService, Rq rq) {
		this.fileService = fileService;
		this.rq = rq;
	}
	
	

	@RequestMapping("/usr/eventArticle/imageUpload")
	@ResponseBody
	public String uploadFile(MultipartFile file, @RequestParam(defaultValue = "eventArticle") String relTypeCode) {
		
		
		
		try {
			
			fileService.saveFile(file, relTypeCode, rq.getLoginedMemberId());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return Util.jsReplace(Util.f("이미지 등록이 완료되었습니다"),"/usr/eventArticle/writeEventArticle");
	}
	
	@RequestMapping("/usr/eventArticle/imageDelete")
	public void deleteFile(@RequestParam(defaultValue = "eventArticle") String relTypeCode) {		
		
		fileService.deleteFileInfo(relTypeCode, rq.getLoginedMemberId());
	}
	
	@RequestMapping("/usr/eventArticle/file/{relId}")
	@ResponseBody
	public Resource showImage(@PathVariable("relId") int relId, Model model) throws IOException {
		
		
		FileVO file = fileService.getFileByRelId(relId);
		
		model.addAttribute("file", file);
		
		return new UrlResource("file:" + file.getSavedPath()); 
	}
}