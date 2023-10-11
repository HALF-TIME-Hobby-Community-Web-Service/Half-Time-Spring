package com.hf.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
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
import com.hf.domain.Content;
import com.hf.domain.Gathering;
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
		log.info("join�뚢뫂�뱜嚥▲끇�쑎 "  + commuID + userID + nickname);
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
	
	@GetMapping("/gethistory")
	public List<Post> getHistory(@RequestParam("commuID") String commuID) {
		List<Post> boardList = service.getHistory(commuID);
		log.info("historylist: " + boardList);
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
	public String lmake(HttpServletRequest request, 
			@RequestParam String title,
			@RequestParam String startTime,
			@RequestParam String endTime,
			@RequestParam String location,
			@RequestParam String text,
			@RequestParam String capacity,
			@RequestParam String price,
			@RequestParam String commuID) {			
				
		log.info(commuID);
		
		HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        
        log.info("lmake/userID: " + id);
        String nickname = service.getMember(commuID, id);
        log.info("lmake/nickname: " + nickname);
		
		Gathering g = new Gathering(title, text, commuID, nickname, startTime, endTime, new BigDecimal(price.split("원")[0]), location, new BigDecimal(capacity.split("명")[0]));
		log.info("lmake: " + g.toString());    
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
		log.info("�뚣끇占썬끇�빍占쎈뼒 占쎌맄燁살꼶�뮉?"+location);
		List<CommuInfo> ci = service.getCommuListByLocation(location);
		log.info(ci);
		return ci;
		
	}
	
	@PostMapping("/mycommu")
	public List<CommuInfo> selectCommuById(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		List<CommuInfo> ci = service.getCommuListById(id);
		
		
		return ci;
		
	}
	
	@PostMapping("/checkcommuname")
	public String checkCommuName(@RequestParam("commuName")String commuName) {
		String result = service.checkCommuName(commuName);
		return result;
	}
	
	@PostMapping("/cmake")
	public String cmake(@ModelAttribute commuSerise c) throws IOException {
		log.info("cmake: " + c.toString());
		String result = service.cmake(c);
		log.info("cmake:result: " + result);
		
		return result;
	}
	
	@PostMapping("/commuUploads3")
	@ResponseBody
	public String s3upload(@RequestParam("file") MultipartFile file) throws IOException {
		Content content = new Content();
	    String bucket = "halftimespring";
	    int id = service.getMaxCommuID();
		log.info("아이디"+id);
		int i =1;
	    
		content.setReferenceID(id);
		
		
	    AmazonS3 amazonS3 = AmazonS3ClientBuilder.standard()
	            .withRegion("ap-northeast-2")
	            .build();
	   
	    S3FileService fileService = new S3FileService(amazonS3);

	   
	            String fileName = file.getOriginalFilename();
	            log.info("진짜 파일이름"+fileName);
	            String fileExtName = fileName.substring(fileName.lastIndexOf("."), fileName.length());
	            String filenameuuid = id + fileExtName; 
	            fileService.uploadFileCommu(bucket, filenameuuid, file.getBytes(),file);
	            String filepath = "commu/rep/"+filenameuuid;
	            
	           
	            
	            String Url = amazonS3.getUrl(bucket, filepath).toString();
	            log.info("유알엘"+Url);
	            content.setContentPath1(Url);
	        
	        
	        service.fileUploadCommuRep(id,Url);
	        
	        return "success";
	  
	    
		}
	
	@PostMapping("/commuBoardUploads3")
	@ResponseBody
	public String s3Boardupload(@RequestParam("file") List<MultipartFile> files,@RequestParam("text") String text,@RequestParam("writer") String writer,@RequestParam("contenttype")String contenttype, @RequestParam("commuid") String commuid,@RequestParam("title") String title) throws IOException {
		CommuWithContent cwc = new CommuWithContent();
	    String bucket = "halftimespring";
	    int id = service.getMaxCommuPostID();
		log.info("아이디"+id);
		int i =1;
	    cwc.setCOMMUID(Integer.parseInt(commuid));
	    cwc.setCOMMUPOSTID(id);
	    cwc.setPOSTTYPE(Integer.parseInt(contenttype));
		cwc.setTEXT(text);
		cwc.setWRITER(writer);
		cwc.setTITLE(title);
		cwc.setReferenceID(id);
		
	    AmazonS3 amazonS3 = AmazonS3ClientBuilder.standard()
	            .withRegion("ap-northeast-2")
	            .build();
	   
	    S3FileService fileService = new S3FileService(amazonS3);

	     	 
	        for (MultipartFile file : files) {
	            String fileName = file.getOriginalFilename();
	            String fileExtName = fileName.substring(fileName.lastIndexOf("."), fileName.length());
	            String filenameuuid = UUID.randomUUID().toString() + fileExtName; // S3에 저장될 파일 이름
	            
	            // 파일 업로드
	            fileService.uploadFile(bucket, filenameuuid, file.getBytes(),file);
	            String filepath = "commu/board/"+filenameuuid;
	            String Url = amazonS3.getUrl(bucket, filepath).toString();
	            log.info(Url);
	            
	            switch (i) {
	                case 1:
	                    cwc.setContentPath1(Url);
	                    break;
	                case 2:
	                    cwc.setContentPath2(Url);
	                    break;
	                case 3:
	                    cwc.setContentPath3(Url);
	                    break;
	                case 4:
	                    cwc.setContentPath4(Url);
	                    break;
	                case 5:
	                    cwc.setContentPath5(Url);
	                    break;
	                default:
	                    break;
	            }
	            i++;
	        
	        }
	        service.boardUpload(cwc);
	        service.fileUploadCommuBoard(cwc);
	        	return "success";
	        
	}
	
	@PostMapping("/communame")
	@ResponseBody
	public String getCommuName(@RequestParam("userid") String userid,@RequestParam("commuid") String commuid) {
		String communame;
		communame = service.getCommuName(userid, commuid);
		return communame;
	}
	
	@PostMapping("getuserid")
	public String getUserID(@RequestParam("commuID")String commuID, @RequestParam("nickname")String nickname) {
		String result = service.getUserID(commuID, nickname);
		log.info("getuserid/result :" + result);
		return result;
	}
}