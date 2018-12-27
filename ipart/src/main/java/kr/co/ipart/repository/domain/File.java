package kr.co.ipart.repository.domain;

import lombok.Data;

@Data
public class File {
	private int boardNo;
	private int no;
	private String filePath;
	private String fileSysname;
	private String fileOriname;
}
