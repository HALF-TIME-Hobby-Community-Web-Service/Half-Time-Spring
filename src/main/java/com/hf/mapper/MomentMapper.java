package com.hf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.hf.domain.Criteria;
import com.hf.domain.MomentWithContent;

@Component
public interface MomentMapper {
	Criteria cri = new Criteria();
	
	List<MomentWithContent> selectMomentsWithContent(int pageNum);
    int countMomentsWithContent();
    
    MomentWithContent selectModalWithContent(int momentid);
    List<String> modal_LargeCategory(); 
    List<String> modal_MiddleCategory(String largecate); 
    List<String> modal_SmallCategory(String middlecate); 
    void modalUpload(MomentWithContent mwc);
    public Integer getMaxNumFile();
	public void fileUpload(MomentWithContent mwc);
	public int getMaxMomentID();
}

 
