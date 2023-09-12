package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.domain.BoardVO;
import com.zerock.domain.Criteria;
import com.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor // BoardServiceimpl(BoardMapper) 생성자 만들어 줌
@Service
@Log4j
public class BoardServiceimpl implements BoardService {
   
   @Setter(onMethod_ = @Autowired) //setMapper(BoardMapper) DI
   private BoardMapper mapper; 
   @Override
   public int getTotal(Criteria cri) {
      log.info("getTotal: ");
      return mapper.getTotal(cri);
   }
   @Override
   public List<BoardVO> getList(Criteria cri) {
      log.info("getList: "+cri);
      return mapper.getListWithPaging(cri);
   }

   @Override
   public void register(BoardVO board) {
      log.info("register: "+board);
      mapper.insertSelectKey(board);

   }

   @Override
   public BoardVO get(long bno) {
      log.info("get: "+bno);
      return mapper.read(bno);
   }

   @Override
   public boolean modify(BoardVO board) {
      log.info("modify: "+board);
      return mapper.update(board) == 1;
   }

   @Override
   public boolean remove(long bno) {
      log.info("remove: "+bno);
      return mapper.delete(bno) == 1;
   }

}