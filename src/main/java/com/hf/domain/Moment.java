package com.hf.domain;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data@Component
public class Moment {
	private String MomentImage;
	private String MomentText;
	private int MomentID;
	private String MomentWriter;
	private String MomentLocation;
	private String MomentCategory;
	private Date MomentPosttime;

	public Moment(String momentImage, String momentText, int momentID, String momentWriter, String momentLocation,
			String momentCategory) {

		MomentImage = momentImage;
		MomentText = momentText;
		MomentID = momentID;
		MomentWriter = momentWriter;
		MomentLocation = momentLocation;
		MomentCategory = momentCategory;

	}

}
