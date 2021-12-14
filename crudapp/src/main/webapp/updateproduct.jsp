<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.query.*,
org.hibernate.cfg.Configuration,
com.coforge.training.crudapp.ProductAnnotation" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>update</title>
 <style>
        .container{
  border-radius: 5px;
  background-color: rgb(162, 164, 170);
  padding: 20px;
  margin-left: auto;
  margin-right: auto;
  display: block;
  width: 500px;
  height: 400px;
  
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
int pid=Integer.parseInt(num);  
String name=request.getParameter("cl2");
String pdes=request.getParameter("cl3");
String pri=request.getParameter("cl4");
int p=Integer.parseInt(pri);


String hql = "update ProductAnnotation set pname = :pname, price = :price,des=:des where id = :id";
Query query = sess.createQuery(hql);
query.setParameter("pname",name);
query.setParameter("id",pid);
query.setParameter("price",p);
query.setParameter("des",pdes);



int rowsAffected = query.executeUpdate();
if (rowsAffected > 0) {
out.println("<h4>"+"Updated Successfull!"+"</h4>");
}

}
sess.getTransaction().commit();
sess.close();
factory.close();
%>

<h3><a href="./showproducts.jsp">Show Products</a></h3>
<form>  
<div class="container">
		<label>Pro_Id</label>
		<input type="text" name="cl1">
		<label>Pro_Name</label>
		<input type="text" name="cl2">
		<label>Pro_Des</label>
		<input type="text" name="cl3">
		<label>Pro_Price</label>
		<input type="text" name="cl4">
		
		<input type="submit" name="button" id="btn" value="Submit">
	</div>

  
  </form>
</body>
</html>
