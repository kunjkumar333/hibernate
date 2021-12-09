<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,
org.hibernate.*,
org.hibernate.cfg.Configuration,
com.coforge.training.hibernateweb.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inheritance mapping</title>
</head>
<body>
<% 
Configuration cfg = new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory factory = cfg.buildSessionFactory();
Session sess= factory.openSession();
sess.beginTransaction();

Person person = new Person("Steve", "Balmer");

sess.save(person);

Trainee t1 = new Trainee("James", "Gosling" , new Date(), "Marketing");
sess.save(t1);
out.println("Saved Executed Sucessfully");
sess.getTransaction().commit();
sess.close();

out.print("<hr>");
sess=factory.openSession();
Trainee t=(Trainee)sess.get(Trainee.class,t1.getPersonId());
out.println(t+"<br>");
sess.close();
factory.close();
%>


</body>
</html>