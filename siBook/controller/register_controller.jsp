<%@include file="../inc/connect.jsp"%>
<%
    String userEmail = request.getParameter("email");
    String userName = request.getParameter("fname");
    String userDate = request.getParameter("dob");
    String userGender = request.getParameter("gender");
    String userPhone = request.getParameter("phone");
    String userPass = request.getParameter("password");

    String query = String.format("SELECT * FROM user WHERE email='"+userEmail+"'");
    ResultSet rs = st.executeQuery(query);

    String error="";
    if(rs.next()) {
        error = "Email already exist";
        session.setAttribute("error_msg",error);
        response.sendRedirect("../register.jsp");
    }
    else {    
        query = String.format("INSERT INTO user (userId, email, name, dateOfBirth, gender, phone, password) VALUES (null, '%s', '%s', '%s', '%s', '%s', '%s')", userEmail, userName, userDate, userGender, userPhone, userPass);
        st.executeUpdate(query);
        session.setAttribute("error_msg",error);
        response.sendRedirect("../login.jsp") ;
    }
%>