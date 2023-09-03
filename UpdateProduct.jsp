<%@page import="java.sql.*" %>

<%
	Integer id = Integer.parseInt(request.getParameter("id"));
	String productName = request.getParameter("productName"); 
	String Brand = request.getParameter("Brand");
	String Model = request.getParameter("Model");
	String desc = request.getParameter("desc");
	Double price = Double.parseDouble(request.getParameter("price"));
%>    


<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/product", "root", "#Thilak@MySQL-25");
	
	String query = "Update products set Id=?,Name=?,Brand=?,Model=?,price=?,Description=? where Id=?";
	PreparedStatement p = con.prepareStatement(query);
	p.setInt(1,id);
	p.setString(2,productName);
	p.setString(3,Brand);
	p.setString(4,Model);
	p.setDouble(5,price);
	p.setString(6,desc);
	p.setInt(7,id);
	
	p.executeUpdate(); 

	response.sendRedirect("HomePage.jsp");
	
%>
