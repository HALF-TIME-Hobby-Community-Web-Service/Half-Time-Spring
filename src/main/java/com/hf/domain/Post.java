package com.hf.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data@Component
public class Post {
	private String COMMUPOSTID;
	private String COMMUID;
	private String WRITER;
	private String TITLE;
	private String POSTTYPE;
	private String TEXT;
	private String POSTTIME;
	
	public Post(String cOMMUPOSTID, String cOMMUID, String wRITER, String tITLE, String pOSTTYPE, String tEXT,
			String pOSTTIME) {
		COMMUPOSTID = cOMMUPOSTID;
		COMMUID = cOMMUID;
		WRITER = wRITER;
		TITLE = tITLE;
		POSTTYPE = pOSTTYPE;
		TEXT = tEXT;
		POSTTIME = pOSTTIME;
	}
	
}
