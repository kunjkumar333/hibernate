package com.coforge.training.hibernateweb;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class UserDAO {
	
	public static int userRegister(User u){
		
		int cnt=0;
		Configuration cfg=new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory sf=cfg.buildSessionFactory();
		Session session=sf.openSession();
		Transaction t=session.beginTransaction();
		// t.begin();
		cnt=(Integer)session.save(u);
		t.commit();
		session.close();
		return cnt;


	}

}
