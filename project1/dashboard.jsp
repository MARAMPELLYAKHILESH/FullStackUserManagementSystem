<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.html");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h2>Welcome, <%= user %></h2>
    <h3>User List</h3>
    <table>
        <tr><th>ID</th><th>Username</th><th>Email</th></tr>
        <%
            try (Connection conn = DBConnection.getConnection()) {
                String sql = "SELECT * FROM users";
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("username") %></td>
                        <td><%= rs.getString("email") %></td>
                    </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>
