package com.coforge.training;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.coforge.training.model.Product;

public class ProductApp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int cnt=0;
    	Configuration cfg=new Configuration();
    	cfg.configure("hibernate.cfg.xml");
    	SessionFactory sf=cfg.buildSessionFactory();
    	Session session=sf.openSession();
    	Transaction t=session.beginTransaction();
    	
    	Product p1=new Product();
    	
    	p1.setName("Optical  Mouse");
    	p1.setDescription("Logitech m235");
    	p1.setPrice(900.00f);
    
    	
    	session.save(p1); // object in persistent state
    	t.commit();
    	System.out.println("Product Details successfully Saved to DB");
    	session.close(); // object in detached state
    	sf.close();

	}

}
