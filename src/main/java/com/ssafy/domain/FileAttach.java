package com.ssafy.domain;

import lombok.Data;

@Data
public class FileAttach {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private String fileType;

	private int no;

}
