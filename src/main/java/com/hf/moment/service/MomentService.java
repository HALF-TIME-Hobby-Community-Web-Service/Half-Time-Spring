package com.hf.moment.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hf.domain.MomentWithContent;
import com.hf.mapper.MomentMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MomentService {
	
	
	@Setter(onMethod_ = @Autowired)
	private MomentMapper momentMapper;

    public List<MomentWithContent> getMomentsWithContent(int pageNum) {
    	List<MomentWithContent> list = new ArrayList();
        list = momentMapper.selectMomentsWithContent(pageNum);
        log.info(momentMapper.selectMomentsWithContent(pageNum));
        return list;
    }
    public int countMomentsWithContent() {
        return momentMapper.countMomentsWithContent();
    }
    public List<MomentWithContent> getModalWithContent(int momentid){
    	List<MomentWithContent> list = new ArrayList();
    	list = momentMapper.selectModalWithContent(momentid);
    	return list;
    }
}

