package kr.co.ipart.repository.domain;

import lombok.Data;


public class Page {

	private int pageNo;
	private int listSize;
	
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public int getPageNo() {
		return pageNo;
	}
	
	public int setListSize(int listSize) {
		this.listSize =listSize;
		return listSize;
	}
	
	public int getBegin() {
		return (pageNo -1) * listSize + 1;
	}
	
	public int getEnd() {
		return pageNo * listSize;
	}
	
	

	
	
	
}
