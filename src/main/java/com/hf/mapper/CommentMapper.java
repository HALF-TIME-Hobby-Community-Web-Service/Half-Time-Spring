package com.hf.mapper;

import org.apache.ibatis.annotations.Param;

import com.hf.comment.service.CommentService;

public interface CommentMapper {
	public void commentCheck(@Param("userid") String userid,@Param("comment") String comment, @Param("type") int type);		
}
