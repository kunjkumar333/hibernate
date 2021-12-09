package com.coforge.training.hibernateweb;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;



@Entity
@Table(name="Address")
public class Address {



@Id
@GeneratedValue(strategy=GenerationType.AUTO)
private int addressId;
private int houseNo;
private String street,city,state,country;
private int pincode;

@OneToOne(targetEntity=Candidate.class)
private Candidate candidate;



public int getAddressId() {
return addressId;
}



public void setAddressId(int addressId) {
this.addressId = addressId;
}



public int getHouseNo() {
return houseNo;
}



public void setHouseNo(int houseNo) {
this.houseNo = houseNo;
}



public String getStreet() {
return street;
}



public void setStreet(String street) {
this.street = street;
}



public String getCity() {
return city;
}



public void setCity(String city) {
this.city = city;
}



public String getState() {
return state;
}



public void setState(String state) {
this.state = state;
}



public String getCountry() {
return country;
}



public void setCountry(String country) {
this.country = country;
}



public int getPincode() {
return pincode;
}



public void setPincode(int pincode) {
this.pincode = pincode;
}



public Candidate getCandidate() {
return candidate;
}



public void setCandidate(Candidate candidate) {
this.candidate = candidate;
}


}