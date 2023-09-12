package com.zerock.service;

import java.util.List;

import com.zerock.domain.BoardVO;
import com.zerock.domain.Criteria;

public interface BoardService {             //메서드 이름 BoardMapper interface의 메서드와 비슷하게 짓기

   public List<BoardVO> getList(Criteria cri);             //   public List<BoardVO> getList(); 
   public void register(BoardVO board);      //   public void insertSelectKey(BoardVO board);
   public BoardVO get(long bno);             //   public BoardVO read(long bno);
   public boolean modify(BoardVO board);       //   public int update(BoardVO board); ,return타입 void로 해도 됨 
   public boolean remove(long bno);          //   public int delete(long bno);
   public int getTotal(Criteria cri);
                                 
}