package com.hf.controller;

import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hf.file.service.FileService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value="/file", method=RequestMethod.GET)
public class FileController {
	@Setter(onMethod_ =@Autowired)
    private FileService fileService;
	
	@PostMapping(path = "/moment")
	public void addFile(
	        @RequestParam(name = "file", required = false) MultipartFile file, HttpServletResponse response) throws IOException {

	        String fileName = file.getOriginalFilename();
	        String fileExtName 
	            = fileName.substring(fileName.lastIndexOf("."), fileName.length());
	        String saveFileName = fileService.genereateSaveFileName(fileExtName);
	        String contentType = file.getContentType();
	        long fileLength = file.getSize();

	        System.out.println("fileLength : "  + fileLength);
	        System.out.println("fileName : " + fileName);
	        System.out.println("fileExtName : " + fileExtName);
	        System.out.println("saveFileName : " + saveFileName);
	        System.out.println("contentType : " + contentType);

	        final String SAVE_PATH = "c:/tmp/";
	        byte[] data = file.getBytes();
	        FileOutputStream fos = new FileOutputStream(SAVE_PATH + saveFileName); 
	        fos.write(data);
	        fos.close();
	    }
	
	
}
