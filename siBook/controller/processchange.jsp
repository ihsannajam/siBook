<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@include file="../inc/connect.jsp"%>
<%
    String old=request.getParameter("Old");
    String news=request.getParameter("New");
    String confirm=request.getParameter("Confirm");
    Integer userId = (Integer)session.getAttribute("userId");

    String error="";
    int id=0;

    try {
        if((old.equals(" "))||(news.equals(" "))||(confirm.equals(" "))){
            response.sendRedirect("../change.jsp");}
        else{
            String query = String.format("SELECT password FROM user WHERE userId = ('%s')", userId);
            ResultSet resultset = st.executeQuery(query);
            if (resultset.next()) { 
                String password=resultset.getString("password");
                if(news.equals(confirm)){
                    if (password.equals(old)) {
                        String queryInsert = String.format("UPDATE user SET password = ('%s') WHERE userId = ('%s')", news, userId);
                        int result = st.executeUpdate(queryInsert);
                        response.sendRedirect("../profile.jsp");
                    }
                    else {
                        error = "Password is wrong";
                        session.setAttribute("error_msg",error);
                        response.sendRedirect("../change.jsp");
                    } 
                }else {
                    response.sendRedirect("../change.jsp");
                }
            }
        }
    }
    catch (Exception e) {
        response.sendRedirect("../change.jsp");
    }
%>