<%@page import="java.sql.*" %>

<%
	
	int id = Integer.parseInt(request.getParameter("id"));	
	out.println(id);
%>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/product", "root", "#Thilak@MySQL-25");
		
	String query = "delete from products where id=?";
	PreparedStatement p = con.prepareStatement(query);
	p.setInt(1,id);
	
	p.executeUpdate();
	response.sendRedirect("HomePage.jsp");
	
%>