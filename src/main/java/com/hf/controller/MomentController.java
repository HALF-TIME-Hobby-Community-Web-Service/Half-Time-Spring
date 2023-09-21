package com.hf.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	    public String list() {
	        return "./jsp/moment/feed";
	    }
	  
	  @ResponseBody
	  @PostMapping("/feed")
	    public List<MomentWithContent> feed(Model model,@RequestParam("pageNum") int pageNum) {
		  List<MomentWithContent> list = new ArrayList<MomentWithContent>();
		  list = momentService.getMomentsWithContent(pageNum);
		  for(int i = 0;i<list.size();i++) {
		  log.info("ID : "+list.get(i).getMomentID()+" writer : "+ list.get(i).getWriter()+" contentpath1 : "+ list.get(i).getContentPath1());
	  }return  list;
	    }
	    
	    @GetMapping("moment/write")
	    public MomentWithContent writeMoment() {
	    	return new MomentWithContent();
	    }
	    
	    @ResponseBody
	    @PostMapping("/modal")
	    public List<MomentWithContent> modal( @RequestParam("momentID") int momentID,Model model){
	    	List<MomentWithContent> list = new ArrayList<MomentWithContent>();
	    	list = momentService.getModalWithContent(momentID);
	    	log.info(list.get(0).getMomentID());
	    	return list;
	    }
	
}
