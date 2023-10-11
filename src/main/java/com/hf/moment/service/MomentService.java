package com.hf.moment.service;

import java.util.ArrayList;
import java.util.List;

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
    public List<MomentWithContent> searchMoment(String location) {
    	List<MomentWithContent> list = new ArrayList();
    	list = momentMapper.searchMoment(location);

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
    public void uploadMoment(MomentWithContent mwc){
    	log.warn(mwc.getWriter());
    	log.warn(mwc.getText());
    	log.warn(mwc.getCategory());
    	momentMapper.modalUpload(mwc);
    } 
    
    public String generateSaveFileName(String fileExtName) {
        String saveFileName = "";

        String maxNum=MaxNumFile();
        
        
      //  if (!fileExtName.equals(".jpg") || !fileExtName.equals(".jpeg") || !fileExtName.equals(".png")|| !fileExtName.equals(".JPG")|| !fileExtName.equals(".JPEG")|| !fileExtName.equals(".PNG")|| !fileExtName.equals(".SVG")) {
       //     log.info("�̹��� Ȯ���� ���� ó��");
        //    return saveFileName="�̹��� Ȯ���� ����";
        //}
        saveFileName = MaxNumFile()+fileExtName;
        log.warn("saveFileName : "+saveFileName);
       
        return saveFileName;
    }
    
    public void fileUpload(MomentWithContent mwc) {
    	momentMapper.fileUpload(mwc);	
    }
    
    public int getMaxMomentID() {
    	return momentMapper.getMaxMomentID();
    }
    
    public String MaxNumFile() {
    	Integer intmax = momentMapper.getMaxNumFile();
    	String max;
    	
    	if(intmax==null) {
    		return "1";
    	}else {
    		max =  Integer.toString(intmax+1);
    		return max;
    	}
    	
    }
}

