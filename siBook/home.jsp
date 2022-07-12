<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<%@include file="inc/connect.jsp"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>siBook</title>
</head>
<%@include file="header.jsp"%>
<style>
    .container {
        position: relative;
        text-align: center;
        color: white;
    }

    .centered {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        font-size: 100px;
    }

    .places {
        padding: 25px;
    }

    .list-resto {
        border: 1px solid gainsboro;
        padding: 10px;
        float: left;
        width: 250px;
        margin: 10px;
    }

    .list-resto:hover {
        transition-duration: 700ms;
        box-shadow: 5px 5px gainsboro;
    }

    .list-resto img {
        width: 100%;
        height: 175px;
        display: block;
        margin-bottom: 5px;
    }

    .list-resto h2 {
        color: black;
        text-align: center;
        margin-bottom: 5px;
    }

    .btn-book {
        text-decoration: none;
        border-radius: 7px;
        padding: 7px;
        display: block;
        float: left;
        width: 45%;
        margin-top: 10px;
        margin-left: 49px;
        text-align: center;
        color: black;
    }

    .btn-book:hover {
        background-color: gray;
        transition-duration: 700ms;
    }
</style>

<body>
    <div>
        <div class="container">
            <img src="assets/food.jpg" alt="food" style="width:100%;">
            <div class="centered">RESERVATION MADE <br>EASY</div>
        </div>
    
        <h1 class="places">Restaurant Around You...</h1>
    
        <div>
            <%
                ResultSet rs = null;
                String query = "SELECT * FROM restaurant";
                rs = st.executeQuery(query);
                while(rs.next()) {
            %>
                <div class="list-resto">
                    <img src="<%= rs.getString("urlImage") %>" class="img">
                    <h2 class="text"><center><%= rs.getString("restoName") %></center></h2>
                    <a class="btn-book" href="restoDtl.jsp?restoId=<%=rs.getInt("restoId")%>">Book</a>
                </div>             
            <%
                }
            %>
        </div>
    </div>
</body>

</html>

