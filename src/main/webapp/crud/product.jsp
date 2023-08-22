<!--
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
-->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Quản lý Sản Phẩm</title>
    <link rel="icon" type="image/x-icon" href="http://www.itsmoimoidesign.com/public/svg/main-logo-1.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        form {
            border: 1px solid #dedede;
            border-radius: 5px;
            padding: 10px;
            margin: 20px;
        }

        .content {
            margin: auto;
            width: 80%;
            float: right;
            margin-left: 30px;
            height: auto;
            text-align: right;
        }

        .pagination {
            display: inline-block;
        }

        .pagination a {
            color: black;
            font-size: 15px;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
        }

        .pagination a.active {
            background-color: #4771d0;
            color: white;
        }

        .pagination a:hover:not(.active) {
            background-color: #a4a4a4;
        }
    </style>
</head>

<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container">
    <form method="post" action="/product/ProAdd">
        <div class="row">
            <div class="col">
                <label class="form-label">Mã sản phẩm</label>
                <input type="text" class="form-control" name="ma">
            </div>
            <div class=" col">
                <label class="form-label">Tên sản phẩm</label>
                <input type="text" class="form-control" name="ten">
            </div>
        </div>
        <div class="row">
            <div class="col">
                <br>
                <a href="/SanPham/qlsp" class="btn btn-warning">back</a>
                <button class="btn btn-warning" type="submit"> add</button>
            </div>
        </div>
    </form>
    <div class="row flex-lg-nowrap">
        <div class="col">
            <div class="row flex-lg-nowrap">
                <div class="col mb-3">
                    <div class="e-panel card">
                        <div class="card-body">
                            <div class="card-title">
                                <h6 class="mr-2"><span>Danh sách sản phẩm</span></h6>
                            </div>

                            <div class="e-table">
                                <div class="table-responsive table-lg mt-3">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>Mã SP</th>
                                            <th>Tên SP</th>
                                            <th>Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${ds}" var="sp">
                                            <tr>
                                                <td class="align-middle">${sp.ma}</td>
                                                <td class="align-middle">${sp.ten}</td>
                                                <td class="text-center align-middle">
                                                    <div class="btn-group align-top">
                                                        <a href="/product/detail?id=${sp.id}"
                                                           class="btn btn-sm btn-outline-secondary badge">Edit</a>
                                                        <a href="/product/delete?id=${sp.id}"
                                                           class="btn btn-sm btn-outline-secondary badge">
                                                            <i class="fa fa-trash"></i></a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="content">
                                        <c:set var="page" value="#{page}"/>
                                        <div>
                                            <div class="pagination">
                                                <c:forEach begin="${1}" end="${number}" var="i">
                                                    <a href="?page=${i}" class="${i==page?"active":""}">${i}</a>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
</script>
</body>
</html>