package com.coforge.training.hibernateweb;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name="Customer")
public class Customer {
	
	@Id
	@Column(name="txn_id", unique=true, nullable=false)
	@GeneratedValue(generator="gen")
	@GenericGenerator(name="gen", strategy="foreign", 
	parameters= {@Parameter(name="property", value="txn")})
	private long id;
	@Column(name="cust_name")
	private String name;
	@Column(name="cust_email")
	private String email;
	@Column(name="cust_address")
	private String address;


	@OneToOne
	@PrimaryKeyJoinColumn  //Shared/common primary key
	private Transact txn;


	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public Transact getTxn() {
		return txn;
	}


	public void setTxn(Transact txn) {
		this.txn = txn;
	}
	
	
	

}
