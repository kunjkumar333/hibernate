
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.*,org.hibernate.boot.registry.*,
org.hibernate.cfg.Configuration,
com.coforge.training.hibernateweb.Transact,
com.coforge.training.hibernateweb.Customer,
javax.persistence.TypedQuery,
java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OneToOneMapping</title>
</head>
<body>
<h1>One to One Mapping</h1>
<%
Transact txn=new Transact();
txn.setDate(new Date());
txn.setTotal(1000);


Customer cust = new Customer();
cust.setAddress("Bangalore, India");
cust.setEmail("mike@gmail.com");
cust.setName("Mike Roy");

txn.setCust(cust);
cust.setTxn(txn);

Configuration cfg=new Configuration();
cfg.configure("hibernate.cfg.xml");

SessionFactory factory=cfg.buildSessionFactory(new
StandardServiceRegistryBuilder().configure().build());
Session sess= factory.openSession();
Transaction t = sess.beginTransaction();

sess.save(txn);
t.commit();


%>
</body>
</html>