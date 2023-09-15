package com.hf.mapper;

import java.util.List;

import com.hf.domain.Criteria;
import com.hf.domain.Gathering;
import com.hf.domain.Post;
import com.hf.domain.CommuInfo;
import com.hf.domain.CommuList;
import com.hf.domain.Commumember;

public interface CommuMapper {
	public CommuInfo getCommuInfo(String commuID);
	public List<Post> getCommuPost(String commuID);
	public void insertGathering(Gathering gObj);
	public List<Gathering> getGathering();
	public List<Commumember> getAllCommumember();
	public List<CommuInfo> getCommuList();
}
