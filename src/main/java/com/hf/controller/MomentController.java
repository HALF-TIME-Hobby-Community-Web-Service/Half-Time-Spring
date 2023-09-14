package com.hf.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hf.domain.Criteria;
import com.hf.domain.MomentWithContent;
import com.hf.moment.service.MomentService;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
@RequestMapping(value="/moment", method=RequestMethod.GET)
public class MomentController {
	
	 @Autowired
	    private MomentService momentService;

	  @GetMapping("/list")
	    public String list(Model model) {
	        model.addAttribute("list", momentService.getMomentsWithContentByCriteria(1));
	        return "feed"; // ∫‰ ¿Ã∏ß (list.jsp)
	    }
	    
	    @GetMapping("moment/write")
	    public MomentWithContent writeMoment() {
	    	return new MomentWithContent();
	    }
	
}
