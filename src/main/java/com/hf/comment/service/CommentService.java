package com.hf.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hf.controller.CommentController;
import com.hf.mapper.CommentMapper;
import com.hf.mapper.UserMapper;
import com.hf.domain.Comments;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j

@Service
public class CommentService {
	@Setter(onMethod_ = @Autowired)
	private CommentMapper mapper;
	
	//댓글입력 
	public int commentCheck(String userid, String commenttext, int commenttype, int referenceid) {		
		mapper.commentCheck(userid, commenttext, commenttype, referenceid);
		log.info(userid+""+commenttext+""+commenttype);
		return 0;
	}

	//시간불러오기
	public String commentGet(String userid, String commenttext, int commenttype, int referenceid) {
			String data = mapper.commentGet(userid, commenttext, commenttype, referenceid);
		return data;
	}

	//페이지와 글번호에 맞는 댓글 모두 불러오기 
	public List<Comments> getCommentsByTypeAndPageNum(int commenttype, int referenceid){
		return mapper.getCommentsByTypeAndPageNum(commenttype, referenceid);
	}

	
}
