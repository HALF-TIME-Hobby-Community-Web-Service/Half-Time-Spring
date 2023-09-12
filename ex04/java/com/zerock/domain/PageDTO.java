package com.zerock.domain;


import lombok.Getter;

import lombok.ToString;


@ToString
@Getter
public class PageDTO {
	
	private Criteria cri; 	//pageNum 페이지번호, amount 페이지양
	private int total; 		//전체크기
	private int startPage; 	//시작페이지
	private int endPage; 	//끝페이지
	private boolean prev, next; 
	
	public PageDTO() {
		
	}
	
	public PageDTO(Criteria cri, int total) {

	    this.cri = cri;
	    this.total = total;

	    endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
	    startPage = this.endPage - 9;
	    int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

	    if (realEnd <= this.endPage) {
	      endPage = realEnd;
	    }

	    prev = startPage > 1; //1페이지 전이면 false 막아두기

	    next = endPage < realEnd; //30<37 이면 참이니까 이동가능, 근데 37<37 false니까 next기능 막힘 
	  }


}
