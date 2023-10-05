package com.hf.comment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hf.controller.CommentController;
import com.hf.mapper.CommentMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j

@Service
public class CommentService {

	@Setter(onMethod_ = @Autowired)
	private CommentMapper mapper;	
	public int commentCheck(String userid, String comment, int type) {		
			mapper.commentCheck(userid, comment, type);
			log.info(userid+""+comment+""+type);
		return 0;
	};


	
}
