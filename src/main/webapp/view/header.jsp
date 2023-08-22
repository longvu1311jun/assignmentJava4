<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Google plus navbar style - Bootdey.com</title>
    <link rel="icon" type="image/x-icon" href="http://www.itsmoimoidesign.com/public/svg/main-logo-1.svg" />
<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://kit.fontawesome.com/e1bfe2858d.js" crossorigin="anonymous"></script>
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
    body{
background: #ffffff;


}
#subnav {
    width: 100%;
    text-align: center;
}
.navbar-default {
    background-color: #F4F4F4;
    border-width: 0;
}

.navbar-default .navbar-nav > .active > a, .navbar-default .navbar-nav > li:hover > a {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background-color: rgba(0, 0, 0, 0);
    border-color: #4285F4;
    border-image: none;
    border-style: solid;
    border-width: 0 0 2px;
    font-weight: 800;
}
    .notification {
        text-decoration: none;
        padding: 10px 20px;
        position: relative;
        display: inline-block;
        border-radius: 2px;
    }

    .notification:hover {
        background: red;
    }

    .notification .badge {
        position: absolute;
        top: 0px;
        right: -5px;
        padding: 5px 8px;
        border-radius: 50%;
        background: red;
        color: white;
    }
    </style>
</head>
<body>
<div id="subnav" class="navbar navbar-default" >
    <div class="col-md-12">
        <div id="navbar-collapse2" class="collapse navbar-collapse">
            <div class="nav navbar-nav navbar-left"style="padding: 10px">
                <img src="http://www.itsmoimoidesign.com/public/svg/main-logo-1.svg" alt="" style="width: 50px; height: 50px;">
            </div>
            <ul class="nav navbar-nav navbar-right">

                    <li><a href="/giohang" class="notification">
                        <i class="fa-solid fa-cart-shopping"></i></i>
                        <span class="badge">${cart.getList().size()}</span>
                    </a></li> <li><a data-toggle="modal" role="button" href="/login">Quản lý</a></li>

                </ul>
        </div>

    </div>
</div>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
</body>
</html>