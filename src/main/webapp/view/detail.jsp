<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>MOIMOI STORE</title>
    <link rel="icon" type="image/x-icon" href="http://www.itsmoimoidesign.com/public/svg/main-logo-1.svg" />
    <script src="https://kit.fontawesome.com/49acfe8448.js" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        body {
            margin-top: 20px;
            background-color: burlywood;
        }

        .panel {
            border: none;
            box-shadow: none;
            width: 95%;
            background-color: #7c3737;
        }

        .pro-img-details {
            margin-left: -15px;
        }

        .pro-img-details img {
            width: 80%;
        }

        .product_meta {
            border-top: 1px solid #eee;
            border-bottom: 1px solid #eee;
            padding: 10px 0;
            margin: 15px 0;
        }

        .pro-price {
            font-size: 18px;
            padding: 0 10px;
        }

        .quantity {
            width: 120px;
        }

        strong {
            font-size: large;
        }

        .mota {
            font-size: 30px;
            font-family: 'Courier New', Courier, monospace;
        }

        .profile-sidebar {
            padding: 20px 0 10px 0;
            background: #fff;
        }

        .profile-usermenu {
            margin-top: 30px;
        }

        .profile-usermenu ul li {
            border-bottom: 1px solid #f0f4f7;
        }

        .profile-usermenu ul li:last-child {
            border-bottom: none;
        }

        .profile-usermenu ul li a {
            color: #93a3b5;
            font-size: 14px;
            font-weight: 400;
        }

        .profile-usermenu ul li a i {
            margin-right: 8px;
            font-size: 14px;
        }

        .profile-usermenu ul li a:hover {
            background-color: #fafcfd;
            color: #5b9bd1;
        }

        .profile-usermenu ul li.active {
            border-bottom: none;
        }

        .profile-usermenu ul li.active a {
            color: #5b9bd1;
            background-color: #f6f9fb;
            border-left: 2px solid #5b9bd1;
            margin-left: -2px;
        }
        footer{
            position:absolute;
            bottom:0;
            text-align: center;
            width: 100%;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div style="margin-left: 10px; margin-right: 10px">
    <%@include file="header.jsp"%>
</div>
    <div class=" bootdey">
        <div class="col-md-2">
            <div class="profile-sidebar">
                <div class="profile-usermenu">
                    <ul class="nav">
                        <li class="active">
                            <a href="/home">
                                <i class="glyphicon glyphicon-home"></i>
                                Home</a>
                        </li>
                        <li>
                            <a href="/home?cid=iPhone">
                                <i class="glyphicon glyphicon-ok"></i>
                                iPhone </a>
                        </li>
                        <li>
                            <a href="/home?cid=MacBook" target="_blank">
                                <i class="glyphicon glyphicon-ok"></i>
                                MacBook </a>
                        </li>
                        <li>
                            <a href="/home?cid=iMac">
                                <i class="glyphicon glyphicon-ok"></i>
                                iMac </a>
                        </li>
                        <li>
                            <a href="/home?cid=Apple Watch">
                                <i class="glyphicon glyphicon-ok"></i>
                                Apple Watch </a>
                        </li>
                        <li>
                            <a href="/home?cid=iPad">
                                <i class="glyphicon glyphicon-ok"></i>
                                iPad </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-md-10">
            <section class="panel">
                <div class="panel-body">
                    <div class="col-md-5">
                        <div class="pro-img-details">
                            <img src="${sp.anhSP}" alt="" >
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h1>${sp.sanPham.ten} ${sp.nsx.ten}</h1>
                        <br>
                        <div class="product_meta">
                            <br>
                            <p class="mota">${sp.moTa}</p>
                        </div>
                        <br>
                        <div class="m-bot15">
                            <strong>Price : </strong>
                            <span class="pro-price" >$${sp.giaBan}</span>

                        </div>
                        <br>
                        <p>
                            <a href="/addToCart?id=${sp.id}"  class="btn btn-round btn-danger" >
                                <i class="fa fa-shopping-cart"></i>
                                Add to Cart
                            </a>
                        </p>
                    </div>
                </div>
            </section>
        </div>

    </div>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    </script>
</body>
</html>