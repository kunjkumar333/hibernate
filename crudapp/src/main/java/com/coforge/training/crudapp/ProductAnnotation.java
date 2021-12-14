package com.coforge.training.crudapp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="product")
public class ProductAnnotation {

	@Id
	@Column(name="Pro_id")
	private int id;
	
	@Column(name="Pro_name")
	private String pname;
	
	@Column(name="Pro_des")
	private String des;
	
	@Column(name="Pro_price")
	private int price;

	
	
	public ProductAnnotation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductAnnotation(int id, String pname, String des, int price) {
		super();
		this.id = id;
		this.pname = pname;
		this.des = des;
		this.price = price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
