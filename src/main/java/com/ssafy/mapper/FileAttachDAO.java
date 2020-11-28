package com.ssafy.mapper;

import java.util.List;

import com.ssafy.domain.FileAttach;

public interface FileAttachDAO {
	
	public void insert(FileAttach FA);

	public void delete(String uuid);

	public List<FileAttach> searchByNo(int no);
}
