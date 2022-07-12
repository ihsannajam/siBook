<%
    Integer userId = (Integer)session.getAttribute("userId");
    if(userId==null){
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SiBook - Login</title>
    <link rel="stylesheet" href="inc/style_login_register.css">
    <script defer src="inc/logscript.js"></script>
</head>
<body>
    <div class="form_container">
        <form action="controller/login_controller.jsp" novalidate>
            <div class="input_box">
                <input type="email" id="email" name="email" placeholder="Email">
            </div>
            <div class="input_box">
                <input type="password" id="password" name="password" placeholder="Password">
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
                <button type="submit" class="btn">Login</button>
            </div>
            <div class="redir_box">
                <p>Don't have an account?</p>
                <a href="register.jsp">Register here!</a>
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