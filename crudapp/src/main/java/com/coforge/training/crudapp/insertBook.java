package com.coforge.training.crudapp;

public class insertBook {

	private int bookid;
	private String bname;
	private int bprice;
	public insertBook() {
		super();
		// TODO Auto-generated constructor stub
	}
	public insertBook(int bookid, String bname, int bprice) {
		super();
		this.bookid = bookid;
		this.bname = bname;
		this.bprice = bprice;
	}
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public int getBprice() {
		return bprice;
	}
	public void setBprice(int bprice) {
		this.bprice = bprice;
	}
	
	
}
