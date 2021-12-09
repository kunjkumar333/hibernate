<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.*,org.hibernate.boot.registry.*,
org.hibernate.cfg.Configuration,
com.coforge.training.hibernateweb.Cart,
com.coforge.training.hibernateweb.Items,
javax.persistence.TypedQuery,
java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>One TO Many Bi-Directional</title>
</head>
<body>
<h1>One TO Many Bi-Directional Mapping</h1>
<%
Cart cart = new Cart();
cart.setName("MyCart");Items item1 = new Items("Pen Drive", 500, 1, cart);
Items item2 = new Items("Optical Mouse", 700, 2, cart);
Set<Items> itemsSet = new HashSet<Items>();
itemsSet.add(item1); itemsSet.add(item2);cart.setItems(itemsSet);
cart.setTotal(500*1 + 700*2);
Configuration cfg = new Configuration();
cfg.configure("hibernate.cfg.xml");

SessionFactory factory=cfg.buildSessionFactory(new
StandardServiceRegistryBuilder().configure().build());
Session sess= factory.openSession();
Transaction t = sess.beginTransaction();// Save the model object
sess.save(cart);
sess.save(item1);
sess.save(item2);
t.commit();
sess.close();
out.println("Success");
%>
</body>
</html>

