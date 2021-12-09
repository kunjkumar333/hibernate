package com.coforge.training.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

//hibernate using Annotation configuration-JPA

@Entity  //@Entity annotation marks this class as an entity
@Table(name="Customers") //@Table annotation specifies the table name where data of this entity is to be persisted. If you don't use @Table annotation, hibernate will use the class name as the table name by default
public class Customer {

	@Id //@Id annotation marks the identifier for this entity. -primary key field


	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int customerId;
	
	@Column(name="First_Name")
	private String firstName;
	private String lastName;
	private double balance;
	
	@Column(name="marital_status")
	private boolean married;
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public boolean isMarried() {
		return married;
	}
	public void setMarried(boolean married) {
		this.married = married;
	}
	
	
}
