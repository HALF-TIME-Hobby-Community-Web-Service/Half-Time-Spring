package com.hf.mapper;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hf.domain.CommuConst;
import com.hf.domain.CommuInfo;
import com.hf.domain.CommuWithContent;
import com.hf.domain.Commumember;
import com.hf.domain.Gathering;
import com.hf.domain.MomentWithContent;
import com.hf.domain.CommuWithContent;
import com.hf.domain.Post;
import com.hf.domain.commuSerise;

public interface CommuMapper {
	public CommuInfo getCommuInfo(String commuID);
	public List<Post> getCommuPost(String commuID);
	
	public int join(@Param("commuID")String commuID, @Param("userID")String userID, @Param("nickname")String nickname);
	
	public void insertGathering(Gathering gObj);
	public List<Gathering> getGathering();
	public List<Commumember> getAllCommumember();
	public List<CommuInfo> getCommuList();

	public void insertGathering(@Param("gObj")Gathering gObj, @Param("commuID")String commuID);
	public List<Gathering> getGathering(String commuID);
	public List<Commumember> getAllCommumember(String commuID);
	public CommuConst getCommuConst(String commuID);
	public List<CommuInfo> getCommuListByLocation(@Param("commuLocation") String commuLocation);
	
	public int selectCommuName(String commuName);
	
	
	public long selectCommuSeq();
	public int insertCommu(@Param("c")commuSerise c);
	public int insertCommuConst(@Param("c")commuSerise c, @Param("gender")BigDecimal gender);
	public int insertCommuManager(@Param("c")commuSerise c);
	
	public void fileUpload(CommuWithContent cwc);
	void modalUpload(CommuWithContent cwc);
	public int getMaxCommuID();
}
