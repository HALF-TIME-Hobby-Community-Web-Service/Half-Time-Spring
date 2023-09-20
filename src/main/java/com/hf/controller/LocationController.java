package com.hf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/location")
@CrossOrigin
public class LocationController {
	
	@GetMapping("/map")
	public String showMap() {
		
		return "./jsp/location/googlemap";
		
	}

}
