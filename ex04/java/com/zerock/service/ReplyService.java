package com.zerock.service;

import com.zerock.domain.Criteria;
import com.zerock.domain.ReplyPageDTO;
import com.zerock.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);
	public ReplyVO get(long rno);
	public ReplyPageDTO getList(long bno, Criteria cri);
	public int modify(ReplyVO vo);
	public int remove(long rno);
}
