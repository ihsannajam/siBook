<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="inc/connect.jsp"%>
<head>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="inc/change.css">
    <script defer src="inc/change.js"></script>
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
    <div class="change_container">
        <form action="controller/processchange.jsp" method="post" id = "changeid">
            <div class="input_box">
                <input type="password" id="Old" name="Old" placeholder="Old Password">
            </div>
            <div class="input_box">
                <input type="password" id="New" name="New" placeholder="New Password">
            </div>
            <div class="input_box">
                <input type="password" id="Confirm" name="Confirm" placeholder="Confirm New Password">
            </div>
            <%
            String error = (String)session.getAttribute("error_msg");
            if(error!=null){
            %>
                <div class="error_msg" id="error_msg"><%=session.getAttribute("error_msg") %></div>
            <%
            }
            else{
            %>
            <div class="error_msg" id="error_msg"></div>   
            <%
            }
            session.setAttribute("error_msg","");
            %>
            <div class="btn_box">
                <button type="submit" class="btn" >Change Password</button>
            </div>
        </form>
    </div>
    <br>
    <br>
</body>
</html>

<%@ include file="footer.jsp" %>

