<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>MOIMOI STORE</title>
    <link rel="icon" type="image/x-icon" href="http://www.itsmoimoidesign.com/public/svg/main-logo-1.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        /** Shop: Thumbnails **/
        .shop__thumb {
            border: 1px solid rgba(0, 0, 0, 0.05);
            padding: 20px;
            margin-bottom: 20px;
            background-color: white;
            text-align: center;
            -webkit-transition: border-color 0.1s, -webkit-box-shadow 0.1s;
            -o-transition: border-color 0.1s, box-shadow 0.1s;
            transition: border-color 0.1s, box-shadow 0.1s;
        }

        .shop__thumb:hover {
            border-color: rgba(0, 0, 0, 0.07);
            -webkit-box-shadow: 0 5px 30px rgba(0, 0, 0, 0.07);
            box-shadow: 0 5px 30px rgba(0, 0, 0, 0.07);
        }

        .shop__thumb > a {
            color: #333333;
        }

        .shop__thumb > a:hover {
            text-decoration: none;
        }

        .shop-thumb__img {
            position: relative;
            margin-bottom: 20px;
            width: 220px;
            height: 220px;
            overflow: hidden;
        }

        .shop-thumb__title {
            font-weight: 600;
        }

        .shop-thumb__price {
            color: #777777;
        }

        .shop-thumb-price_old {
            text-decoration: line-through;
        }

        .shop-thumb-price_new {
            color: red;
        }

        /** Shop: Filter **/
        .shop__filter {
            margin-bottom: 40px;
        }

        /* Shop filter: Pricing */
        .shop-filter__price {
            padding: 15px;
        }

        .shop-filter__price [class*='col-'] {
            padding: 2px;
        }

        /* Shop filter: Colors */
        .shop-filter__color {
            display: inline-block;
            margin: 0 2px 2px 0;
        }

        .shop-filter__color input[type="text"] {
            display: none;
        }

        .shop-filter__color label {
            width: 30px;
            height: 30px;
            background: transparent;
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 3px;
            cursor: pointer;
        }

        /** Shop: Sorting **/
        .shop__sorting {
            list-style: none;
            padding-left: 0;
            margin-bottom: 40px;
            margin-top: -20px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            text-align: right;
        }

        .shop__sorting > li {
            display: inline-block;
        }

        .shop__sorting > li > a {
            display: block;
            padding: 20px 10px;
            margin-bottom: -1px;
            border-bottom: 2px solid transparent;
            color: #757575;
            -webkit-transition: all .05s linear;
            -o-transition: all .05s linear;
            transition: all .05s linear;
        }

        .shop__sorting > li > a:hover,
        .shop__sorting > li > a:focus {
            color: #95ab0d;
            text-decoration: none;
        }

        .shop__sorting > li.active > a {
            color: #ed3e49;
            border-bottom-color: #ed3e49;
        }

        ul.shop__sorting li a.active {
            color: #F90;
        }

        @media (max-width: 767px) {
            .shop__sorting {
                text-align: left;
                border-bottom: 0;
            }

            .shop__sorting > li {
                display: block;
            }

            .shop__sorting > li > a {
                padding: 10px 15px;
                margin-bottom: 10px;
                border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            }

            .shop__sorting > li.active > a {
                font-weight: 600;
            }
        }

        /** Shop: Checkout **/
        .checkout__block {
            margin-bottom: 40px;
        }

        .checkout-cart__item {
            margin-bottom: 15px;
        }

        .checkout-cart-item__img {
            max-width: 80px;
            margin-right: 10px;
            float: left;
        }

        .checkout-cart-item__content {
            overflow: hidden;
        }

        .checkout-cart-item__heading {
            margin-top: 0;
        }

        .checkout-cart-item__footer {
            padding: 10px 0;
            margin-top: 10px;
            border-top: 1px solid #eee;
        }

        .checkout-cart-item__price {
            font-weight: 600;
        }

        .checkout-total__block {
            margin-bottom: 40px;
            border-top: 1px solid #e9e9e9;
            border-bottom: 1px solid #e9e9e9;
        }

        .checkout-total__block > .row > [class*="col-"] {
            padding: 40px 40px;
            border-right: 1px solid #e9e9e9;
            color: #aaa;
        }

        .checkout-total__block > .row > [class*="col-"]:last-child {
            border-right: 0;
            color: #333333;
        }

        @media (max-width: 767px) {
            .checkout-total__block {
                border: 0;
            }

            .checkout-total__block > .row > [class*="col-"] {
                padding: 15px 20px;
                border: 0;
                border-top: 1px solid #e9e9e9;
            }

            .checkout-total__block > .row > [class*="col-"]:last-child {
                border-bottom: 1px solid #e9e9e9;
            }
        }

        .checkout-total__heading {
            float: left;
        }

        .checkout-total__price {
            float: right;
            margin: 9px 0;
            font-size: 17px;
        }

        .checkout__submit {
            padding: 15px 40px;
        }

        /* Checkboxes */
        .checkbox input[type="checkbox"] {
            display: none;
        }

        .checkbox label {
            padding-left: 0;
        }

        .checkbox label:before {
            content: "";
            display: inline-block;
            vertical-align: middle;
            margin-right: 15px;
            width: 20px;
            height: 20px;
            line-height: 20px;
            background-color: #eee;
            text-align: center;
            font-family: "FontAwesome";
        }

        .checkbox input[type="checkbox"]:checked + label::before {
            content: "\f00c";
        }

        /* Radios */
        .radio input[type="radio"] {
            display: none;
        }

        .radio label {
            padding-left: 0;
        }

        .radio label:before {
            content: "";
            display: inline-block;
            vertical-align: middle;
            margin-right: 15px;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            border: 10px solid #eee;
            background-color: #333333;
        }

        .radio input[type="radio"]:checked + label:before {
            border-width: 7px;
        }
    </style>
    <script src="https://kit.fontawesome.com/49acfe8448.js" crossorigin="anonymous"></script>
</head>
<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div style="margin-left: 10px; margin-right: 10px">
    <%@include file="header.jsp" %>
</div>
<div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-12">
            <ul class="shop__sorting">
                <c:set var="cat" value="${data}"></c:set>
                <c:set var="chid" value="${chid}"></c:set>
                <li><a href="/home">Tất cả</a></li>
                <c:forEach items="${cat}" var="c">
                    <li><a class="${c.ten==chid?"active":""}"  href="/home?cid=${c.ten}">${c.ten}</a></li>
                </c:forEach>
                </ul>
            <div class="row">
                <c:forEach items="${dsSP}" var="sp">
                    <div class="col-sm-6 col-md-4">
                        <div class="shop__thumb">
                            <a href="detailSP?id=${sp.id}">
                                <div class="shop-thumb__img" >
                                    <img src="${sp.anhSP}"
                                         class="img-responsive" alt="...">
                                </div>
                                <h5 class="shop-thumb__title">
                                        ${sp.sanPham.ten} ${sp.nsx.ten}
                                </h5>
                                <div class="shop-thumb__price">
                                    <span class="shop-thumb__price">$${sp.giaBan}</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="row">
                <c:set var="page" value="#{page}"/>
                <div class="col-sm-12">
                    <ul class="pagination pull-right">
                        <li><a href="?page=1"><i class="fa-sharp fa-solid fa-backward"></i></a></li>
                        <c:forEach begin="${1}" end="${number}" var="i">
                            <li><a href="?page=${i}">${i}</a></li>
                        </c:forEach>
                        <li><a href="?page=${number}"><i class="fa-solid fa-forward"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
</body>

</html>