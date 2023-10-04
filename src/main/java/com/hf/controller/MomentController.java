package com.hf.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;

import java.io.File;
import java.nio.file.Files;
import java.util.UUID;

import com.hf.domain.Category;
import com.hf.domain.MomentWithContent;
import com.hf.moment.service.MomentService;
import com.hf.s3.S3FileService;

import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller

@RequestMapping(value="/moment", method=RequestMethod.GET)

public class MomentController {
	@Setter(onMethod_ =@Autowired)
	private MomentService momentService;

	@GetMapping("/list")
	public String list() {
		return "./jsp/moment/feed";
	}

	@ResponseBody
	@PostMapping("/feed")
	public List<MomentWithContent> feed(Model model,@RequestParam("pageNum") int pageNum) {
		List<MomentWithContent> list = new ArrayList<MomentWithContent>();
		list = momentService.getMomentsWithContent(pageNum);
		for(int i = 0;i<list.size();i++) {
			log.info("ID : "+list.get(i).getMomentID()+" writer : "+ list.get(i).getWriter()+" contentpath1 : "+ list.get(i).getContentPath1());
		}return  list;
	}

	@GetMapping("moment/write")
	public MomentWithContent writeMoment() {
		return new MomentWithContent();
	}

	@ResponseBody
	@PostMapping("/modal")
	public MomentWithContent modal( @RequestParam("momentID") int momentID,Model model){
		MomentWithContent list = new MomentWithContent();
		list = momentService.getModalWithContent(momentID);
		log.info("momentid : "+list.getMomentID()+" writer : "+list.getWriter());
		return list;
	}
	@ResponseBody
	@PostMapping("/modal_LargeCategory")
	public List<String> large(){
		List<String> list = new ArrayList<String>();
		list = momentService.modalLargeCategory();
		log.info(list);

		return list;
	}
	@ResponseBody
	@PostMapping("/modal_MiddleCategory")
	public List<String> miidle(@RequestParam("largecate") String largecate){
		List<String> list = new ArrayList<String>();
		list = momentService.modal_MiddleCategory(largecate);
		log.info(list);

		return list;
	}
	@ResponseBody
	@PostMapping("/modal_SmallCategory")
	public List<String> small(@RequestParam("middlecate") String middlecate){
		List<String> list = new ArrayList<String>();
		list = momentService.modal_SmallCategory(middlecate);
		log.info(list);

		return list;
	}

	@PostMapping("/momentUploads3")
	@ResponseBody
	public String s3upload(@RequestParam(name = "files", required = false) List<MultipartFile> files,
	                       @RequestParam("text") String text,
	                       @RequestParam("category") String category,
	                       @RequestParam("writer") String writer) {
	    MomentWithContent mwc = new MomentWithContent();
	    String bucket = "halftimespring";
	    String resource = "/resources/img/moment/";
		log.info(writer);
		log.info(category);
		log.info(text);

		mwc.setCategory(category);
		mwc.setText(text);
		mwc.setWriter(writer);
		if(mwc.getWriter()==null) {
			return "nologin";
		}
		momentService.uploadMoment(mwc);
		mwc.setReferenceID(momentService.getMaxMomentID());
		int i =1;
	    
	    AmazonS3 amazonS3 = AmazonS3ClientBuilder.standard()
	            .withRegion("ap-northeast-2")
	            .build();

	    // S3FileService 생성
	    S3FileService fileService = new S3FileService(amazonS3);

	    try {
	        for (MultipartFile file : files) {
	            String fileName = file.getOriginalFilename();
	            String fileExtName = fileName.substring(fileName.lastIndexOf("."), fileName.length());
	            String filenameuuid = UUID.randomUUID().toString() + fileExtName; // S3에 저장될 파일 이름
	           
	            // 파일 업로드
	            fileService.uploadFile(bucket, filenameuuid, file.getBytes());

	            // 파일 URL 생성
	            String fileUrl = "https://" + bucket + "/moment/" + filenameuuid;
	            
	            String Url = amazonS3.getUrl(bucket, filenameuuid).toString();
	            // 여기서 파일 URL을 반환하거나 다른 작업을 수행할 수 있음
	            switch (i) {
				case 1:
					mwc.setContentPath1(Url);
					break;
				case 2:
					mwc.setContentPath2(Url);
					break;
				case 3:
					mwc.setContentPath3(Url);
					break;
				case 4:
					mwc.setContentPath4(Url);
					break;
				case 5:
					mwc.setContentPath5(Url);
					break;
				default:
					break;
				}
	            i++;
	            return "finish";
	        }
	    } catch (IOException e) {
	        e.printStackTrace();
	        // 오류 처리
	    }

	    // 업로드 실패 시 false 반환
	    return "false";
	}



}



