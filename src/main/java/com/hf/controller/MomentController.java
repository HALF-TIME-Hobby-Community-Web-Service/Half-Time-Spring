package com.hf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	int pageNum=1;
	 @Setter(onMethod_ =@Autowired)
	    private MomentService momentService;

	  @GetMapping("/list")
	    public String list(Model model) {
	        model.addAttribute("list", momentService.getMomentsWithContent(pageNum));
	        pageNum++;
	        return "./jsp/moment/feed";
	    }
	    
	    @GetMapping("moment/write")
	    public MomentWithContent writeMoment() {
	    	return new MomentWithContent();
	    }
	
}
