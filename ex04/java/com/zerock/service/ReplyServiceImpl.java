package com.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zerock.domain.Criteria;
import com.zerock.domain.ReplyPageDTO;
import com.zerock.domain.ReplyVO;
import com.zerock.mapper.BoardMapper;
import com.zerock.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_ =@Autowired )
	private ReplyMapper replyMapper;
	@Setter(onMethod_ =@Autowired )
	private BoardMapper boardMapper;
	
	@Override
	@Transactional
	public int register(ReplyVO vo) {
		log.info("register :" + vo);
		boardMapper.updateReplyCnt(vo.getBno(), 1);
		return replyMapper.insert(vo);
	}

	@Override
	public ReplyVO get(long rno) {
         log.info("ReplyVO" +log);
		return replyMapper.read(rno);
	}

	@Override
	public ReplyPageDTO getList(long bno, Criteria cri) {
		log.info("getList:"+bno+", crit:" + cri);
		ReplyPageDTO dto = new ReplyPageDTO(
				replyMapper.getCountByBno(bno),
				replyMapper.getListWithPaging(bno,cri));
		return dto;
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("modify" + vo);
		return replyMapper.update(vo);
	}

	@Override
	@Transactional
	public int remove(long rno) {
		log.info("remove" +rno);
		ReplyVO vo = replyMapper.read(rno);
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		return replyMapper.delete(rno);
	}

}
