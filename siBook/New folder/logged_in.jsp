<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="inc/connect.jsp"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .container{
            padding: 10%;
            position: relative;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        .btn_box{
            padding: 10px;
        }
        .btn{
            height: 40px;
            width: 180px;
            border: none;
            font-size: 15px;
            font-weight: bold;
            background-color: #ff2c2c;
            border-radius: 10px;
        }
    </style>
    <title>Document</title>
</head>
<body>
    
    <div class="container">
        <h1>YOU ARE CURRENTLY LOGGED IN TO ANOTHER ACCOUNT</h1>
        <%
            ResultSet rs = null;
            Integer userId = (Integer)session.getAttribute("userId");
            String query = String.format("SELECT * FROM user WHERE userId = ('%d')", userId);
            rs = st.executeQuery(query);
            rs.next();
        %>
        <h3>Logged in to:</h3>
        <h3><%= rs.getString("name")%></h3>
        <h3><%= rs.getString("email")%></h3>
        <div class="btn_box">
            <a href="test.jsp">
                <button class="btn">Continue</button>
            </a>
        </div>
        <div class="btn_box">
            <form action="logout.jsp">
                <button class="btn" type="submit">Logout</button>
            </form>
        </div>
        
    </div>
    
</body>
</html>
