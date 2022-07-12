<%@include file="../inc/connect.jsp"%>
<%@page import="java.util.*"%>

<%


String userEmail = request.getParameter("email");
String userPass = request.getParameter("password");
ResultSet rs = null;
String error="";

try{
    String getUser = String.format("SELECT userId FROM user WHERE email = ('%s') and password = ('%s')", userEmail, userPass);
    rs = st.executeQuery(getUser);

    if(rs.next()){
        int id = rs.getInt("userId");

        session.setAttribute("userId", rs.getInt("userId"));
        response.sendRedirect("../home.jsp");
        
    }
    else{
        error = "Login Invalid\n Email or Password is Incorrect";
        session.setAttribute("error_msg",error);
        response.sendRedirect("../login.jsp");
    }
}
catch(Exception e){
    System.out.println("Unable to select values from the table");
    e.printStackTrace();
}
%>