<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description"
              content="Fastkart admin is super flexible, powerful, clean &amp; modern responsive bootstrap 5 admin template with unlimited possibilities.">
        <meta name="keywords"
              content="admin template, Fastkart admin template, dashboard template, flat admin template, responsive admin template, web app">
        <meta name="author" content="pixelstrap">
        <link rel="icon" href="${pageContext.request.contextPath}/assets2/images/favicon.png" type="image/x-icon">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets2/images/favicon.png" type="image/x-icon">
        <title>Fastkart - Profile Setting</title>

        <!-- Google font -->
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

        <!-- Linear Icon css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets2/css/linearicon.css">

        <!-- remixicon css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/remixicon.css">

        <!-- fontawesome css  -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/font-awesome.css">

        <!-- Themify icon css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/themify.css">

        <!--Drop zon css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/dropzone.css">

        <!-- Feather icon css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/feather-icon.css">

        <!-- Select2 css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/select2.min.css">

        <!-- Plugins css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/scrollbar.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/animate.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/chartist.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/date-picker.css">

        <!-- Bootstrap css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/bootstrap.css">

        <!-- Bootstrap-tag input css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/bootstrap-tagsinput.css">

        <!-- App css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/style.css">
    </head>

    <body>

        <!-- page-wrapper Start-->
        <div class="page-wrapper compact-wrapper" id="pageWrapper">

            <!-- Page Body Start-->
            <div class="page-body-wrapper">
                <%@include file="/includes/admin.jsp" %>

                <!-- Settings Section Start -->
                <div class="page-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <!-- Details Start -->
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="title-header option-title">
                                                    <h5>Cài đặt hồ sơ</h5>
                                                </div>
                                                <form class="theme-form theme-form-2 mega-form">
                                                    <div class="row">
                                                        <div class="mb-4 row align-items-center">
                                                            <label class="form-label-title col-sm-2 mb-0">Họ và Tên</label>
                                                            <div class="col-sm-10">
                                                                <input class="form-control" type="text"
                                                                       placeholder="Enter Your First Name" value="${sessionScope.acc.fullname}" readonly>
                                                            </div>
                                                        </div>

                                                        <div class="mb-4 row align-items-center">
                                                            <label class="form-label-title col-sm-2 mb-0">Email</label>
                                                            <div class="col-sm-10">
                                                                <input class="form-control" type="email"
                                                                       placeholder="Enter Your Email Address" value="${sessionScope.acc.email}" readonly>
                                                            </div>
                                                        </div>

                                                        <div class="mb-4 row align-items-center">
                                                            <label class="form-label-title col-sm-2 mb-0">SĐT</label>
                                                            <div class="col-sm-10">
                                                                <input class="form-control" type="number"
                                                                       placeholder="Nhập số điện thoại" value="${sessionScope.acc.phone}" readonly>
                                                            </div>
                                                        </div>

                                                        <div class="mb-4 row align-items-center">
                                                            <label class="form-label-title col-sm-2 mb-0">Địa chỉ
                                                            </label>
                                                            <div class="col-sm-10">
                                                                <input class="form-control" type="text"
                                                                       placeholder="Nhập địa chỉ của bạn" value="${sessionScope.acc.address}" readonly>
                                                            </div>
                                                        </div>

                                                        <c:if test="${not empty requestScope.successprofile}">
                                                            <div class="alert alert-success alert-dismissible fade show" role="alert" style="background-color: green">
                                                                ${requestScope.successprofile}
                                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                            </div>
                                                        </c:if>
                                                            
                                                        <div class="d-flex justify-content-end gap-2 mt-3">
                                                            <button type="button" class="btn btn-primary btn-md" data-bs-toggle="modal" data-bs-target="#edit-profile">
                                                                <i class="fa-solid fa-pen-to-square me-2"></i> Thay đổi hồ sơ
                                                            </button>

                                                            <button type="button" class="btn btn-secondary btn-md" data-bs-toggle="modal" data-bs-target="#change-password">
                                                                <i class="fa-solid"></i> Đổi mật khẩu
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <!-- Details End -->
                                        <!-- Edit Profile Modal Start -->
                                        <div class="modal fade theme-modal" id="edit-profile" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Thay đổi hồ sơ</h5>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="profilesettingadmin" method="POST">
                                                            <input type="hidden" name="userId" value="${sessionScope.acc.userId}" />
                                                            <input type="hidden" name="action" value="0" />

                                                            <!-- FullName -->
                                                            <div class="form-floating mb-4 theme-form-floating">
                                                                <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Enter FullName" value="${sessionScope.acc.fullname}" required />
                                                                <label for="fullname">Họ và tên</label>
                                                            </div>

                                                            <div class="form-floating mb-4 theme-form-floating">
                                                                <input type="text" class="form-control" id="email" name="email" placeholder="Enter Email" value="${sessionScope.acc.email}" required readonly/>
                                                                <label for="fullname">Email</label>
                                                            </div>   

                                                            <!-- PhoneNumber -->
                                                            <div class="form-floating mb-4 theme-form-floating">
                                                                <input type="number" class="form-control" id="phone" name="phone" placeholder="Enter Phone" value="${sessionScope.acc.phone}" required />
                                                                <label for="phone">SĐT</label>
                                                            </div>

                                                            <!-- Address -->
                                                            <div class="form-floating mb-4 theme-form-floating">
                                                                <input type="text" class="form-control" id="address" name="address" placeholder="Enter address" value="${sessionScope.acc.address}" required />
                                                                <label for="address">Địa chỉ</label>
                                                            </div>

                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary btn-md" data-bs-dismiss="modal">Đóng</button>
                                                                <button type="submit" class="btn theme-bg-color btn-md text-white">Lưu thay đổi</button>
                                                            </div>

                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Edit Profile Modal End -->

                                        <!-- Edit Password Modal Start -->
                                        <div class="modal fade theme-modal" id="change-password" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Đổi mật khẩu</h5>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="profilesettingadmin" method="POST">
                                                            <input type="hidden" name="userId" value="${sessionScope.acc.userId}" />
                                                            <input type="hidden" name="action" value="1" />
                                                            
                                                            <!-- Old Password -->
                                                            <div class="form-floating mb-4 theme-form-floating">
                                                                <input type="password" class="form-control" id="currentpassword" name="currentpassword" placeholder="Enter Current Password" required />
                                                                <label for="oldpass">Mật khẩu cũ</label>
                                                            </div>

                                                            <!-- New Password -->
                                                            <div class="form-floating mb-4 theme-form-floating">
                                                                <input type="password" class="form-control" id="newpassword" name="newpassword" placeholder="Enter New Password" required />
                                                                <label for="newpass">Mật khẩu mới</label>
                                                            </div>

                                                            <!-- Confirm New Password -->
                                                            <div class="form-floating mb-4 theme-form-floating">
                                                                <input type="password" class="form-control" id="confirmpassword" name="confirmpassword" placeholder="Confirm New Password" required />
                                                                <label for="confirmpass">Xác nhận lại mật khẩu</label>
                                                            </div>
                                                            <%
