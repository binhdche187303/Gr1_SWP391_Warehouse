<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Fastkart">
        <meta name="keywords" content="Fastkart">
        <meta name="author" content="Fastkart">
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/1.png" type="image/x-icon">
        <title>Change First Password</title>

        <!-- Google font -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <!-- bootstrap css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/bootstrap.css">

        <!-- font-awesome css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/font-awesome.css">

        <!-- feather icon css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/feather-icon.css">

        <!-- slick css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/slick/slick.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/slick/slick-theme.css">

        <!-- Iconly css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bulk-style.css">

        <!-- Template css -->
        <link id="color-link" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">
        <style>
            .password-container {
                position: relative;
                width: 100%;
            }

            .password-container input {
                width: 100%;
                padding-right: 40px; /* Chừa khoảng trống cho icon */
            }

            .password-toggle {
                position: absolute;
                top: 50%;
                right: 10px;
                transform: translateY(-50%);
                cursor: pointer;
                font-size: 18px;
                color: #888;
            }

        </style>
        <style>
            /* Thêm vào phần style trong head */
            #passwordHelp ul {
                margin-top: 0.5rem;
                padding-left: 1rem;
                list-style-type: none; /* Bỏ dấu chấm mặc định */
            }

            #passwordHelp li {
                display: block; /* Quan trọng: buộc mỗi li xuống dòng */
                margin-bottom: 0.3rem;
            }

            #passwordHelp li small {
                font-size: 0.8rem;
                display: inline-block; /* Để có thể áp dụng vertical-align */
                vertical-align: middle;
            }

            #passwordHelp li:before {
                content: "• ";
                display: inline-block;
                width: 1em;
                margin-left: -1em;
            }

            .text-danger {
                color: #dc3545 !important;
            }

            .text-success {
                color: #28a745 !important;
            }
        </style>
    </head>
    <body>
        <!-- log in section start -->
        <section class="log-in-section background-image-2 section-b-space" style="margin-top: 200px">
            <div class="container-fluid-lg w-100">
                <div class="row">
                    <div class="col-xxl-6 col-xl-5 col-lg-6 d-lg-block d-none ms-auto">
                        <div class="image-contain">
                            <img src="${pageContext.request.contextPath}/assets/images/inner-page/log-in.png" class="img-fluid" alt="">
                        </div>
                    </div>

                    <div class="col-xxl-4 col-xl-5 col-lg-6 col-sm-8 mx-auto">
                        <div class="log-in-box">
                            <div class="log-in-title">
                                <h3>Thay đổi mật khẩu lần đầu</h3>
                            </div>
                            <br>
                            <% if(request.getAttribute("error") != null) { %>
                            <div class="alert alert-danger">
                                <%= request.getAttribute("error") %>
                            </div>
                            <% } %>

                            <div class="input-box">
                                <form class="row g-4" method="post" action="changepasswordemail">
                                    <div class="col-12">
                                        <div class="form-floating theme-form-floating log-in-form">
                                            <input type="text" class="form-control" id="identifier" name="identifier" 
                                                   placeholder="Email or Username" 
                                                   value="${requestScope.identifier}" required>
                                            <label for="identifier">Email hoặc tên tài khoản</label>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="password-container">
                                            <div class="form-floating theme-form-floating log-in-form">
                                                <input type="password" class="form-control" id="oldpass" name="oldpass" 
                                                       placeholder="Password" required>
                                                <label for="oldpass">Mật khẩu cũ</label>
                                                <span class="password-toggle" onclick="togglePassword('oldpass')">👁</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="password-container">
                                            <div class="form-floating theme-form-floating log-in-form">
                                                <input type="password" class="form-control" id="newpass" name="newpass" 
                                                       placeholder="Mật khẩu mới" required>
                                                <label for="newpass">Mật khẩu mới</label>
                                            </div>
                                            <div id="passwordHelp" class="form-text">
                                                <small>Mật khẩu phải chứa:</small>
                                                <ul>
                                                    <li id="length" class="text-danger"><small>Tối thiểu 8 ký tự</small></li>
                                                    <li id="uppercase" class="text-danger"><small>Ít nhất 1 chữ in hoa (A-Z)</small></li>
                                                    <li id="number" class="text-danger"><small>Ít nhất 1 số (0-9)</small></li>
                                                    <li id="special" class="text-danger"><small>Ít nhất 1 ký tự đặc biệt (@$!%*?&)</small></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating theme-form-floating log-in-form">
                                            <input type="password" class="form-control" name="confirmpass" 
                                                   placeholder="Password" value="" required>
                                            <label for="password">Mật khẩu xác nhận</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button class="btn btn-animation w-100 justify-content-center" type="submit">Xác nhận</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- log in section end -->
        <!-- Tap to top end -->
        <script>
            function togglePassword(inputId) {
                const input = document.getElementById(inputId);
                input.type = (input.type === "password") ? "text" : "password";
            }
        </script>
        <!-- Bg overlay Start -->
        <div class="bg-overlay"></div>
        <!-- Bg overlay End -->

        <!-- latest jquery-->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>

        <!-- Bootstrap js-->
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/popper.min.js"></script>

        <!-- feather icon js-->
        <script src="${pageContext.request.contextPath}/assets/js/feather/feather.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/feather/feather-icon.js"></script>

        <!-- Slick js-->
        <script src="${pageContext.request.contextPath}/assets/js/slick/slick.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/slick/slick-animation.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/slick/custom_slick.js"></script>

        <!-- Lazyload Js -->
        <script src="${pageContext.request.contextPath}/assets/js/lazysizes.min.js"></script>

        <!-- script js -->    
        <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
        <script>
            // Hiển thị/ẩn mật khẩu
            function togglePassword(inputId) {
                const input = document.getElementById(inputId);
                input.type = (input.type === "password") ? "text" : "password";
            }

            // Validate mật khẩu real-time
            document.addEventListener('DOMContentLoaded', function () {
                const newPassword = document.getElementById('newpass');
                const confirmPassword = document.querySelector('input[name="confirmpass"]');
                const form = document.querySelector('form[action="changepasswordemail"]');

                // Kiểm tra khi người dùng nhập
                if (newPassword) {
                    newPassword.addEventListener('input', function () {
                        const password = newPassword.value;

                        // Kiểm tra độ dài
                        document.getElementById('length').className = password.length >= 8 ? 'text-success' : 'text-danger';

                        // Kiểm tra chữ hoa
                        document.getElementById('uppercase').className = /[A-Z]/.test(password) ? 'text-success' : 'text-danger';

                        // Kiểm tra số
                        document.getElementById('number').className = /\d/.test(password) ? 'text-success' : 'text-danger';

                        // Kiểm tra ký tự đặc biệt
                        document.getElementById('special').className = /[@$!%*?&]/.test(password) ? 'text-success' : 'text-danger';
                    });
                }

            });
        </script>
    </body>
</html>