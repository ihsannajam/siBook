<head>
    <link rel="icon" type="image/png" sizes="16x16" href="assets/favicon-16x16.png">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<style>
    body {
        margin: 0;
    }

    .header {
        overflow: hidden;
        background-color: #e9e9e9;
    }

    .header a {
        float: left;
        display: block;
        color: black;
        text-align: center;
        padding: 15px 15px;
        font-size: 20px;
    }

    .header a:hover {
        background-color: #ddd;
        text-decoration: none;
        color: black;
    }

    .header .search-container {
        float: left;
    }

    .header input[type=text] {
        padding: 6px;
        text-align: center;
        margin-top: 10px;
        margin-left: 10px;
        font-size: 20px;
        border: none;
        border-radius: 20px;
    }

    .header .search-container button {
        /* float: left; */
        margin-top: 8px;
        font-size: 20px;
        background: #e9e9e9;
        border: none;
        cursor: pointer;
    }

    .header .search-container button:hover {
        background: #ccc;
    }
</style>

<div id="header" class="header">
    <div class="float-left">
        <a href="home.jsp"><img src="assets/logo-32x32.png"></a>
        <div class="search-container">
            <form action="search.jsp">
                <input type="text" placeholder="Find a Restaurant" name="search" size="50">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </div>
    </div>
    <div class="float-right">
        <a href="reservation.jsp">My Reservations</a>
        <a href="profile.jsp">My Profile</a>
    </div>
    <br>
</div>

