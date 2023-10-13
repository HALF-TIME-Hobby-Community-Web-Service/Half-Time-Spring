package com.hf.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter@ToString
public class CommuWithContent {
		private int COMMUPOSTID;
		private int COMMUID;
		private String WRITER;
		private String TITLE;
		private int POSTTYPE;
		private String TEXT;
		private String POSTTIME;
		
	    private int contentID;
	    private int referenceID;
	    private int contentType;
	    private String contentPath1;
	    private String contentPath2;
	    private String contentPath3;
	    private String contentPath4;
	    private String contentPath5;
	    private String contentPath6;
	    private String contentPath7;
	    private String contentPath8;
	    private String contentPath9;
	    private String contentPath10;
}