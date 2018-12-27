package kr.co.ipart.repository.domain;

import java.util.Date;
import lombok.Data;

@Data
public class Comment {
	private int boardNo;
	private int no;
	private String writer;
	private String content;
	private Date regDate;
}