package com.coforge.training;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.coforge.training.model.Employee;




/**
 * Hello world!
 *
 */
public class EmployeeApp 
{
    public static void main( String[] args )
    {
    	
    	int cnt=0;
    	Configuration cfg=new Configuration();
    	cfg.configure("hibernate.cfg.xml");
    	SessionFactory sf=cfg.buildSessionFactory();
    	Session session=sf.openSession();
    	Transaction t=session.beginTransaction();
    	Employee e1=new Employee();
    	e1.setFirstName("John");
    	e1.setLastName("Mark");
    	session.save(e1);
    	t.commit();
    	System.out.println("Data successfully Saved to DB");
    	session.close();
    	sf.close();


    }
}
