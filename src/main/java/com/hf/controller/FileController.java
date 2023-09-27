package com.hf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hf.file.service.FileService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value="/file", method=RequestMethod.GET)
public class FileController {
	@Setter(onMethod_ =@Autowired)
    private FileService fileService;
	
	
	
	
}
