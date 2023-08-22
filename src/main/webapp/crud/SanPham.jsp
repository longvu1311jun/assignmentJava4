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
    </style>
</head>

<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container">
    <form method="post" action="/spAdd">
        <div class="row">
            <div class=" col">
                <label class="form-label">Sản phẩm </label>
                <a href="/editSP"
                   class="btn btn-sm btn-outline-secondary badge">
                    <i class="fa fa-pencil" aria-hidden="true"></i></a>
                <select class="form-select" aria-label="Default select example" name="sPham">
                    <c:forEach items="${sanP}" var="sx">
                        <option value="${sx.id}">${sx.ten}</option>
                    </c:forEach>
                </select>

            </div>
            <div class="col">
                <label class="form-label">Màu sắc</label>
                <a href="/mauSac/showcl"
                   class="btn btn-sm btn-outline-secondary badge">
                    <i class="fa fa-pencil" aria-hidden="true"></i></a>
                <select class="form-select" aria-label="Default select example" name="color">
                    <c:forEach items="${color}" var="sx">
                        <option value="${sx.id}">${sx.ten}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row">
            <div class=" col">
                <label class="form-label">Dòng SP</label>
                <a href="/dongsp/show"
                   class="btn btn-sm btn-outline-secondary badge">
                    <i class="fa fa-pencil" aria-hidden="true"></i></a>
                <select class="form-select" aria-label="Default select example" name="dsp">
                    <c:forEach items="${type}" var="sx">
                        <option value="${sx.id}">${sx.ten}</option>
                    </c:forEach>
                </select>
            </div>
            <div class=" col">
                <label class="form-label">Dung lượng</label>
                <a href="/dungLuong/showdl"
                   class="btn btn-sm btn-outline-secondary badge">
                    <i class="fa fa-pencil" aria-hidden="true"></i></a>
                <select class="form-select" aria-label="Default select example" name="sx">
                    <c:forEach items="${nsx}" var="sx">
                        <option value="${sx.id}">${sx.ten}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row">
            <div class=" col">
                <label class="form-label">Mô tả</label>
                <input type="text" class="form-control" name="moTa">
            </div>
            <div class="col">
                <label class="form-label">Số lượng tồn</label>
                <input type="text" class="form-control" name="soLuongTon">
            </div>
        </div>
        <div class="row">
            <div class=" col">
                <label class="form-label">Giá nhập</label>
                <input type="text" class="form-control" name="giaNhap">
            </div>
            <div class="col">
                <label class="form-label">Giá bán</label>
                <input type="text" class="form-control" name="giaBan">
            </div>
        </div>
        <div class="row">
            <div class=" col">
                <label class="form-label">Năm BH</label>
                <input type="text" class="form-control" name="namBH">
            </div>
            <div class="col">
                <label class="form-label">Ảnh</label>
                <input type="text" class="form-control" name="anhSP">
            </div>
        </div>
        <div class="row">
            <div class="col">
                <br>
                <a href="/home" class="btn btn-warning">back</a>
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
                            <ul class="shop__sorting">
                            <li><a href="/SanPham/qlsp">Tất cả</a></li>
                            <c:forEach items="${type1}" var="c">
                                <li><a class="${c.ten==chid?"active":""}" href="/SanPham/qlsp?cid=${c.ten}">${c.ten}</a></li>
                            </c:forEach>
                            </ul>
                            <div class="e-table">
                                <div class="table-responsive table-lg mt-3">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>Mã SP</th>
                                            <th>Tên SP</th>
                                            <th>Dung lượng</th>
                                            <th>Màu sắc</th>
                                            <th>Dòng SP</th>
                                            <th>Năm BH</th>
                                            <th>Số lượng</th>
                                            <th>Giá nhập</th>
                                            <th>Giá bán</th>
                                            <th>Mô tả</th>
                                            <th>Ảnh</th>
                                            <th>Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${ds}" var="kh">
                                            <tr>
                                                <td class="align-middle">${kh.sanPham.ma}</td>
                                                <td class="align-middle">${kh.sanPham.ten}</td>
                                                <td class="align-middle text-center">${kh.nsx.ten}</td>
                                                <td class="text-nowrap align-middle">${kh.mauSac.ten}</td>
                                                <td class="text-nowrap align-middle">${kh.dongSP.ten}</td>
                                                <td class="text-center align-middle">${kh.namBH}</td>
                                                <td class="text-center align-middle">${kh.soLuongTon}</td>
                                                <td class="text-center align-middle">${kh.giaNhap}</td>
                                                <td class="text-center align-middle">${kh.giaBan}</td>
                                                <td class="text-center align-middle">${kh.moTa}</td>
                                                <td class="text-center align-middle"><img src="${kh.anhSP}" width="50px"
                                                                                          height="50px"></td>
                                                <td class="text-center align-middle">
                                                    <div class="btn-group align-top">
                                                        <a href="/spDetail?id=${kh.id}"
                                                           class="btn btn-sm btn-outline-secondary badge">Edit</a>
                                                        <a href="/sanpham/deleteSP?id=${kh.id}"
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