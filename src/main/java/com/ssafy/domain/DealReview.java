package com.ssafy.domain;
//실물 후기

import java.util.List;

import lombok.Data;

@Data
public class DealReview {
	private String no;
	private String title;
	private String content;
	private String writer;
	private String regtime;
	private String dong_code;
	private String dong_name;
	private int likes;
	
	//첨부파일 추가
	List<FileAttach> attachList;
}
