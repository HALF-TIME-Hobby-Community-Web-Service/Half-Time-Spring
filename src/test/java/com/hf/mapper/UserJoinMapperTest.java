package com.hf.mapper;

import org.apache.ibatis.annotations.Param;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hf.domain.User;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserJoinMapperTest {

	@Setter(onMethod_ = @Autowired)
	private UserJoinMapper mapper; 
	
	@Test
	public void test() {
		
		//User user = new User();
		mapper.insertUserLocation("sungmin456","경기도");
		log.info("성공");
	}

}
