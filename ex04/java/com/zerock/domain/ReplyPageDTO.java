package com.zerock.domain;


import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReplyPageDTO {
	private int replyCnt; //전체 댓글 개수
	private List<ReplyVO> list; //댓글 목록
	
}
