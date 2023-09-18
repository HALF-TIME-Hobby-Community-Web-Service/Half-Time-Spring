package com.hf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hf.domain.MomentWithContent;
import com.hf.moment.service.MomentService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
@RequestMapping(value="/moment", method=RequestMethod.GET)
public class MomentController {
	 @Setter(onMethod_ =@Autowired)
	    private MomentService momentService;

	  
	  @GetMapping("/list")
	    public String list(Model model) {
	        model.addAttribute("list", momentService.getMomentsWithContent(1));
	        return "./jsp/moment/feed";
	    }
	  
	  @PostMapping("/feed")
	    public Model feed(Model model,@RequestParam("pageNum") int pageNum) {
	        log.info(momentService.getMomentsWithContent(pageNum));
	        return model.addAttribute("data", momentService.getMomentsWithContent(pageNum));
	    }
	    
	    @GetMapping("moment/write")
	    public MomentWithContent writeMoment() {
	    	return new MomentWithContent();
	    }
	
}
