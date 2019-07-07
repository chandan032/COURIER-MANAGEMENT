<!DOCTYPE html>
<html>
<head>
<style>
h1
{
text-align:center;
font-style:italic;
background-color:black;
opacity:0.8;
color:white;
}
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th {
    background-color: #4CAF50;
    color: white;
}
td{
 background-color:#f2f2f2;
    color: black;
}
</style>
<body style="background-image:url(dp.jpg);">
<h1>All Orders Are:</h1>
</head>
<%@ page import ="java.sql.*" %>
<%@ page import =" java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.lang.*" %>
<%
	try
	{	
	String dpid=request.getParameter("dpid");
	Class.forName("com.mysql.jdbc.Driver");  
   	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cr" , "root" , "Chan@123");
   	PreparedStatement pst = conn.prepareStatement("select s.s_id,i.type,i.weight,s.address_of_sender,s.address_of_receiver,s.status,d.nod from shipment s,delivery_person d,item i where d.dp_id=? and d.dp_id=s.dp_id and i.item_id=s.item_id ");
   	pst.setString(1,dpid);
    ResultSet rs = pst.executeQuery(); 
   	while(rs.next())
   	{
%>
   		<table style="width:100%">
   		 <tr>
   	     <th>SHIPMENT ID</th>
   	     <th>ITEM DETAILS</th>
   	     <th>WEIGHT(IN KG)</th>
   	  	 <th>ADDRESS OF SENDER</th>
   	  	<th>ADDRESS OF RECEIVER</th>
   	  	<th>STATUS</th>
   	  	<th>No of Order>
   	    </tr>
   	            
   	           <tr>
   	           <td><% out.println(rs.getString(1)); %></td>
   	           <td><% out.println(rs.getString(2)); %></td>
   	           <td><% out.println(rs.getInt(3)); %></td>
   	           <td><% out.println(rs.getString(4));%></td>
   	           <td><% out.println(rs.getString(5));%></td>
   	           <td><% out.println(rs.getString(6));%></td>
   	           <td><% out.println(rs.getString(7));%></td>
   	            </tr>
   	    </table><br>
   	    
 <%	
   	}
   	%>
   	<a href="welcome-dp.html" id="submission"><button class="button">Back</button></a>
   	 <%	
      
	}
  catch(Exception e)
  { 
		out.println("Something went wrong !! Please try again " + e);
%>
		<a href="welcome-dp.html"><button>Back</button></a>
		<%
    
  }
%>