	<%@include file="Header.html" %>
	<%@page import="java.sql.*" %>

	<h1>All Products Lists</h1>

	<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/product", "root", "#Thilak@MySQL-25");
		
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from products");
		while(rs.next())
		{
	%>
		<table border="3px">
			<tr>
				<th>ProductId</th>
				<th>ProductName</th>
				<th>productBrand</th>
				<th>Actions</th>
			</tr>
			<tr>
				<td><% out.println(rs.getInt(1)); %></td>
				<td><% out.println(rs.getString(2)); %></td>
				<td><% out.println(rs.getString(3)); %></td>	
				<td>
					<button type="button" onClick="location.href='http://localhost:4004/CRUDproject//ViewProduct.jsp?id=<%out.print(rs.getInt(1));%>'">View</button>
					<button type="button" onClick="location.href='http://localhost:4004/CRUDproject/EditProduct.jsp?id=<%out.print(rs.getInt(1));%>'">Edit</button>
					<button type="button" onClick="location.href='http://localhost:4004/CRUDproject/DeleteProduct.jsp?id=<%out.print(rs.getInt(1));%>'">Delete</button>
					
				</td>
			</tr>
		</table>
	<%
		}
	%>

	<%@include file="Footer.html" %>