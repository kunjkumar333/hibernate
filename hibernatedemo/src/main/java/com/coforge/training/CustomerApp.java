package com.coforge.training;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.coforge.training.model.Customer;

public class CustomerApp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int cnt=0;
    	Configuration cfg=new Configuration();
    	cfg.configure("hibernate.cfg.xml");
    	SessionFactory sf=cfg.buildSessionFactory();
    	Session session=sf.openSession();
    	Transaction t=session.beginTransaction();
    	
    	Customer c1=new Customer();
    	c1.setFirstName("Gevin");
    	c1.setLastName("klay");
    	c1.setBalance(15000);
    	c1.setMarried(true);
    	
    	session.save(c1);
    	t.commit();
    	System.out.println("Data successfully Saved to DB");
    	session.close();
    	sf.close();
    	

	}

}
