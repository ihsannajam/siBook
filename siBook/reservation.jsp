<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="inc/connect.jsp"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <link rel="stylesheet" type="text/css" href="reservation.css"/> -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <title>Reservations</title>
</head>

<style>

    .not-user{
        display: flex; 
        justify-content: center; 
        align-items:center;
    }

    .not-user a{
        color: black;
        text-decoration: underline;
    }

    .not-user a:hover{
        color: red;
    }

    .carousel-header{
        margin: 10px;
    }
    .carousel {
        padding: 0 80px;
    }
    .carousel .carousel-item {
        text-align: center;
        overflow: hidden;
    }
    .carousel .carousel-item img {
        /* max-width: 100%;
        max-height: 60%; */
        width: 500px;
        max-height: 175px; 
        padding: 5px;
        display: inline-block;
    }
    .carousel .carousel-item .btn {
        border-radius: 10px;
        font-size: 12px;
        border: none;
        background: #ededed;
        box-shadow: 0px 2px 2px rgba(0,0,0,0.1);   
        margin: 5px;
    }
    .carousel .carousel-item .btn:hover {
        background: #c4c4c4;
    }
    .carousel .thumb-content {
        padding-top: 8px;
        font-size: 15px;
        color: black;
    }
    .carousel-control-prev, .carousel-control-next {
        width: 30px; 
        background: none;	
        margin: auto 0;
    }

    .carousel-control-prev i, .carousel-control-next i {
        font-size: 30px;
        position: absolute;
        top: 50%;
        display: inline-block;
        color: rgba(0, 0, 0, 0.8);
        text-shadow: none;
        font-weight: bold;
    }
</style>

<jsp:include page="header.jsp"/> 

