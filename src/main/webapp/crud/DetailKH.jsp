<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Quản lý khách hàng</title>
    <link rel="icon" type="image/x-icon" href="http://www.itsmoimoidesign.com/public/svg/main-logo-1.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        form {
            border: 1px solid #dedede;
            border-radius: 5px;
            padding: 10px;
            margin: 20px;
        }
    </style>
</head>

<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container">
    <form method="post" action="/updateKH">
        <div class="row">
            <div class=" col">
                <label class="form-label">matKhau</label>
                <input type="text" class="form-control" name="matKhau" value="${khDetail.matKhau}">
            </div>
            <div class="col">
                <label class="form-label">ma</label>
                <input type="text" class="form-control" name="ma" value="${khDetail.ma}">
                <input type="text" class="form-control" name="id" value="${khDetail.id}" hidden>
            </div>
        </div>
        <div class="row">
            <div class=" col">
                <label class="form-label">ten</label>
                <input type="text" class="form-control" name="ten" value="${khDetail.ten}">
            </div>
            <div class="col">
                <label class="form-label">tenDem</label>
                <input type="text" class="form-control" name="tenDem" value="${khDetail.tenDem}">
            </div>
        </div>
        <div class="row">
            <div class=" col">
                <label class="form-label">ho</label>
                <input type="text" class="form-control" name="ho" value="${khDetail.ho}">
            </div>
            <div class="col">
                <label class="form-label">ngaySinh</label>
                <input type="date" class="form-control" name="ngaySinh" value="${khDetail.ngaySinh}">
            </div>
        </div>
        <div class="row">
            <div class=" col">
                <label class="form-label">sdt</label>
                <input type="text" class="form-control" name="sdt" value="${khDetail.sdt}">

            </div>
            <div class="col">
                <label class="form-label">diaChi</label>
                <input type="text" class="form-control" name="diaChi" value="${khDetail.diaChi}">
            </div>
        </div><div class="row">
        <div class=" col">
            <label class="form-label">thanhPho</label>
            <input type="text" class="form-control" name="thanhPho" value="${khDetail.thanhPho}">
        </div>
        <div class="col">
            <label class="form-label">quocGia</label>
            <input type="text" class="form-control" name="quocGia" value="${khDetail.quocGia}">
        </div>
    </div>
        <div class="row">
            <div class="col">
                <br>
                <a href="/qlkh" class="btn btn-warning">back</a>
                <button  class="btn btn-warning" type="submit">update</button>
            </div>
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
</script>
</body>
</html>