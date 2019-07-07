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
<body style="background-image:url(user.jpg);">
<h1>Billing</h1>
</head>
<%@ page import ="java.sql.*" %>
<%@ page import =" java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.lang.*" %>
<%
    try{
    	String phone=request.getParameter("phone");
    	Class.forName("com.mysql.jdbc.Driver");  
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cr" , "root" , "Chan@123");  
        PreparedStatement pst = conn.prepareStatement("select c.c_id,c.name,c.amount from customer c where mob_no=?");
        pst.setString(1,phone);
        ResultSet rs = pst.executeQuery();  
   	if(rs.next())
   	{
%>
   		<table style="width:100%">
   		 <tr>
   		 <th>CUSTOMER ID</th>
   		 <th>CUSTOMER NAME</th>
   		 <th>AMOUNT</th>
   	     
   	    </tr>
   	            
   	           <tr>
   	           <td><% out.println(rs.getString(1)); %></td>
   	           <td><% out.println(rs.getString(2)); %></td>
   	           <td><% out.println(rs.getInt(3)); %></td>
   	           
   	            </tr>
   	    </table><br>
   	    <a href="welcome-user.html"><button>Back</button></a>
<% 		
	}
   	else
   	{
      	RequestDispatcher rd = request.getRequestDispatcher("welcome-user.html");
        rd.include(request, response);
       }
      
	}
  catch(Exception e)
  {       
      out.println("Something went wrong !! Please try again " + e);
    		  %>
    		  <a href="welcome-user.html"><button>Back</button></a>
    		  <%
  }
%>