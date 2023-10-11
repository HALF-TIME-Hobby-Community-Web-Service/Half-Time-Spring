package com.hf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hf.content.service.ContentService;
import com.hf.domain.Content5;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value = "/content/*", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
@Log4j
public class ContentController {
	@Setter(onMethod_ = @Autowired)
	private ContentService service;
	
	@PostMapping("/getContentSrc")
	public Content5 join(@RequestParam("referenceid") String referenceid, @RequestParam("contenttype") String contenttype)	{		
		log.info("getContentSrc: "  + referenceid + ", " + contenttype );
		return service.getContentSrc(referenceid, contenttype);
	}
}