<body>
    <br>
    <%
        Integer userId = (Integer)session.getAttribute("userId");
        if(userId==null){
    %>
        
        <img src="assets/logo.png" class="not-user">
        <h2 class="not-user">You are not logged in</h2>
        <h2 class="not-user"> <a href="login.jsp">Login here to see your reservations</a>  </h2>
    <%

        }else{
            
            int countOngoing = 0;
            ResultSet rsCntOngoing = null;
            String getCntOngoingQuery = String.format("SELECT count(a.restoId) as cnt FROM reservation a join restaurant b on a.restoId = b.restoId WHERE a.reserveDate >= current_date AND a.userId = ('%s')", userId);
            rsCntOngoing = st.executeQuery(getCntOngoingQuery);   
            while(rsCntOngoing.next()){  
                countOngoing = rsCntOngoing.getInt("cnt") ;
            }
            if(countOngoing == 0){

            }else{
            
    %>
            
        <div class="container-xl">
            <div class="row">
                <div class="col-md-10 mx-auto">
                    <h2 class="carousel-header">Ongoing Reservations...</h2>
                    <br>
                    <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="0">
                    <!-- Wrapper for carousel items -->
                    <div class="carousel-inner">
                        <%
                            int i = 1;
                            int size = 0;
                            ResultSet rs = null;
                            String getOngoingQuery = String.format("SELECT a.restoId, b.urlImage, b.restoName, a.reserveDate, a.startTime, a.endTime, a.quantity FROM reservation a join restaurant b on a.restoId = b.restoId WHERE a.reserveDate >= current_date AND a.userId = ('%s')", userId);
                            rs = st.executeQuery(getOngoingQuery);
                            while(rs.next()){
                                if(i == 1){
                        %>
                            <div class="carousel-item active">
                                <div class="row">             
                        <%
                            }else if((i!=1) && (i%3==1)){
                        %>
                            <div class="carousel-item">
                                <div class="row">           
                        <%   
                            }
                        %>    
                                    <div class="col-sm-4">
                                        <div class="thumb-wrapper">
                                            <form action="restoDtl.jsp?restoId=<%=rs.getInt("restoId")%>" method="POST">
                                                <button type="submit" class="btn btn-primary" >
                                                    <div class="img-box">
                                                        <img src="<%= rs.getString("urlImage") %>" class="img-fluid" alt="">
                                                    </div>
                                                    <div class="thumb-content">
                                                        <%-- <input hidden type="int" name="restoId" value="<%= rs.getString("restoId") %>"> --%>
                                                        <h4><%= rs.getString("restoName") %></h4>
                                                        <p><%= rs.getString("reserveDate") %></p>
                                                        <p><%= rs.getString("startTime") %> - <%= rs.getString("endTime") %></p>
                                                        <p><%= rs.getString("quantity") %> pax</p>
                                                    </div>		
                                                </button>
                                            </form>                                            
                                        </div>
                                    </div>
                                            
                        <%  
                            if((i%3==0)){
                        %>
                                        
                                </div>
                            </div> 
                        <%
                                }
                                    i = i + 1;
                            }
                            if ((i-1)%3!=0){
                        %>         
                                </div>
                            </div> 
                        <%
                            }
                        %>
                    </div>
                    <!-- Carousel controls -->
                    <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
                        <i class="fa fa-angle-left"></i>
                    </a>
                    <a class="carousel-control-next" href="#myCarousel" data-slide="next">
                        <i class="fa fa-angle-right"></i>
                    </a>
                    </div>
                </div>
            </div>
        </div>
        <br>
    <%
            }

        int countPast = 0;
        ResultSet rsPast = null;
        String getCntPastQuery = String.format("SELECT count(a.restoId) as cnt FROM reservation a join restaurant b on a.restoId = b.restoId WHERE a.reserveDate < current_date AND a.userId = ('%s')", userId);
        rsPast = st.executeQuery(getCntPastQuery);   
        while(rsPast.next()){  
            countPast = rsPast.getInt("cnt") ;
        }
        if(countPast == 0){

        }else{
    %>

        <div class="container-xl">
            <div class="row">
                <div class="col-md-10 mx-auto">
                    <h2 class="carousel-header">Past Reservations...</h2>
                    <br>
                    <div id="myCarousel2" class="carousel slide" data-ride="carousel" data-interval="0">
                    <!-- Wrapper for carousel items -->
                    <div class="carousel-inner">
                        <%
                            int j = 1;
                            ResultSet rs2 = null;
                            String getPastQuery = String.format("SELECT a.restoId, b.urlImage, b.restoName, a.reserveDate, a.startTime, a.endTime, a.quantity FROM reservation a join restaurant b on a.restoId = b.restoId WHERE a.reserveDate < current_date AND a.userId = ('%s')", userId);
                            rs2 = st.executeQuery(getPastQuery);
                            while(rs2.next()){
                                if(j == 1){
                        %>
                            <div class="carousel-item active">
                                <div class="row">             
                        <%
                            }else if((j!=1) && (j%3==1)){
                        %>
                            <div class="carousel-item">
                                <div class="row">           
                        <%   
                            }
                        %>    
                                    <div class="col-sm-4">
                                        <div class="thumb-wrapper"  >
                                            <form action="restoDtl.jsp?restoId=<%=rs2.getInt("restoId")%>" method="POST">
                                                <button type="submit" class="btn btn-primary" >
                                                    <div class="img-box">
                                                        <img src="<%= rs2.getString("urlImage") %>" class="img-fluid" alt="">
                                                    </div>
                                                    <div class="thumb-content">
                                                        <input hidden type="int" name="restoId" value="<%= rs2.getString("restoId") %>">
                                                        <h4><%= rs2.getString("restoName") %></h4>
                                                        <p><%= rs2.getString("reserveDate") %></p>
                                                        <p><%= rs2.getString("startTime") %> - <%= rs2.getString("endTime") %></p>
                                                        <p><%= rs2.getString("quantity") %> pax</p>
                                                    </div>			
                                                </button>
                                            </form>  
                                        </div>
                                    </div>
                                            
                        <%  
                            if((j%3==0)){
                        %>
                                        
                                </div>
                            </div> 
                        <%
                                }
                                    j = j + 1;
                            }
                            if ((j-1)%3!=0){
                        %>         
                                </div>
                            </div> 
                        <%
                            }
                        %>
                    </div>
                    <!-- Carousel controls -->
                    <a class="carousel-control-prev" href="#myCarousel2" data-slide="prev">
                        <i class="fa fa-angle-left"></i>
                    </a>
                    <a class="carousel-control-next" href="#myCarousel2" data-slide="next">
                        <i class="fa fa-angle-right"></i>
                    </a>
                    </div>
                </div>
            </div>
        </div>
    <%
            }
            if((countOngoing == 0) && (countPast == 0)){
                %>
                    <img src="assets/logo.png" class="not-user">
                    <h2 class="not-user">You have no reservations</h2>
                    <h2 class="not-user"><a href="home.jsp">See restaurant list to reserve</a></h2>
                <%
            }
        }
    %>
    <br>
    <br>
</body>

<jsp:include page="footer.jsp" /> 

</html>
