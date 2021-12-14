<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,org.hibernate.*,org.hibernate.cfg.*,com.coforge.training.crudapp.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Book</title>
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

<%! int bookid;int bprice; String bname; Session session1 = null; %>
<%  
String num1=request.getParameter("cl1");  
if(num1 != null)  
{  
bookid=Integer.parseInt(num1);  
bname=request.getParameter("cl2");  
String price=request.getParameter("cl3");  
bprice=Integer.parseInt(price);  
try  
{  
Configuration cf=new Configuration();  
cf.configure();  
SessionFactory sessionFactory = cf.buildSessionFactory();  
session1 =sessionFactory.openSession();  
Transaction tr=session1.beginTransaction();
insertBook b=new insertBook(bookid,bname,bprice); 
session1.save(b);  
tr.commit(); 
session1.close();  
out.println("<h4>Books Inserted Successfully!</h4>");  
}  
catch(Exception e)  
{  
System.out.println("e="+e.getMessage());  
}  
}  
%>  

  <h3><a href="./showbooks.jsp">Show Books</a></h3>
<form>  
 <div class="container">
		<label>Book_Id</label>
		<input type="text" name="cl1" >
		<label>Book_Name</label>
		<input type="text" name="cl2">
		<label>Book_Price</label>
		<input type="text" name="cl3">
		<input type="submit" name="button" id="btn" value="Submit">
		
		

	</div>
  </form>
</body>
</html>