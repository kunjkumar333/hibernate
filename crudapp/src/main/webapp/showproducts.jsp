<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,org.hibernate.*,org.hibernate.cfg.*,com.coforge.training.crudapp.ProductAnnotation" %>

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
<h2>Available Products are</h2>
  <%! int pid;int price; String pname; String des;Session session1 = null; %>
	<table id="table" width="220" border="1">
		<thead>
			<tr>
				<th>Pro_Id</th>
				<th>Pro_Name</th>
				<th>Pro_Des</th>
				<th>pro_Price</th>
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
		String hql = "from ProductAnnotation";
		Query query = session1.createQuery(hql);
		Iterator it = query.iterate();
		while (it.hasNext()) {
			ProductAnnotation p = (ProductAnnotation) it.next();
			pid = p.getId();
			pname = p.getPname();
			des= p.getDes();
			price = p.getPrice();
		%>
		<tr>
			<td><%=pid%></td>
			<td><%=pname%></td>
			<td><%=des%></td>
			<td><%=price%></td>
		</tr>
		<%  
}  
 session1.close(); 
%>

	</table>
	<h3><a href="./deleteproduct.jsp">Delete Product</a></h3>
    <h3> <a href="./createproduct.jsp">Insert Product</a></h3>
     <h3> <a href="./updateproduct.jsp">Update Product</a></h3>
</body>
</html>

 