String error = (String) request.getAttribute("error");
String success = (String) request.getAttribute("success");
                                                            %>

                                                            <% if (error != null) { %>
                                                            <div class="alert alert-danger" role="alert">
                                                                <%= error %>
                                                            </div>
                                                            <% } %>

                                                            <% if (success != null) { %>
                                                            <div class="alert alert-success" role="alert">
                                                                <%= success %>
                                                            </div>
                                                            <% } %>
                                                            <div class="modal-footer" >
                                                                <button type="button" class="btn btn-secondary btn-md" data-bs-dismiss="modal">Đóng</button>
                                                                <button type="submit" class="btn theme-bg-color btn-md text-white">Lưu thay đổi</button>
                                                            </div>
                                                        </form>



                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Edit Password Modal End -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Settings Section End -->
            </div>
            <!-- Page Body End-->

            <!-- footer start-->
            <div class="container-fluid">
                <footer class="footer">
                    <div class="row">
                        <div class="col-md-12 footer-copyright text-center">
                            <p class="mb-0">Copyright 2022 © Fastkart theme by pixelstrap</p>
                        </div>
                    </div>
                </footer>
            </div>
            <!-- footer End-->
        </div>
        <!-- page-wrapper End-->

        <!-- Modal Start -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
             aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog  modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <h5 class="modal-title" id="staticBackdropLabel">Logging Out</h5>
                        <p>Are you sure you want to log out?</p>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                        <div class="button-box">
                            <button type="button" class="btn btn--no" data-bs-dismiss="modal">No</button>
                            <button type="button" class="btn  btn--yes btn-primary">Yes</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal End -->

        <!-- latest jquery-->
        <script src="${pageContext.request.contextPath}/assets2/js/jquery-3.6.0.min.js"></script>

        <!-- Bootstrap js-->
        <script src="${pageContext.request.contextPath}/assets2/js/bootstrap/bootstrap.bundle.min.js"></script>

        <!-- feather icon js-->
        <script src="${pageContext.request.contextPath}/assets2/js/icons/feather-icon/feather.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/icons/feather-icon/feather-icon.js"></script>

        <!-- scrollbar simplebar js-->
        <script src="${pageContext.request.contextPath}/assets2/js/scrollbar/simplebar.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/scrollbar/custom.js"></script>

        <!-- Sidebar jquery-->
        <script src="${pageContext.request.contextPath}/assets2/js/config.js"></script>
        <!-- Plugins JS start-->

        <!-- bootstrap tag-input JS start-->
        <script src="${pageContext.request.contextPath}/assets2/js/bootstrap-tagsinput.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/sidebar-menu.js"></script>

        <!-- customizer js start  -->
        <script src="${pageContext.request.contextPath}/assets2/js/customizer.js"></script>
        <!-- customizer js end -->

        <!--Dropzon start-->
        <script src="${pageContext.request.contextPath}/assets2/js/dropzone/dropzone.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/dropzone/dropzone-script.js"></script>

        <!--Dropzon start-->
<!--        <script src="${pageContext.request.contextPath}/assets2/js/notify/bootstrap-notify.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/notify/index.js"></script>-->
        <!-- Plugins JS Ends-->

        <!-- Theme js-->
        <script src="${pageContext.request.contextPath}/assets2/js/script.js"></script>
        <script>
            // Kiểm tra xem có thông báo error hoặc success không
            <% if (error != null || success != null) { %>
            // Tự động mở modal edit-password
            $(document).ready(function () {
                $('#change-password').modal('show');
            });
            <% } %>
        </script>

    </body>

</html>