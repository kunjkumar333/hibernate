<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="org.hibernate.*,org.hibernate.boot.registry.*,
org.hibernate.cfg.Configuration,
com.coforge.training.hibernateweb.Candidate,
com.coforge.training.hibernateweb.Address,
javax.persistence.TypedQuery,
java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
 Candidate c1=new Candidate();
c1.setName("glane Maxwell");
c1.setEmail("Max@gmail.com");
Address address1=new Address();
address1.setHouseNo(101);
address1.setStreet("G-21,Indiranagar,up");
address1.setCity("Lucknow");
address1.setState("Uttar Pradesh");
address1.setCountry("India");
address1.setPincode(560014);
c1.setAddress(address1);
address1.setCandidate(c1);
Configuration cfg = new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory factory=cfg.buildSessionFactory(new
StandardServiceRegistryBuilder().configure().build());
Session sess= factory.openSession();
Transaction t = sess.beginTransaction();
sess.persist(c1);
t.commit();
out.println("Data save Succesfull");
out.print("<br>"+"************** Data Retrieveal********************"+"<br>");
sess.beginTransaction();
TypedQuery qry=sess.createQuery("from Candidate");
List<Candidate> list=qry.getResultList();
Iterator<Candidate> itr=list.iterator();
while(itr.hasNext()){
Candidate c=itr.next();
out.println(c.getId()+" "+c.getName()+" "+c.getEmail());
Address address=c.getAddress();
out.println(address.getStreet()+" "+address.getStreet()+" "+address.getCity()+" "+
address.getState()+" "+address.getCountry()+" "+address.getPincode()+"<br>");
}
sess.close();
System.out.println("success");
%>

</body>
</html>