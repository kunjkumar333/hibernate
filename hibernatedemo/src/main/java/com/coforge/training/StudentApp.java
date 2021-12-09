package com.coforge.training;

import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.coforge.training.model.Student;

//Hibernate Application using Xml Configuration
public class StudentApp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int cnt=0;
    	Configuration cfg=new Configuration();
    	cfg.configure("hibernate.cfg.xml");
    	SessionFactory sf=cfg.buildSessionFactory();
    	Session session=sf.openSession();
    	Transaction t=session.beginTransaction();
    	
    	Student s1=new Student();
    	
       
    	s1.setStudentName("john");
    	s1.setMarks(40);
    	s1.setCourse("B.tech");
    
    	
    	session.save(s1); // object in persistent state
    	t.commit();
    	System.out.println("Student Details successfully Saved to DB");
    	session.close(); // object in detached state
    	sf.close();


	}

}
