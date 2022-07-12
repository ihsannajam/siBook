<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<%@include file="inc/connect.jsp"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <script defer src="inc/processData.js"></script> 
    <title>Reserve</title>
</head>

<style>
    .headline {
        width: 100%;
    }

    * {
        box-sizing: border-box;
    }
    .error_msg{
    font-size: 20px;
    font-weight: bold;
    color: #ff2c2c;
    margin-top: 10px;
    margin-bottom: 30px;
}
    
    /* Create two equal columns that floats next to each other */
    .description {
        float: left;
        width: 35%;
        height: 450px;
        padding: 30px;
        /* height: 300px; */
        border-radius: 25px;
        margin: 20px;
        background-color: rgb(238, 238, 238);
    }

    .description .text {
        font-size: 40px;
    }

    .description .loc {
        width: 60px;
        height: 90px;
    }

    .description .text-loc {
        float: right;
        font-size: 35px;
    }

    .form_container {
        float: right;
        width: 55%;
        padding: 30px;
        border-radius: 25px;
        margin: 20px;
    }

    .form_container .button {
        background-color: red;
        border: none;
        color: black;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 20px;
        width: 250px;
        border-radius: 25px;
        height: 50px;
        
    }

    .input-text {
        width: 100%; 
        height: 70px;
        text-align: center;
        border-radius: 50px;
        font-size: 20px;
    }
    
    /* Clear floats after the columns */
    .row:after {
        content: "";
        display: table;
        clear: both;
    }
</style>

<body>
    <%@include file="header.jsp"%>

    <%
        String restoId = request.getParameter("restoId");
        session.setAttribute("restoId",restoId);
        Integer userId = (Integer)session.getAttribute("userId");
        ResultSet rs = null;
        String query = String.format("SELECT urlImage, restoName, restoAddress, restoDescr FROM restaurant WHERE restoId=('%s')", restoId);
        rs = st.executeQuery(query);    
        while(rs.next())  {
    %>       
    
        <img src="<%= rs.getString("urlImage") %>" class="headline">
        <br>
        <br>
        <h1><center><%= rs.getString("restoName") %></center></h1>
        
        <div class="row">
            <div class="description">
                <td colspan="2">
                <h2 class="text"><center><%= rs.getString("restoDescr") %></center></h2>
                <br>
                <br>
                <div>
                    <img src="assets/loc.png" class="loc"> 
                    <h2 class="text-loc"><%= rs.getString("restoAddress") %></h2>
                </div>

            </div>
    <%
        }
    %>
            <div class="form_container">
                <form 
                id="form" 
                action="controller/reservasi_controller.jsp" >
                    <input class="input-text" type="text" id="rsvDate" name="rsvDate" placeholder="Reservation Date"
                    onfocus="(this.type='date')"
                    onblur="(this.type='text')" > <br><br>

                    <input class="input-text" type="text" id="rsvTimeStart" name="rsvTimeStart" placeholder="Reservation Time Start"
                    onfocus="(this.type='time')"
                    onblur="(this.type='text')" > <br><br>

                    <input class="input-text" type="text" id="rsvTimeEnd" name="rsvTimeEnd" placeholder="Reservation Time End"
                    onfocus="(this.type='time')"
                    onblur="(this.type='text')" > <br><br>

                    <input class="input-text" type="text" id="rsvQty" name="rsvQty" placeholder="Reservation Quantity"
                    onfocus="(this.type='number')"
                    onblur="(this.type='text')" > <br><br>
                    <center>
                        <input type="submit" value="Reserve" class="button">
                    </center>   
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

                </form>                           
            </div>
        </div>
    <%@include file="footer.jsp"%>
</body>
</html>