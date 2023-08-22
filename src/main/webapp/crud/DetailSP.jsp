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
    <form method="post" action="/spUpdate">
        <div class="row">
            <div class=" col">
                <label class="form-label">Sản phẩm</label>
                <input name="idct" hidden type="${pr.id}">
                <select class="form-select" aria-label="Default select example" name="sPham">
                    <c:forEach items="${sanP}" var="sx">
                        <option value="${sx.id}" ${pr.sanPham.ten==sx.ten?"selected":""}>${sx.ten}</option>
<%--                        ${pr.id == sx.id?"selected":""}--%>
                    </c:forEach>
                </select>
            </div>
            <div class="col">
                <label class="form-label">Màu sắc</label>
<%--                <input type="text" value="${pr.mauSac.ten}">--%>
                <select class="form-select" aria-label="Default select example" name="color">
                    <c:forEach items="${color}" var="sx">
                        <option value="${sx.id}" ${pr.mauSac.ten==sx.ten?"selected":""}>${sx.ten}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row">
            <div class=" col">
                <label class="form-label">Dòng SP</label>
                <select class="form-select" aria-label="Default select example" name="dsp">
                    <c:forEach items="${type}" var="sx">
                        <option value="${sx.id}" ${pr.dongSP.ten==sx.ten?"selected":""}>${sx.ten}</option>
                    </c:forEach>
                </select>
            </div>
            <div class=" col">
                <label class="form-label">Dung lượng</label>
                <select class="form-select" aria-label="Default select example" name="sx">
                    <c:forEach items="${nsx}" var="sx">
                        <option value="${sx.id}" ${pr.nsx.ten==sx.ten?"selected":""}>${sx.ten}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row">
            <div class=" col">
                <label class="form-label">Mô tả</label>
                <input type="text" class="form-control" name="moTa" value="${pr.moTa}">
            </div>
            <div class="col">
                <label class="form-label">Số lượng tồn</label>
                <input type="text" class="form-control" name="soLuongTon" value="${pr.soLuongTon}">
            </div>
        </div>
        <div class="row">
            <div class=" col">
                <label class="form-label">Giá nhập</label>
                <input type="text" class="form-control" name="giaNhap" value="${pr.giaNhap}">
            </div>
            <div class="col">
                <label class="form-label">Giá bán</label>
                <input type="text" class="form-control" name="giaBan" value="${pr.giaBan}">
            </div>
        </div>
        <div class="row">
            <div class=" col">
                <label class="form-label">Năm BH</label>
                <input type="text" class="form-control" name="namBH" value="${pr.namBH}">
            </div>
            <div class="col">
                <label class="form-label">Ảnh</label>
                <input type="text" class="form-control" name="anhSP" value="${pr.anhSP}">
            </div>
        </div>
        <div class="row">
            <div class="col">
                <br>
                <a href="/SanPham/qlsp" class="btn btn-warning">back</a>
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