<!-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> -->
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
            <form method="post" action="/addKH">
                <div class="row">
                    <div class=" col">
                        <label class="form-label">matKhau</label>
                        <input type="text" class="form-control" name="matKhau">
                    </div>
                    <div class="col">
                        <label class="form-label">ma</label>
                        <input type="text" class="form-control" name="ma">
                    </div>
                </div>
                <div class="row">
                    <div class=" col">
                        <label class="form-label">ten</label>
                        <input type="text" class="form-control" name="ten">
                    </div>
                    <div class="col">
                        <label class="form-label">tenDem</label>
                        <input type="text" class="form-control" name="tenDem">
                    </div>
                </div>
                <div class="row">
                    <div class=" col">
                        <label class="form-label">ho</label>
                        <input type="text" class="form-control" name="ho">
                    </div>
                    <div class="col">
                        <label class="form-label">ngaySinh</label>
                        <input type="date" class="form-control" name="ngaySinh">
                    </div>
                </div>
                <div class="row">
                    <div class=" col">
                        <label class="form-label">sdt</label>
                        <input type="text" class="form-control" name="sdt">
                    </div>
                    <div class="col">
                        <label class="form-label">diaChi</label>
                        <input type="text" class="form-control" name="diaChi">
                    </div>
                </div><div class="row">
                <div class=" col">
                    <label class="form-label">thanhPho</label>
                    <input type="text" class="form-control" name="thanhPho">
                </div>
                <div class="col">
                    <label class="form-label">quocGia</label>
                    <input type="text" class="form-control" name="quocGia">
                </div>
            </div>
                <div class="row">
                    <div class="col">
                        <br>
                        <button  class="btn btn-warning" type="submit"> add</button>
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
                                        <h6 class="mr-2"><span>Danh sách khách hàng</span></h6>
                                    </div>

                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>

                                                        <th>Mã Khách hàng</th>
                                                        <th>Tên khách hàng</th>
                                                        <th>Số điện thoại</th>
                                                        <th>Địa chỉ</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                   <c:forEach items="${ds}" var="kh">

                                                    <tr>

                                                        <td class="align-middle text-center">
                                                            ${kh.ma}
                                                        </td>
                                                        <td class="text-nowrap align-middle">${kh.ho}
                                                            ${kh.tenDem} ${kh.ten}</td>
                                                        <td class="text-nowrap align-middle">${kh.sdt}</td>
                                                        <td class="text-center align-middle">${kh.diaChi}
                                                        </td>
                                                        <td class="text-center align-middle">
                                                            <div class="btn-group align-top">
                                                                <a href="/khDetail?id=${kh.id}"
                                                                   class="btn btn-sm btn-outline-secondary badge">Edit</a>
                                                                <a href="/deleteKH?id=${kh.id}"
                                                                   class="btn btn-sm btn-outline-secondary badge">
                                                                    <i class="fa fa-trash"></i></a>
                                                                </div>
                                                        </td>
                                                    </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <div class="">
                                                <c:set var="page" value="#{page}"/>
                                                <div>
                                                    <div class="d-flex justify-content-center">
                                                        <ul class="pagination mt-3 mb-0">
                                                            <li class="disabled page-item">
                                                            <li class="page-item">
                                                                <c:forEach begin="${1}" end="${number}" var="i">
                                                            <li class="page-item"><a href="?page=${i}" class="page-link">${i}</a></li>
                                                            </c:forEach>
                                                        </ul>
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