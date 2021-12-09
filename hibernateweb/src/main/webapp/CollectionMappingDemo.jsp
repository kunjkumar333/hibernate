<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,
org.hibernate.query.*,
org.hibernate.cfg.Configuration,
com.coforge.training.hibernateweb.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Collection Mapping Example</title>
</head>
<body>
<% Session sess = new Configuration().configure("hibernate.cfg.xml")
.buildSessionFactory().openSession();
Transaction t = sess.beginTransaction(); 

Employee e1=new Employee();
e1.setEmployeeName("Alex");
Set<String> phone_numbers=new HashSet<>();
phone_numbers.add("1234456");
phone_numbers.add("9876543");
phone_numbers.add("9878364");
phone_numbers.add("9878456");

e1.setPhoneNumbers(phone_numbers);
sess.save(e1);
t.commit();

out.print("Employee phone numbers successfully saved");
%>
<hr>
<h1>Employee Contact Numbers</h1>
<%

Query query = sess.createQuery("from Employee");
List<Employee> list = query.list();Iterator<Employee> itr = list.iterator();

while (itr.hasNext()) {
Employee emp = itr.next();
out.println("Employee Name: " + emp.getEmployeeName()); // printing answers

Set<String> set = emp.getPhoneNumbers();
Iterator<String> itr2 = set.iterator();

while (itr2.hasNext()) {
out.println(itr2.next());
}
out.println("<br>");
}
sess.close();
out.println("success");


%>
</body>
</html>