<%@include file="Header.html" %>
<%@page import="java.sql.*" %>


<%
	
	int id = Integer.parseInt(request.getParameter("id"));	
	/* out.println(id); */
%>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/product", "root", "#Thilak@MySQL-25");
	String query = "select * from products where id = ?";
	PreparedStatement p = con.prepareStatement(query);
	p.setInt(1,id);
	
	ResultSet rs = p.executeQuery();
	
	while(rs.next())
	{
%>
	<table border="3px">
		<tr>
			<th>ProductId</th>
			<td><% out.println(rs.getInt(1)); %></td>
		</tr>
		<tr>
			<th>ProductName</th>
			<td><% out.println(rs.getString(2));%></td>
		</tr>
		<tr>
			<th>ProductBrand</th>
			<td><% out.println(rs.getString(3)); %></td>	
		</tr>
		<tr>
			<th>productModel</th>
			<td><% out.println(rs.getString(4)); %></td>
		</tr>
		<tr>
			<th>productPrice</th>
			<td><% out.println(rs.getDouble(5)); %></td>
		</tr>
		<tr>
			<th>productDescription</th>
			<td><% out.println(rs.getString(6)); %></td>
		</tr>
	</table>
<%
	}
%>


<%@include file="Footer.html" %>

	