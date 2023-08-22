<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Chi tiết sản phẩm</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="http://www.itsmoimoidesign.com/public/svg/main-logo-1.svg" />
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
    </style>
</head>

<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container">
    <form method="post" action="/product/ProUpdate">
        <div class="row">
            <div class="col">
                <label class="form-label">Mã sản phẩm</label>
                <input type="text" class="form-control" name="ma" value="${sp.ma}">
                <input type="text" class="form-control" name="id" value="${sp.id}" hidden>
            </div>
            <div class=" col">
                <label class="form-label">Tên sản phẩm</label>
                <input type="text" class="form-control" name="ten" value="${sp.ten}">
            </div>
        </div>
        <div class="row">
            <div class="col">
                <br>
                <a href="/product/show" class="btn btn-warning">back</a>
                <button class="btn btn-warning" type="submit"> update</button>
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