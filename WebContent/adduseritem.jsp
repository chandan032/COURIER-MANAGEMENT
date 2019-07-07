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
<title>ITEM ADDED</title>
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
    	String itemtype=request.getParameter("itemtype");
    	String itemweight=request.getParameter("itemweight");
    	String itempickupadd=request.getParameter("itempickupadd");
    	String itemdropadd=request.getParameter("itemdropadd");
    	String phone=request.getParameter("phone");
    	Class.forName("com.mysql.jdbc.Driver"); 
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cr" , "root" , "Chan@123");    
        Statement st=conn.createStatement();
        int i=st.executeUpdate("insert into item(item_id,type,weight)values(DEFAULT,'"+itemtype+"','"+itemweight+"')");
        ResultSet j=st.executeQuery("select last_insert_id()");
    	j.next();
    	String bnm=j.getString(1);
    	out.println("<span style=\"font-weight:bold; color:black;font-size:30px \"> ITEM ID</span>");
    	out.println(bnm);
    	
        Statement stt=conn.createStatement();
    	int w=stt.executeUpdate("insert into shipment(s_id,address_of_sender,address_of_receiver,item_id)values(DEFAULT,'"+itempickupadd+"','"+itemdropadd+"','"+bnm+"')");
    	PreparedStatement pst = conn.prepareStatement("update customer set item_id=? where mob_no=?");
    	pst.setString(1, bnm);
        pst.setString(2, phone);
        pst.executeUpdate();

      CallableStatement stmt=conn.prepareCall("{call calc(?)}");
      stmt.setString(1, bnm);
      stmt.execute();  
      
      
      
      
    
%>
		
		<a href="welcome-user.html" id="submission"><button class="button">Back</button></a>
<%
    	}
	catch(Exception e)
	{
		out.println("<span style=\"font-weight:bold; color:black;font-size:30px \">Something went wrong.Please Try Agin.. </span>" + e);
%>
		
		<a href="welcome-user.html" id="submission"><button class="button">Back</button></a>
<%
	}
%>
    	