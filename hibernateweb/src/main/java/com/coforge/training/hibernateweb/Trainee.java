package com.coforge.training.hibernateweb;

import java.util.Date;

public class Trainee extends Person{
	private Date joiningDate;
	private String departmentName;
	
	
	
	public Trainee() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Trainee(String firstname, String lastname) {
		super(firstname, lastname);
		// TODO Auto-generated constructor stub
	}
	public Trainee(String firstName,String lastName,Date joiningDate, String departmentName) {
		super(firstName,lastName);
		this.joiningDate = joiningDate;
		this.departmentName = departmentName;
	}
	public Date getJoiningDate() {
		return joiningDate;
	}
	public void setJoiningDate(Date joiningDate) {
		this.joiningDate = joiningDate;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	@Override
	public String toString() {
		return "Trainee [joiningDate=" + joiningDate + ", departmentName=" + departmentName + ", getJoiningDate()="
				+ getJoiningDate() + ", getDepartmentName()=" + getDepartmentName() + ", getPersonId()=" + getPersonId()
				+ ", getFirstname()=" + getFirstname() + ", getLastname()=" + getLastname() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
	

}
