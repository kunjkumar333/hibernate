<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,org.hibernate.*,org.hibernate.cfg.*,com.coforge.training.crudapp.*" %>

<!DOCTYPE html>
<html>
 
<head>
<meta charset="ISO-8859-1">
<title>Show Books</title>
<style>
        table {
            width: 100%;
            border-collapse: collapse;
            border: 3px solid purple;
        }
        
        td {
            padding: 10px;
        }
       h2 {
         text-align: center;}
        
        th {
            padding: 20px;
        }
        
        thead {
            color: white;
            text-shadow: 1px 1px 1px black;
        }
        
        thead th {
            background: linear-gradient(to bottom, rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.5));
            border: 0px solid purple;
        }
        /* zebra striping*/
        
        tbody tr:nth-child(odd) {
            background-color: #ff33cc;
        }
        
        tbody tr:nth-child(even) {
            background-color: #e495e4;
        }
        
        table {
            background-color: #ff33cc;
        }
    </style>
</head>
<body>
<h2>Available Books are</h2>
  <%! int bookid;int bprice; String bname; Session session1 = null; %>
	<table id="table" width="220" border="1">
		<thead>
			<tr>
				<th>Book_Id</th>
				<th>Book_name</th>
				<th>Book_Price</th>
			</tr>
		</thead>
		 <tbody>

            </tbody>
		<%
		Configuration cf = new Configuration();
		cf.configure();
		SessionFactory sf = cf.buildSessionFactory();
		session1 = sf.openSession();
		//Using from Clause  
		String hql = "from Books";
		Query query = session1.createQuery(hql);
		Iterator it = query.iterate();
		while (it.hasNext()) {
			Books e = (Books) it.next();
			bookid = e.getBookid();
			bname = e.getBname();
			bprice = e.getBprice();
		%>
		<tr>
			<td><%=bookid%></td>
			<td><%=bname%></td>
			<td><%=bprice%></td>
		</tr>
		<%  
}  
 session1.close(); 
%>

	</table>
	<h3><a href="./deletebook.jsp">Delete Book</a></h3>
    <h3> <a href="./insertbook.jsp">Insert Book</a></h3>
     <h3> <a href="./update.jsp">Update Book</a></h3>
</body>
</html>

 