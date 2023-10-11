package com.hf.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.hf.domain.Content5;

@Component
public interface ContentMapper {	
	public Content5 getContentSrc(@Param("referenceid")String referenceid, @Param("contenttype")String contenttype);
}