<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Giỏ hàng</title>
    <link rel="icon" type="image/x-icon" href="http://www.itsmoimoidesign.com/public/svg/main-logo-1.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .img-cart {
            display: block;
            max-width: 50px;
            height: auto;
            margin-left: auto;
            margin-right: auto;
        }

        table tr td {
            border: 1px solid #FFFFFF;
        }

        table tr th {
            background: #eee;
        }

        .panel-shadow {
            box-shadow: rgba(0, 0, 0, 0.3) 7px 7px 7px;
        }
    </style>
</head>
<body>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<div class="container bootstrap snippets bootdey" style="padding-left: 200px; padding-top: 20px">
    <div class="col-md-9 col-sm-8 content">
        <div class="row">
            <div class="col-md-12">
                <ol class="breadcrumb">
                    <li><a href="/home">Home</a></li>
                    <li class="active">Cart</li>
                </ol>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-info panel-shadow">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <c:if test="${(ds==null)}">
                                <h3 style="text-align: center">Bạn chưa thêm sản phẩm vào giỏ</h3>
                            </c:if>
                            <c:if test="${(ds!=null)}">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Description</th>
                                    <th>Qty</th>
                                    <th>Price</th>
                                    <th>Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${cartList}" var="sp">
                                <tr>
                                    <td>
                                        <img src="${sp.sp.anhSP}"
                                             class="img-cart">
                                    </td>
                                    <td>
                                        <strong>${sp.tenSp}</strong>
                                        <p>${sp.sp.nsx.ten}</p>
                                    </td>
                                    <td>
                                        <form class="form-inline" action="/updateGH" method="post">
                                            <input class="form-control" type="text" name="soLuong" value="${sp.soLuong}">
                                            <input  hidden="true" name="id" value="${sp.sp.id}">
                                            <button rel="tooltip" class="btn btn-default" type="submit"><i
                                                    class="fa fa-pencil"></i></button>
                                            <a href="/remove?id=${sp.sp.id}" class="btn btn-primary"><i
                                                    class="fa fa-trash-o"></i></a>
                                        </form>
                                    </td>
                                    <td>$${sp.giaBan}</td>
                                    <td>$${sp.giaBan * sp.soLuong}</td>
                                </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="4" class="text-right"><strong>Total</strong></td>
                                    <td>$${total}</td>
                                </tr>
                                </tbody>
                                </c:if>
                            </table>
                        </div>
                    </div>
                </div>
                <a href="/home" class="btn btn-success"><span
                        class="glyphicon glyphicon-arrow-left"></span>&nbsp;Continue Shopping</a>
                <c:if test="${(ds!=null)}">
                    <a href="/checkOut" class="btn btn-primary pull-right" >Next<span
                            class="glyphicon glyphicon-chevron-right"></span></a>
                </c:if>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
</script>
</body>
</html>
