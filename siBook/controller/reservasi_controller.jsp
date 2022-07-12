<%@include file="../inc/connect.jsp"%>
<%@page import="java.util.*"%>
<%
    String rsvDate = request.getParameter("rsvDate");
    String rsvTimeStart = request.getParameter("rsvTimeStart");
    String rsvTimeEnd = request.getParameter("rsvTimeEnd");
    String rsvQty = request.getParameter("rsvQty");
    Integer userId = (Integer)session.getAttribute("userId");
    String restoId = (String)session.getAttribute("restoId");

    if(userId == null){
        response.sendRedirect("../login.jsp");
    }else{
        String query = String.format("INSERT INTO reservation (reserveId, userId, restoId, reserveDate, startTime, endTime, quantity) VALUES (NULL, '%s', '%s', '%s', '%s', '%s', '%s')", userId, restoId, rsvDate, rsvTimeStart, rsvTimeEnd, rsvQty);
        int result = st.executeUpdate(query);
        String error = "Restaurant Reserved Successfully";
        session.setAttribute("error_msg",error);
        response.sendRedirect("../restoDtl.jsp?restoId=" + restoId);
    }
     

%>