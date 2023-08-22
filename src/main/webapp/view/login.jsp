<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Login</title>
    <link rel="icon" type="image/x-icon" href="http://www.itsmoimoidesign.com/public/svg/main-logo-1.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        @media (min-width: 768px) {
            .container {
                max-width: 730px;
            }
        }

        .jumbotron {
            text-align: center;
            padding: 0px !important;
        }


        .form-signin {
            max-width: 280px;
            margin: 0 auto;
        }

        .form-signin .form-signin-heading,
        .form-signin {
            margin-bottom: 10px;
        }

        .form-signin .form-control {
            position: relative;
            font-size: 16px;
            height: auto;
            padding: 10px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .form-signin .form-control:focus {
            z-index: 2;
        }

        .form-signin input[type="text"] {
            margin-bottom: -1px;
            border-bottom-left-radius: 0;
            border-bottom-right-radius: 0;
            border-top-style: solid;
            border-right-style: solid;
            border-bottom-style: none;
            border-left-style: solid;
            border-color: #000;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
            border-top-style: none;
            border-right-style: solid;
            border-bottom-style: solid;
            border-left-style: solid;
            border-color: rgb(0, 0, 0);
            border-top: 1px solid rgba(0, 0, 0, 0.08);
        }

        .form-signin-heading {
            text-align: center;
            text-shadow: 0 2px 2px rgba(0, 0, 0, 0.5);
            color: #5bc0de !important;
            padding-top: 25px;
        }
    </style>
</head>

<body>
<div class="container bootstrap snippets bootdey">
    <div style="height:auto;min-height:300px;" class="jumbotron">
        <form accept-charset="utf-8" method="post" id="UserLoginForm" class="form-signin" action="login">
            <h1 class="form-signin-heading text-muted">Login</h1>
            <p style="color: red">${error}</p>
            <input type="text" autofocus="autofocus" placeholder="Số điện thoại" class="form-control"
                   name="username">
            <input type="password" id="password" placeholder="Password" class="form-control" name="password">
            <button type="submit" class="btn btn-lg btn-info btn-block">
                <i class="fa fa-share"></i>
                Login
            </button>
        </form>

    </div>
</div>

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
</body>

</html>