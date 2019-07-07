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
.button
{
  width: 150px;
  margin-left:45%;

}
#submission {
  text-align: center;
  }
</style>
<body style="background-image:url(admindashboard.png);">
  		<h1>All Orders Are:</h1>
</head>
<%@ page import ="java.sql.*" %>
<%@ page import =" java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.sql.CallableStatement"%>
<%@ page import ="java.lang.*" %>
<%
    try{
       	Class.forName("com.mysql.jdbc.Driver");  
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cr" , "root" , "Chan@123");    
        CallableStatement cStmt = conn.prepareCall("{call showorder()}");
        ResultSet rs = cStmt.executeQuery();
%>
		<table style="width:100%">
              <tr>
              	<th>CUSTOMER ID</th>
              	<th>CUSTOMER NAME</th>
              	<th>CUSTOMER MOBILE NUMBER</th>
                <th>ITEM ID</th>
                <th>TYPE</th>
                <th>WEIGHT(IN KG)</th>
                <th>ADDRESS OF SENDER</th>
                <th>ADDRESS OF RECEIVER</th>
                <th>STATUS</th>
              </tr>
<% 
       while(rs.next())
        {
 %>
 			<tr>
           <td><% out.print(rs.getString(1)); %></td>
      		<td><% out.print(rs.getString(2)); %></td>
           <td><% out.print(rs.getInt(3)); %></td>
           <td><% out.print(rs.getString(4));%></td>
           <td><% out.print(rs.getString(5));%></td>
           <td><% out.print(rs.getInt(6));%></td>
           <td><% out.print(rs.getString(7));%></td>
          	 <td><% out.print(rs.getString(8));%></td>
          	 <td><% out.print(rs.getString(9));%></td>
          	 
          	 </tr>
           
 <%
        }
%>
		</table>
<%
%>
<a href="welcome-admin.html" id="submission"><button class="button">Back</button></a>
 <%		}
		catch(Exception e)
		{       
    		out.println("Something went wrong !! Please try again " + e);
   		 }    
%>