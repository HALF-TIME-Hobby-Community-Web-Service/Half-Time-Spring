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
	
	//@Test
	public void testGathering() {
		Gathering gObj= new Gathering();
		gObj.setTitle("야호");
		gObj.setText("야야호");
		gObj.setStartTime("2023/09/14");
		gObj.setEndTime("2023/09/14");
		gObj.setCapacity(8);
		gObj.setLocation("우리집");
		gObj.setPrice(10000);
		gObj.setOrganizer("코스타남신김수열");
		mapper.insertGathering(gObj, "1");
	}
	
	@Test
	public void test() {
		log.info(mapper.getAllCommumember("1"));		
	}

}
