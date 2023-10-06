package com.hf.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Comments {
	private int commentid; 
    private String userid;
    private int referenceid;
    private String comment;
    private int like; 
    private int type;
    private String date;

    public Comments() {    	
    }
	
	public Comments(String userid, String comment, int type) {
		this.userid=userid;
		this.comment=comment;
		this.type=type;
	}
}

