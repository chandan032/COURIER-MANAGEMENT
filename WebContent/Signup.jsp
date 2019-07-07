<style>
h3{
text-align:center;
font-style:italic;
background-color:black;
opacity:0.9;
color:white;
}
div{
text-align:center;
font-size:30px;
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
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Removed Dp</title>
</head>
<body style="background-image:url(user.jpg);">
    <h3>Notification</h3>
<%@ page import ="java.sql.*" %>
<%@ page import =" java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.lang.*" %>
<%
    try{
    	String name=request.getParameter("name");
    	String username=request.getParameter("username");
    	String mob_no=request.getParameter("phone");
    	String email=request.getParameter("email");
    	String password=request.getParameter("password");
    	Class.forName("com.mysql.jdbc.Driver"); 
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cr" , "root" , "Chan@123");    
        Statement st=conn.createStatement();
        int i=st.executeUpdate("insert into customer(c_id,name,username,mob_no,email,password)values(DEFAULT,'"+name+"','"+username+"','"+mob_no+"','"+email+"','"+password+"')");
    	out.println("<span style=\"font-weight:bold; color:black;font-size:30px \"> Data Inserted successfully </span>");
    	
    	
%>
		
		<a href="index.html" id="submission"><button class="button">Back</button></a>
<%
    	}
	catch(Exception e)
	{
		out.println("<span style=\"font-weight:bold; color:black;font-size:30px \">Something went wrong.Please Try Agin.. </span>" + e);
%>
		
		<a href="index.html" id="submission"><button class="button">Back</button></a>
<%
	}
%>
    	