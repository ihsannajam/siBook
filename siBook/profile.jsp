<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="inc/connect.jsp"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="inc/profile.css">
</head>
<body>
    <br>
    <br>
    <div class = "navigasi">
        <ol>
            <center>
                <li><a href="profile.jsp">Profile</a></li>
                <li><a href="reservation.jsp">My Reservation</a></li>
                <li><a href="about.jsp">About siBook</a></li>
                <li><a href="change.jsp">Change Password</a></li>
            </center>
            
        </ol>
        
    </div>
    <div class= "profile_list">
        <%
            Integer userId = (Integer)session.getAttribute("userId");
            if(userId == null){
                response.sendRedirect("login.jsp");
            }
        %>
        <center>
            <img src="assets/iconperson.png" width="150" height="150"alt="IconPerson">  
            <%
            Statement statement=null;
            Connection connection=null;
            try{
                ResultSet resultset = null;
                String query = String.format("select name, phone from user where userId = ('%s')", userId);
                resultset = st.executeQuery(query);
                while(resultset.next()){  

                %>
                    <div class="profile">
                        <br>
                        <a><%=resultset.getString("name") %></a>
                        <br>
                        <a><%=resultset.getString("phone") %></a>
                    </div>
                <%
                    }
                }
            catch(Exception e){
                e.printStackTrace();
            }
            %>
            <div class="btn_box">
                <form method="link" action="controller/logout.jsp">
                    <button type="submit" class="btn">Logout</button>
                </form>
            </div>  
        </center>   
    </div>
    <br>
    <br>
</body>
</html>
<%@ include file="footer.jsp" %>


