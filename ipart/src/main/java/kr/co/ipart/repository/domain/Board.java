package kr.co.ipart.repository.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Board {
	private int no;
	private String title;
	private String writer;
	private String content;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	private int view;
	private String category;
	
	private String keyWord;
	
	private List<Comment> commentList;
	
	private int paging;
	private int startPage;
	private int endPage;
	
	
	public int getPaging() {
		return paging;
	}
	public void setPaging(int paging) {
		this.paging = paging;
	}
	public int getStartPage() {
		return (paging*10)-9;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return (paging*10);
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
}
