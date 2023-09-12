package com.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zerock.mapper.Sample1Mapper;
import com.zerock.mapper.Sample2Mapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class SampleTxServiceImpl implements SampleTxService {
	
	@Setter(onMethod_=@Autowired)
	private Sample1Mapper mapper1;
	@Setter(onMethod_=@Autowired)
	private Sample2Mapper mapper2;
	
	@Override
	@Transactional
	public void addData(String value)  {		
		log.info("첫번째 매퍼 실행");
		mapper1.insertCol1(value);
		log.info("두번째 매퍼 실행");
		mapper2.insertCol2(value);
		log.info("실행 완료");
	}
}
