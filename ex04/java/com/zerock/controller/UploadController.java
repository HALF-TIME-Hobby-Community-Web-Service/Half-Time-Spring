package com.zerock.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.zerock.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(new Date());
		return str.replace("-", File.separator);
	}
	
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			log.info("contentType:" + contentType);
			if (contentType != null)
			return contentType.startsWith("image");
		} catch (IOException e) {			
			e.printStackTrace();
		}
		return false;
	}
	
	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("업로드 요청");		
	}
	
	@PostMapping(value="uploadFormAction", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)	
	public ResponseEntity<List<AttachFileDTO>> uploadFormAction(MultipartFile[] uploadFile, Model model) {
		
		List<AttachFileDTO> list = new ArrayList<>();
		File uploadPath = new File("C:\\upload", getFolder());
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile file : uploadFile) {
			log.info("정보-------");
			log.info("file 이름:" + file.getOriginalFilename());
			log.info("file 크기:" + file.getSize());
			
			AttachFileDTO attachDTO = new AttachFileDTO();		
			attachDTO.setFileName(file.getOriginalFilename());
			UUID uuid = UUID.randomUUID();
			String uploadFileName = uuid + "_" + file.getOriginalFilename();
			
			File saveFile = new File(uploadPath, uploadFileName);
			attachDTO.setUploadPath(uploadPath.getAbsolutePath());
			attachDTO.setUuid(uuid.toString());
			try {
				file.transferTo(saveFile);
				if(checkImageType(saveFile)) {
					attachDTO.setImage(true);
					FileOutputStream thumbnail = new FileOutputStream(
						new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(file.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}
				list.add(attachDTO);
			} catch (IllegalStateException e) {				
				e.printStackTrace();
			} catch (IOException e) {				
				e.printStackTrace();
			}
		}
		return new ResponseEntity<> (list, HttpStatus.OK);
	}
	
}
