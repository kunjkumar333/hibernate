package com.coforge.training.hibernateweb;

public class Branch {
	
	private String branchId;
	private String branchName;
	
	
	
	public Branch() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Branch(String branchId, String branchName) {
		super();
		this.branchId = branchId;
		this.branchName = branchName;
	}
	public String getBranchId() {
		return branchId;
	}
	public void setBranchId(String branchId) {
		this.branchId = branchId;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	

}
