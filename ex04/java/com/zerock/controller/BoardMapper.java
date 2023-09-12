package com.zerock.controller;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.zerock.domain.BoardVO;
import com.zerock.domain.Criteria;

public interface BoardMapper {
	//@Select("select * from tbl_board where bno>0")
	public List<BoardVO> getListWithPaging(Criteria cri);
	public List<BoardVO> getList(Criteria cri); 
	public void insert(BoardVO board);
	public void insertSelectKey(BoardVO board);
	public BoardVO read(long bno);
	public int delete(long bno);
	public int update(BoardVO board);
	public int getTotal(Criteria cri);
}
