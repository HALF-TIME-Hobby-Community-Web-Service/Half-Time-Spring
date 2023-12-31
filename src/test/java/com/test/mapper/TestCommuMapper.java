package com.test.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hf.domain.Gathering;
import com.hf.mapper.CommuMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TestCommuMapper {

	@Setter(onMethod_ = @Autowired)
	private CommuMapper mapper;
	
	@Test
	public void test() {
		int result = mapper.join("2", "lgakslgk@naver.com", "잘가요 내사랑");
		log.info("result: " + result);
	}

}
