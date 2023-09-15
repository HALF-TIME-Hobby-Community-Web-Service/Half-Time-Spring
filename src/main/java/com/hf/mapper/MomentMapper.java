package com.hf.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.hf.domain.Criteria;
import com.hf.domain.MomentWithContent;

@Component
public interface MomentMapper {
	Criteria cri = new Criteria();
	
	List<Map<String,Object>> selectMomentsWithContent(int pageNum);
    int countMomentsWithContent();
}

 
