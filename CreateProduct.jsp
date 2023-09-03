<%@include file="Header.html"%>

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
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/product", "root", "#Thilak@MySQL-25");
        String query = "INSERT INTO products VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, id);
        ps.setString(2, productName);
        ps.setString(3, Brand);
        ps.setString(4, Model);
        ps.setDouble(5, price);
        ps.setString(6, desc);
        s
        int rowsAffected = ps.executeUpdate();
        if (rowsAffected > 0) {
            out.println("Product added successfully!");
        } else {
            out.println("Failed to add the product.");
        }
        
        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<%@include file="Footer.html"%>





