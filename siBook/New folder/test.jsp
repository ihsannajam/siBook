<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="inc/connect.jsp"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>name</th>
                <th>address</th>
            </tr>
        </thead>
        <tbody>
            <%
                ResultSet rs = null;
                String query = "SELECT * FROM restaurant";
                rs=st.executeQuery(query);
                while(rs.next()){
            %>
                    <tr>
                        <td><%= rs.getString("restoName")%></td>
                        <td><%= rs.getString("restoAddress")%></td>
                    </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <%
        out.println("userId: " + session.getAttribute("userId"));
        
    %>
</body>
</html>