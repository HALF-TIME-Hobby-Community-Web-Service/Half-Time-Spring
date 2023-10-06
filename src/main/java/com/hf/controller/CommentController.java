package com.hf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hf.comment.service.CommentService;
import com.hf.domain.Comments;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j

public class CommentController {

	@Setter(onMethod_ = @Autowired)
	public CommentService service; 
	
	// 댓글작성
	@GetMapping("/comment")
	public String getComment(){
		return "./jsp/comment";
	}
	
	// 댓글작성 
	@PostMapping("/comment")
	@ResponseBody
	public int postComment(
			@RequestParam("userid") String userid,
			@RequestParam("comment") String comment, 
			@RequestParam("type") int type
			//commu는 0 / moment는 1
			) {	
		int state = service.commentCheck(userid, comment, type);
		log.info(state);
		return state;
		//0이 반환되면 댓글작성 완료
	}
	
	// 댓글 불러오기 (시간)
	@GetMapping("/commentGet")
	public String getCommentData(){
		return "./jsp/comment";
	}
	
	// 댓글 불러오기 (시간)
	@PostMapping("/commentGet")
	@ResponseBody
	public String postCommentData(
			@RequestParam("userid") String userid,
			@RequestParam("comment") String comment, 
			@RequestParam("type") int type
			//commu는 0 / moment는 1
			) {
		log.info("userid:"+userid+"comment"+comment+"type"+type);
		
		String data = service.commentGet(userid, comment, type);
		log.info(data);
		return data;
	}


	
	
	
}
