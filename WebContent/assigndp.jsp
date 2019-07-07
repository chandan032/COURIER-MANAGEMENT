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
<title>Shipment Assigned</title>
</head>
<body style="background-image:url(user.jpg);">
    <h3>Notification</h3>
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
    	
    	String sid=request.getParameter("sid");
    	String dpid=request.getParameter("dpid");
    	Class.forName("com.mysql.jdbc.Driver"); 
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cr" , "root" , "Chan@123");    
        PreparedStatement pst = conn.prepareStatement("update shipment set dp_id=? where s_id=?");
    	pst.setString(1, dpid);
        pst.setString(2, sid);
        pst.executeUpdate();
        out.println("<span style=\"font-weight:bold; color:black;font-size:30px \"> Shipment Assigned</span>");
  	    
%>
		
		<a href="welcome-admin.html" id="submission"><button class="button">Back</button></a>
<%
    	}
	catch(Exception e)
	{
		out.println("<span style=\"font-weight:bold; color:black;font-size:30px \">Something went wrong.Please Try Agin.. </span>" + e);
%>
		
		<a href="welcome-admin.html" id="submission"><button class="button">Back</button></a>
<%
	}
%>