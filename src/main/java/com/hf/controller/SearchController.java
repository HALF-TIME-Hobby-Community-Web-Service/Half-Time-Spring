package com.hf.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hf.commu.service.CommuService;
import com.hf.domain.CommuInfo;
import com.hf.domain.MomentWithContent;
import com.hf.moment.service.MomentService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/search")
@CrossOrigin
public class SearchController {
	@Setter(onMethod_ = @Autowired)
	private CommuService commuService;
	@Setter(onMethod_ = @Autowired)
	private MomentService momentService;
	
	@ResponseBody
	@PostMapping("/commu")
	public List<CommuInfo> getCommuLocation(@RequestParam("search_location") String location) {
		List<CommuInfo> list = commuService.getCommuListByLocation(location);
		log.info(list);
		return list;
		//������� ���⼭ search_location�� �˻��Ǵ� �����̸� ��ĥ�� �������� �����ϱ� ��ٷο� �̸��� �Ȱ����� 
	}
	
	@ResponseBody
	@PostMapping("/moment")
	public List<MomentWithContent> searchMoment(@RequestParam("search_location") String location) {
		List<MomentWithContent> list = new ArrayList();
    	list = momentService.searchMoment(location);
		return list;
		//������� ���⼭ search_location�� �˻��Ǵ� �����̸� ��ĥ�� �������� �����ϱ� ��ٷο� �̸��� �Ȱ����� 
	}
	
	
	/*
	 * @PostMapping("/location") public String
	 * getCommuLocation(@RequestParam("search_location") String location,Model
	 * model) { log.info("��ġ��ġ"+location); List<CommuInfo> ci =
	 * service.getCommuListByLocation(location);
	 * 
	 * return "./jsp/location/commulocation"; //������� ���⼭ search_location�� �˻��Ǵ� �����̸�
	 * ��ĥ�� �������� �����ϱ� ��ٷο� �̸��� �Ȱ����� }
	 */
	

}
