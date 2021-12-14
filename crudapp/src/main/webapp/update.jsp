<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.query.*,
org.hibernate.cfg.Configuration,
com.coforge.training.crudapp.Books" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DML</title>
 <style>
        .container{
  border-radius: 5px;
  background-color: rgb(162, 164, 170);
  padding: 20px;
  margin-left: auto;
  margin-right: auto;
  display: block;
  width: 500px;
  height: 300px;
  
}
input {
  width: 500px;
  padding: 12px;
  border: 1px solid rgb(24, 174, 233);
  border-radius: 10px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}
#btn{
    cursor: pointer;
    background-color: seagreen;
}
h3,h2{
text-align:center;}
h4{
text-align:center;
color:red;
}

    </style>
</head>
<body>

<hr>
<%
Configuration cfg = new Configuration();
cfg.configure("hibernate.cfg.xml");

SessionFactory factory = cfg.buildSessionFactory();
Session sess= factory.openSession();
sess.beginTransaction();

String num=request.getParameter("cl1");
if(num!=null){
int bid=Integer.parseInt(num);  
String name=request.getParameter("cl2");
String price=request.getParameter("cl3");
int p=Integer.parseInt(price);


String hql = "update UpdateBook set bname = :bname, bprice = :bprice where bookid = :bookid";
Query query = sess.createQuery(hql);
query.setParameter("bname",name);
query.setParameter("bookid",bid);
query.setParameter("bprice",p);



int rowsAffected = query.executeUpdate();
if (rowsAffected > 0) {
out.println("<h4>"+"Updated Successfull!"+"</h4>");
}

}
sess.getTransaction().commit();
sess.close();
factory.close();
%>

<h3><a href="./showbooks.jsp">Show Books</a></h3>
<form>  
<div class="container">
		<label>Book_Id</label>
		<input type="text" name="cl1" id="fname">
		<label>Book_Name</label>
		<input type="text" name="cl2" id="lname">
		<label>Book_Price</label>
		<input type="text" name="cl3" id="email">
		
		<input type="submit" name="button" id="btn" value="Submit">
	</div>

  
  </form>
</body>
</html>
