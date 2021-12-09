
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,
org.hibernate.*,
org.hibernate.cfg.Configuration,
com.coforge.training.hibernateweb.User,
java.util.Iterator,
org.hibernate.criterion.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HCQL - HIBERNATE CRITERIA QUERY LANGUAGE</title>
</head>
<body>
<h1>HIBERNATE CRITERIA QUERY LANGUAGE</h1>
<p>he Hibernate Criteria Query Language (HCQL) is used to fetch the records based on the specific criteria.</p><%
Configuration cfg = new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory factory = cfg.buildSessionFactory();
Session sess= factory.openSession();
Criteria cr = sess.createCriteria(User.class);
//List<User> lst=cr.list();
//cr.setFirstResult(1);
//cr.setMaxResults(2);

//name starting with s
//cr.add(Restrictions.like("name","%s"));

//equals demo
//cr.add(Restrictions.eq("id",5));

//greater demo
//cr.add(Restrictions.gt("id",6));
//cr.add(Restrictions.like("name","%s"));//combining two table --AND operator
//cr.addOrder(Order.desc("id")); //arrangin in order
cr.add(Restrictions.isNull("name"));


List<User> list = (List<User>) cr.list();
out.println("List of Employees::"+"<br>");
out.println("<table border='1'>");
out.println("<tr bgcolor='yellow'>");
out.println("<th> User Id</th>");
out.println("<th> User Name</th>");
out.println("<th> Email </th>");
out.println("</tr>");
Iterator it=list.iterator();
while(it.hasNext()) {
User u=(User)it.next();
out.println("<tr bgcolor='aqua'>");
out.println("<td>"+u.getId() + "</td>");
out.println("<td>"+ u.getName() + "</td>");
out.println("<td>"+ u.getEmail()+"</td>");
out.println("</tr>");
}
out.println("</table>");

//HCQL with Projection
List<User> list1 = (List<User>) cr.list();
out.println("List of Employees::"+"<br>");
out.println("<table border='1'>");
out.println("<tr bgcolor='yellow'>");
out.println("<th> User Name</th>");

out.println("</tr>");
Iterator it1=list1.iterator();
while(it1.hasNext()) {
User u1=(User)it1.next();
out.println("<tr bgcolor='aqua'>");
out.println("<td>"+ u1.getName() + "</td>");
out.println("</tr>");
}
out.println("</table>");
cr.setProjection(Projections.property("name"));
sess.close();
factory.close();
%>
</body>
</html>

