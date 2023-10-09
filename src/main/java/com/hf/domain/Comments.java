package com.hf.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Comments {
	private int commentid; 
    private String userid;
    private int referenceid;
    private String commenttext;
    private int commenttype;
    private String commenttime;

    public Comments() {    	
    }
	
	
	public Comments(String userid, String commenttext, int commenttype) {
		this.userid=userid;
		this.commenttext=commenttext;
		this.commenttype=commenttype;
	}
    
	public Comments(String userid, String commenttext, int commenttype, int referenceid) {
		this.userid=userid;
		this.commenttext=commenttext;
		this.commenttype=commenttype;
		this.referenceid= referenceid;
	}
	
	public Comments(int referenceid, int commenttype) {
		this.referenceid=referenceid;
		this.commenttype=commenttype;
	}
	
	
}

