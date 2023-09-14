package com.hf.domain;

import java.math.BigDecimal;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Post {
	private String COMMUPOSTID;
	private String COMMUID;
	private String WRITER;
	private String TITLE;
	private String POSTTYPE;
	private String TEXT;
	private String POSTTIME;
	
	public Post(BigDecimal cOMMUPOSTID, BigDecimal cOMMUID, String wRITER, String tITLE, BigDecimal pOSTTYPE, String tEXT,
			Timestamp pOSTTIME) {
		COMMUPOSTID = cOMMUPOSTID.toString();
		COMMUID = cOMMUID.toString();
		WRITER = wRITER;
		TITLE = tITLE;
		POSTTYPE = pOSTTYPE.toString();
		TEXT = tEXT;
		POSTTIME = pOSTTIME.toString();
	}
	
}
