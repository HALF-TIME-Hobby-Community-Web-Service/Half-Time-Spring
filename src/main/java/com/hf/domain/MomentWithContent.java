package com.hf.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class MomentWithContent {
    private int momentID;
    private String momentWriter;
    private String momentCategory;
    private String momentText;
    private String momentLocation;
    private Date momentPosttime;

    private int contentID;
    private int referenceID;
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