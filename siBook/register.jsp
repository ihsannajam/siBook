<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="inc/connect.jsp"%>

<%
    Integer userId = (Integer)session.getAttribute("userId");
    if(userId==null){
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SiBook - Register</title>
    <link rel="stylesheet" href="inc/style_login_register.css">
    <script defer src="inc/regscript.js"></script>
</head>
<body>
    <div class="form_container">
        <form id="form" action="controller/register_controller.jsp" novalidate>
            <div class="input_box">
                <input type="email" id="email" name="email" placeholder="Email" autocomplete="off">
            </div>
            <div class="input_box">
                <input type="text" id="fname" name="fname" placeholder="Full Name" autocomplete="off">
            </div>
            <div class="input_box">
                <input type="text" id="dob" name="dob" placeholder="Date of Birth"
                onfocus="(this.type='date')"
                onblur="(this.type='text')">
            </div>
            <div class="input_box">
                <select name="gender" id="gender" placeholder="Gender">
                    <option value="" disabled selected hidden>gender</option>
                    <option value="M">male</option>
                    <option value="F">female</option>
                </select>
            </div>
            <div class="input_box">
                <input type="number" id="phone" name="phone" pattern="\d*" placeholder="Phone Number" autocomplete="off">
            </div>
            <div class="input_box">
                <input type="password" id="password" name="password" placeholder="Password">
            </div>
            <div class="input_box">
                <input type="password" id="cpassword" name="cpassword" placeholder="Confirm Password">
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
                <input type="submit" class="btn" value="Register">
            </div>
            <div class="redir_box">
                <p>Already have an account?</p>
                <a href="login.jsp">Login here!</a>
                
            </div>
        </form>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>
<%
    }  
    else{
        response.sendRedirect("profile.jsp");
    }  
%>