package com.hf.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.hf.domain.Criteria;

@Component
public interface MomentMapper {
	Criteria cri = new Criteria();
	
	List<Map<String,Object>> selectMomentsWithContent(int pageNum);
    int countMomentsWithContent();
}

 
