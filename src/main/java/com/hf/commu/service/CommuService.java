package com.hf.commu.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hf.domain.CommuInfo;
import com.hf.domain.CommuList;
import com.hf.domain.Commumember;
import com.hf.domain.Criteria;
import com.hf.domain.Gathering;
import com.hf.domain.Post;
import com.hf.mapper.CommuMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CommuService {

	private SqlSessionTemplate sqlSession;

	@Autowired
	public CommuService(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Setter(onMethod_ = @Autowired)
	private CommuMapper mapper;

	public CommuInfo getCommuInfo(String commuID) {
		return mapper.getCommuInfo(commuID);
	}

//	@Override
//	@Autowired
//	public List<Post> getCommuPost(String commuID, SqlSessionTemplate sqlSession) {
//		
//		this.sqlSession = sqlSession;
//		
//		return sqlSession.selectList("com.hf.commu.mapper.CommuMapper.getCommuList", commuID);
//	}

	public void lmake(Gathering gObj) {
		mapper.insertGathering(gObj);
	}

	public List<Gathering> getGathering() {

		return mapper.getGathering();
	}

	public List<Commumember> getCommumember() {

		return mapper.getAllCommumember();
	}

	public List<Post> getCommuPost(String commuID) {
		return mapper.getCommuPost(commuID);
	}

}
