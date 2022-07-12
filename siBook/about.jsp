<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SiBook - About</title>
    <style>
        html,body{
            margin: 0;
        }
        .container {
            position: relative;
            text-align: center;
            color: white;
        }

        .centered {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 100px;
        }
        h1{
            text-align: center;
            color: white;
            font-size: 50px;
            z-index: -1;
            opacity: 100%;
        }
        h2{
            text-align: center;
            font-size: 35px;
        }
        p{
            text-align: center;
            font-size: 20px;
        }
        .motto{
            background-color: rgba(147, 143, 145, 0.8);
            width: 70%;
            margin-left: 15%;
        }
    </style>
</head>
<%@include file="header.jsp"%>
<body>
    <div class="container">
        <img src="assets/food.jpg" alt="food" style="width:100%;">
        <div class="centered">RESERVATION MADE <br>EASY</div>
    </div>
    <br>
    <h2>About</h2>
    <br>
    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
    <br>
    <br>
</body>
<%@include file="footer.jsp"%>
</html>