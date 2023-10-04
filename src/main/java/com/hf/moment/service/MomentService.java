package com.hf.moment.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hf.domain.Category;
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
    public MomentWithContent getModalWithContent(int momentID){
    	MomentWithContent list = new MomentWithContent();
    	list = momentMapper.selectModalWithContent(momentID);
    	return list;
    }
    
    public List<String> modalLargeCategory() {
    	return momentMapper.modal_LargeCategory();
    			
    }
    
    public List<String> modal_SmallCategory(String largecate){
    	return momentMapper.modal_SmallCategory(largecate);
    } 
    public void upload(String text, String writer,String category){
    	log.warn(writer);
    	log.warn(category);
    	log.warn(text);
    	momentMapper.modalUpload(text,writer,category);
    } 
}

