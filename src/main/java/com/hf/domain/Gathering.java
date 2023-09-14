package com.hf.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data@Component
public class Gathering {
	private String GatheringID;
	private String title;
	private String startTime;
	private String endTime;
	private String location;
	private String text;
	private int capacity;
	private int count;
	private int price;

	public Gathering() {
	}

	public Gathering(String title, String startTime, String endTime, String location, String text, int price,
			int capacity) {
		this.title = title;
		this.startTime = startTime;
		this.endTime = endTime;
		this.location = location;
		this.text = text;
		this.price = price;
		this.capacity = capacity;
	}
	
	public Gathering(String GatheringID, String title, String text, String startTime, String endTime, String location,
			int price, int capacity) {
		this.GatheringID = GatheringID;
		this.title = title;
		this.text = text;
		this.startTime = startTime;
		this.endTime = endTime;
		this.location = location;
		this.price = price;
		this.capacity = capacity;
	}

	public Gathering(String GatheringID, String title, String text, String startTime, String endTime, String location,
			int price, int capacity, int count) {
		this.GatheringID = GatheringID;
		this.title = title;
		this.text = text;
		this.startTime = startTime;
		this.endTime = endTime;
		this.location = location;
		this.price = price;
		this.capacity = capacity;
		this.count = count;
	}

}
