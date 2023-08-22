<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="http://www.itsmoimoidesign.com/public/svg/main-logo-1.svg" />
    <title>Check out</title>
    <Style>
        .container1 {
            margin: 20px;
            padding-left: 25%;
        }

        .lh-condensed {
            line-height: 1.25;
        }
    </Style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<%--    <script src="check.js"></script>--%>
</head>

<body>
<div class="container1">
    <div class="row">
        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">Thông tin giao hàng</h4>
            <form class="needs-validation" novalidate="" action="/done" method="get">
                <div class="mb-3">
                    <label for="hoten">Họ và tên</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="hoten" placeholder="Họ tên của bạn" required="" name="">
                        <div class="invalid-feedback" style="width: 100%;"> Your username is required.</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="sdt">Số điện thoại</label>
                        <input type="number" class="form-control" id="sdt" placeholder="Số điện thoại nhận hàng" value=""
                               required="" name="">
                        <div class="invalid-feedback"> Valid first name is required.</div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" placeholder="you@example.com" required=""
                               name="">
                        <div class="invalid-feedback"> Please enter a valid email address for shipping updates.</div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="tp">Tỉnh/Thành phố</label>
                        <input type="text" class="form-control" id="tp" placeholder="" value="" required=""
                               name="">
                        <div class="invalid-feedback"> Valid last name is required.</div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="qh">Quận/Huyện</label>
                        <input type="text" class="form-control" id="qh" placeholder="" value="" required=""
                               name="">
                        <div class="invalid-feedback"> Valid first name is required.</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="xp">Xã/Phường</label>
                        <input type="text" class="form-control" id="xp" placeholder="" value="" required=""
                               name="">
                        <div class="invalid-feedback"> Valid last name is required.</div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="dc">Địa chỉ giao hàng</label>
                        <input type="text" class="form-control" id="dc" placeholder="Địa chỉ cụ thể" value=""
                               required="" name="">
                        <div class="invalid-feedback"> Valid first name is required.</div>
                    </div>
                </div>
                <a href="/giohang" class="btn btn-secondary btn-lg btn-block">Trở lại</a>
                <button class="btn btn-primary btn-lg btn-block" type="submit">Xác nhận</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script>
    (function () {
        'use strict'

        window.addEventListener('load', function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation')

            // Loop over them and prevent submission
            Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
        }, false)
    }())
</script>