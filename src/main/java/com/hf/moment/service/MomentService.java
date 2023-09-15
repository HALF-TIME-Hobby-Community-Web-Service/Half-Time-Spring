package com.hf.moment.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hf.mapper.MomentMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MomentService {
	List<Map<String,Object>> maplist = new ArrayList();
	
	@Setter(onMethod_ = @Autowired)
	private MomentMapper momentMapper;

    public List<Map<String,Object>> getMomentsWithContent(int pageNum) {
        maplist = momentMapper.selectMomentsWithContent(pageNum);
        return maplist;
    }
    public int countMomentsWithContent() {
        return momentMapper.countMomentsWithContent();
    }
}

