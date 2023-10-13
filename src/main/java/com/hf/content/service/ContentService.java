package com.hf.content.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hf.domain.Content5;
import com.hf.mapper.ContentMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ContentService {

	@Setter(onMethod_ = @Autowired)
	private ContentMapper mapper;

	public Content5 getContentSrc(String referenceid, String contenttype) {
		return mapper.getContentSrc(referenceid, contenttype);
	}
	public Content5 getboardsrc(String contenttype,int postid) {
		return mapper.getboardsrc(contenttype,postid);
	}

}
