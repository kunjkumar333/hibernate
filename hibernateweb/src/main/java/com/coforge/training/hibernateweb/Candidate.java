package com.coforge.training.hibernateweb;



import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.OneToOne;



// persistent class for 1-1 mapping bidirectional
@Entity
@Table(name="Candidate")
public class Candidate {



@Id
@GeneratedValue(strategy=GenerationType.AUTO)
@PrimaryKeyJoinColumn
private int Id;
private String name,email;

@OneToOne(targetEntity=Address.class,cascade=CascadeType.ALL)
Address address;



public int getId() {
return Id;
}



public void setId(int id) {
Id = id;
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



public Address getAddress() {
return address;
}



public void setAddress(Address address) {
this.address = address;
}


}