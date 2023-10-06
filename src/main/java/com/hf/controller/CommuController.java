package com.hf.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.hf.commu.service.CommuService;
import com.hf.domain.CommuConst;
import com.hf.domain.CommuInfo;
import com.hf.domain.CommuWithContent;
import com.hf.domain.Commumember;
import com.hf.domain.Gathering;
import com.hf.domain.MomentWithContent;
import com.hf.domain.Post;
import com.hf.domain.commuSerise;
import com.hf.s3.S3FileService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value = "/commu/*", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
@Log4j
public class CommuController {
	@Setter(onMethod_ = @Autowired)
	private CommuService service;
	
	@PostMapping("/join")
	public String join(@RequestParam("commuID") String commuID, @RequestParam("userID") String userID,
				    @RequestParam("nickname") String nickname)	{		
		log.info("join而⑦듃濡ㅻ윭 "  + commuID + userID + nickname);
		return service.join(commuID, userID, nickname);
	}
	
	@PostMapping("/getmember")
	public List<Commumember> getCommumemberList(@RequestParam("commuID") String commuID) {
		log.info("commu/getMember/commuID: " + commuID);
		List<Commumember> cList = service.getCommumember(commuID);		
		log.info("cList: " + cList);
		return cList;
	}

	@GetMapping("/getpost")
	public List<Post> getBoard(@RequestParam("commuID") String commuID) {
		List<Post> boardList = service.getCommuPost(commuID);
		return boardList;
	}

	@GetMapping("/getcommuinfo")
	public CommuInfo getCommuInfo(@RequestParam("commuID") String commuID) {
		log.info("|commuInfo| commuID: " + commuID);
		CommuInfo commuInfo = service.getCommuInfo(commuID);
		log.info("commuInfo: " + commuInfo);
		return commuInfo;
	}

	@PostMapping("/lget")
	public List<Gathering> getGathering(String commuID) {
		log.info("lget: " + commuID);
		List<Gathering> gatheringList = service.getGathering(commuID);
		log.info("gatheringList: " + gatheringList);
		return gatheringList;
	}
		
	@PostMapping("/lmake")
	public String lmake(
			@RequestParam String title,
			@RequestParam String startTime,
			@RequestParam String endTime,
			@RequestParam String location,
			@RequestParam String text,
			@RequestParam String capacity,
			@RequestParam String price,
			@RequestParam String commuID) {			
				
		log.info(commuID);
	
		Gathering g = new Gathering(title, text, commuID, "肄붿뒪���궓�떊源��닔�뿴", startTime, endTime, new BigDecimal(price.split("�썝")[0]), location, new BigDecimal(capacity.split("紐�")[0]));
		log.info("Gathering: " + g);	        
		service.lmake(g);
		return "1";	
	}
		
	@PostMapping("/const")
	public CommuConst getcommuConst(@RequestParam String commuID) {						
		log.info("commu/const/commuID: " + commuID);
	        
		CommuConst cc = service.getConst(commuID);
		log.info("cc: " + cc);
		return cc;	
	}
	
	@PostMapping("/location")
	public List<CommuInfo> getCommuLocation(@RequestParam("search_loation") String location) {
		log.info("而ㅻ�ㅻ땲�떚 �쐞移섎뒗?"+location);
		List<CommuInfo> ci = service.getCommuListByLocation(location);
		log.info(ci);
		return ci;
		
	}
	
	@PostMapping("/checkcommuname")
	public String checkCommuName(@RequestParam("commuName")String commuName) {
		String result = service.checkCommuName(commuName);
		return result;
	}
	
	@PostMapping("/cmake")
	public String cmake(@ModelAttribute commuSerise c) {
		log.info("cmake: " + c.toString());
		String result = service.cmake(c);
		log.info("cmake:result: " + result);
		return result;
	}
	
	@PostMapping("/commuUploads3")
	@ResponseBody
	public String s3upload(@RequestParam(name = "files", required = false) List<MultipartFile> files,
	                       @RequestParam("text") String text,
	                       @RequestParam("title") String title,
	                       @RequestParam("contenttype") String contenttype,
	                       @RequestParam("writer") String writer,
	                       @RequestParam("commuid") String commuid) {
	    CommuWithContent cwc = new CommuWithContent();
	    String bucket = "halftimespring";
		log.info(writer);
		log.info(contenttype);
		log.info(text);
		
		cwc.setPOSTTYPE(Integer.parseInt(contenttype));
		cwc.setTEXT(text);
		cwc.setWRITER(writer);
		cwc.setTITLE(title);
		cwc.setCOMMUID(Integer.parseInt(commuid));
		if(cwc.getWRITER()==null) {
			return "nologin";
		}
		
		service.commuUpload(cwc);
		cwc.setReferenceID(Integer.parseInt(commuid));
		int i =1;
	    
	    AmazonS3 amazonS3 = AmazonS3ClientBuilder.standard()
	            .withRegion("ap-northeast-2")
	            .build();
	    log.info("fileSize : "+files.size());
	    // S3FileService 생성
	    S3FileService fileService = new S3FileService(amazonS3);

	    try {
	    	 
	        for (MultipartFile file : files) {
	            String fileName = file.getOriginalFilename();
	            String fileExtName = fileName.substring(fileName.lastIndexOf("."), fileName.length());
	            String filenameuuid = UUID.randomUUID().toString() + fileExtName; // S3에 저장될 파일 이름
	            
	            // 파일 업로드
	            fileService.uploadFile(bucket, filenameuuid, file.getBytes(),file);
	            String filepath = "commu/"+filenameuuid;
	            String Url = amazonS3.getUrl(bucket, filepath).toString();
	            log.info(Url);
	        
	        }
	        // for 루프가 모든 파일을 업로드한 후에 momentService.fileUpload(mwc); 호출
	        service.fileUpload(cwc);
	        
	        return "finish";
	        
	       
	    } catch (IOException e) {
	        e.printStackTrace();
	        // 오류 처리

	    // 업로드 실패 시 false 반환
	    
	    	}
	    return "false";
		}
	
}