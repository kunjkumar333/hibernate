<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.query.*,
org.hibernate.cfg.Configuration,
com.coforge.training.hibernateweb.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DML</title>
</head>
<body>
<h1>HQL -DML Operation</h1>
<hr>
<%
Configuration cfg = new Configuration();
cfg.configure("hibernate.cfg.xml");



SessionFactory factory = cfg.buildSessionFactory();
Session sess= factory.openSession();
sess.beginTransaction();



String hql = "update User set password = :password where id = :id";



Query query = sess.createQuery(hql);
query.setParameter("password","cool123");
query.setParameter("id",1);

int rowsAffected = query.executeUpdate();
if (rowsAffected > 0) {
out.println("Updated " + rowsAffected + " rows.");
}

String hql1 = "delete from User where id = :id";query = sess.createQuery(hql1);
query.setParameter("id", 3);
rowsAffected = query.executeUpdate();
if (rowsAffected > 0) {
out.println("Deleted " + rowsAffected + " rows.");
}
else{
out.println("<br>"+"No Records Found to Delete");
}
sess.getTransaction().commit();
sess.close();
factory.close();


%>
</body>
</html>