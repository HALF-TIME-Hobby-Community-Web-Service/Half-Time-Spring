package com.hf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hf.comment.service.CommentService;
import com.hf.domain.Comments;

public interface CommentMapper {
	public void commentCheck(@Param("userid") String userid, @Param("commenttext") String commenttext, @Param("commenttype") int commenttype, @Param("referenceid") int referenceid);		
	public String commentGet(@Param("userid") String userid, @Param("commenttext") String commenttext, @Param("commenttype") int commenttype, @Param("referenceid") int referenceid);
	public List<Comments> getCommentsByTypeAndPageNum(@Param("commenttype") int commenttype, @Param("referenceid") int referenceid);
}
