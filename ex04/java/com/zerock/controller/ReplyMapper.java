package com.zerock.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zerock.domain.Criteria;
import com.zerock.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);
	public ReplyVO read(long rno);
	public int update(ReplyVO vo);
	public int delete(long rno);
	public List<ReplyVO> getListWithPaging(@Param("bno")long bno,@Param("cri")Criteria cri);
	public int getCountByBno(long bno); //댓글 전체 갯수 확수
}
