<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <style>
        #passwordHelp ul {
            margin-top: 0.5rem;
            padding-left: 1rem;
        }

        #passwordHelp li small {
            font-size: 0.8rem;
        }

        .text-danger {
            color: #dc3545 !important;
        }

        .text-success {
            color: #28a745 !important;
        }
    </style>
    <body>

        <!-- page-wrapper Start-->
        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <!-- Page Header Start-->
            <div class="page-header">
                <div class="header-wrapper m-0">
                    <div class="header-logo-wrapper p-0">
                        <div class="logo-wrapper">
                            <a href="index.html">
                                <img class="img-fluid white-logo" src="${pageContext.request.contextPath}/assets2/images/logo_1.png" >
                            </a>
                        </div>

                    </div>

                    <div class="nav-right col-6 pull-right right-header p-0">
                        <ul class="nav-menus">
                            <li class="profile-nav onhover-dropdown pe-0 me-0">
                                <div class="media profile-media">

                                    <div class="user-name-hide media-body">
                                        <span>${sessionScope.acc.username}</span>
                                        <p class="mb-0 font-roboto">${sessionScope.acc.role.roleName}<i class="middle ri-arrow-down-s-line"></i></p>                                         
                                    </div>
                                </div>
                                <ul class="profile-dropdown onhover-show-div">
                                    <li>
                                        <a href="/Gr1_Warehouse/profilesetting">
                                            <i data-feather="settings"></i>
                                            <span>Chỉnh sửa</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                                           href="javascript:void(0)">
                                            <i data-feather="log-out"></i>
                                            <span>Đăng xuất</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Page Header Ends-->

            <!-- Page Body Start-->
            <div class="page-body-wrapper">
                <!-- Page Sidebar Start-->
                <div class="sidebar-wrapper">
                    <div class="logo-wrapper logo-wrapper-center">
                        <a data-bs-original-title="" title="">
                            <img class="img-fluid for-white" src="${pageContext.request.contextPath}/assets2/images/logo_1.png" 
                                 alt="logo" 
                                 style="width: 150px; height: auto;">
                        </a> 
                        <br><br>
                    </div>

                    <nav class="sidebar-main" >
                        <div class="left-arrow" id="left-arrow">
                            <i data-feather="arrow-left"></i>
                        </div>
                        <div id="sidebar-menu">
                            <ul class="sidebar-links" id="simple-bar">
                                <li class="back-btn"></li>
                                    <c:set var="roleId" value="${sessionScope.user.role.roleId}" />
                                    <c:choose>
                                        <c:when test="${roleId == 1}">
                                        <br><br><br>
                                        <li class="sidebar-list">
                                            <a class="sidebar-link sidebar-title link-nav" href="/Gr1_Warehouse/dashboard">
                                                <i class="ri-home-line"></i>
                                                <span>Dashboard</span>
                                            </a>
                                        </li>

                                        <li class="sidebar-list">
                                            <a class="sidebar-link sidebar-title link-nav" href="/Gr1_Warehouse/financialmanagement">
                                                <i class="ri-store-3-line"></i>
                                                <span>Quản lý thu chi</span>
                                            </a>
                                        </li>

                                        <li class="sidebar-list">
                                            <a class="sidebar-link sidebar-title" href="javascript:void(0)">
                                                <i class="ri-user-3-line"></i>
                                                <span>Tài khoản</span>
                                            </a>
                                            <ul class="sidebar-submenu">
                                                <li>
                                                    <a href="/Gr1_Warehouse/allusers">Khách hàng</a>
                                                </li>
                                                <li>
                                                    <a href="/Gr1_Warehouse/allstaff">Nhân viên</a>
                                                </li>
                                            </ul>
                                        </li>

                                        <li class="sidebar-list">
                                            <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">
                                                <i class="ri-store-3-line"></i>
                                                <span>Quản lý sản phẩm</span>
                                            </a>
                                            <ul class="sidebar-submenu">
                                                <li>
                                                    <a href="/Gr1_Warehouse/productlist">Danh sách sản phẩm</a>
                                                </li>

                                                <li>
                                                    <a href="/Gr1_Warehouse/createproductgeneral">Tạo sản phẩm mới</a>
                                                </li>
                                            </ul>
                                        </li>

                                        <li class="sidebar-list">
                                            <a class="sidebar-link sidebar-title link-nav" href="/Gr1_Warehouse/role">
                                                <i class="ri-star-line"></i>
                                                <span>Vai trò</span>
                                            </a>
                                        </li>

                                        <li class="sidebar-list">
                                            <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">
                                                <i class="ri-price-tag-3-line"></i>
                                                <span>Giảm giá hóa đơn</span>
                                            </a>
                                            <ul class="sidebar-submenu">
                                                <li>
                                                    <a href="/Gr1_Warehouse/couponlist">Danh sách giảm giá</a>
                                                </li>

                                                <li>
                                                    <a href="/Gr1_Warehouse/createcoupon">Tạo mã giảm giá</a>
                                                </li>

                                                <li>
                                                    <a href="/Gr1_Warehouse/listdiscounthistory">Lịch sử mã giảm giá</a>
                                                </li>
                                            </ul>
                                        </li>

                                        <li class="sidebar-list">
                                            <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">
                                                <i class="ri-price-tag-3-line"></i>
                                                <span>Giảm giá sản phẩm</span>
                                            </a>
                                            <ul class="sidebar-submenu">
                                                <li>
                                                    <a href="/Gr1_Warehouse/couponproductlist">Danh sách giảm giá</a>
                                                </li>
                                            </ul>
                                        </li>

                                        <li class="sidebar-list">
                                            <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">
                                                <i class="ri-store-3-line"></i>
                                                <span>Quản lí thương hiệu</span>
                                            </a>
                                            <ul class="sidebar-submenu">
                                                <li>
                                                    <a href="/Gr1_Warehouse/brandlist">Danh sách thương hiệu</a>
                                                </li>

                                                <li>
                                                    <a href="/Gr1_Warehouse/createbrand">Tạo thương hiệu mới</a>
                                                </li>
                                            </ul>
                                        </li>

                                        <li class="sidebar-list">
                                            <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">
                                                <i class="ri-store-3-line"></i>
                                                <span>Quản lí thể loại</span>
                                            </a>
                                            <ul class="sidebar-submenu">
                                                <li>
                                                    <a href="/Gr1_Warehouse/categorylist">Danh sách thể loại</a>
                                                </li>

                                                <li>
                                                    <a href="/Gr1_Warehouse/createcategory">Tạo thể loại mới</a>
                                                </li>
                                            </ul>
                                        </li>

                                        <li class="sidebar-list">
                                            <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">
                                                <i class="ri-store-3-line"></i>
                                                <span>Quản lí kích cỡ sản phẩm</span>
                                            </a>
                                            <ul class="sidebar-submenu">
                                                <li>
                                                    <a href="/Gr1_Warehouse/sizelist">Danh sách kích cỡ</a>
                                                </li>

                                                <li>
                                                    <a href="/Gr1_Warehouse/createsize">Tạo kích cỡ mới</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </c:when>
                                    <c:when test="${roleId == 3}">
                                        <li class="sidebar-list">
                                            <a class="sidebar-link sidebar-title link-nav" href="index.html">
                                                <i class="ri-home-line"></i>
                                                <span>Dashboard</span>
                                            </a>
                                        </li>

                                        <li class="sidebar-list">
                                            <a class="sidebar-link sidebar-title" href="javascript:void(0)">
                                                <i class="ri-archive-line"></i>
                                                <span>Đơn hàng</span>
                                            </a>
                                            <ul class="sidebar-submenu">
                                                <li>
                                                    <a href="/Gr1_Warehouse/orderlist">Danh sách đơn hàng</a>
                                                </li>
                                                <li>
                                                    <a href="order-tracking.html">Theo dõi đơn hàng</a>
                                                </li>
                                            </ul>
                                        </li>

                                        <li class="sidebar-list">
                                            <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">
                                                <i class="ri-store-3-line"></i>
                                                <span>Quản lí tồn kho</span>
                                            </a>
                                            <ul class="sidebar-submenu">
                                                <li>
                                                    <a href="/Gr1_Warehouse/inventory-checklist">Chi tiết tồn kho</a>
                                                </li>

                                                <li>
                                                    <a href="/Gr1_Warehouse/importGood">Nhập hàng</a>
                                                </li>
                                                <li>
                                                    <a href="/Gr1_Warehouse/supplier">Nhà cung cấp</a>
                                                </li>
                                                <li>
                                                    <a href="/Gr1_Warehouse/archive">Kho lưu trữ</a>
                                                </li>
                                                <li>
                                                    <a href="add-new-product.html">Trả hàng</a>
                                                </li>
                                                <li>
                                                    <a href="add-new-product.html">Lịch sử</a>
                                                </li> 
                                            </ul>
                                        </li>

                                        <li class="sidebar-list">
                                            <a class="sidebar-link sidebar-title link-nav" href="reports.html">
                                                <i class="ri-file-chart-line"></i>
                                                <span>Báo cáo</span>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:when test="${roleId == 4}">
                                        <li class="sidebar-list">
                                            <a class="sidebar-link sidebar-title link-nav" href="/Gr1_Warehouse/staff-checklist">
                                                <i class="ri-file-chart-line"></i>
                                                <span>Danh sách phiếu kiểm kho</span>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:when test="${roleId == 5}">
                                        <li class="sidebar-list">
                                            <a class="sidebar-link sidebar-title link-nav" href="index.html">
                                                <i class="ri-home-line"></i>
                                                <span>Dashboard</span>
                                            </a>
                                        </li>

                                        <li class="sidebar-list">
                                            <a class="sidebar-link sidebar-title" href="javascript:void(0)">
                                                <i class="ri-archive-line"></i>
                                                <span>Đơn hàng</span>
                                            </a>
                                            <ul class="sidebar-submenu">
                                                <li>
                                                    <a href="/Gr1_Warehouse/packing-orders">Danh sách đơn hàng</a>
                                                </li>
                                                <li>
                                                    <a href="/Gr1_Warehouse/my-packing-orders">Đơn hàng của tôi</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="sidebar-list">
                                            <a class="sidebar-link sidebar-title link-nav" href="reports.html">
                                                <i class="ri-file-chart-line"></i>
                                                <span>Báo cáo</span>
                                            </a>
                                        </li>
                                    </c:when>   
                                    <c:when test="${roleId == 6}">
                                        <li class="sidebar-list">
                                            <a class="sidebar-link sidebar-title link-nav" href="index.html">
                                                <i class="ri-home-line"></i>
                                                <span>Dashboard</span>
                                            </a>
                                        </li>

                                        <li class="sidebar-list">
                                            <a class="sidebar-link sidebar-title" href="javascript:void(0)">
                                                <i class="ri-archive-line"></i>
                                                <span>Đơn hàng</span>
                                            </a>
                                            <ul class="sidebar-submenu">
                                                <li>
                                                    <a href="/Gr1_Warehouse/ship-orders">Danh sách đơn hàng</a>
                                                </li>
                                                <li>
                                                    <a href="/Gr1_Warehouse/my-shipping-orders">Đơn hàng của tôi</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="sidebar-list">
                                            <a class="sidebar-link sidebar-title link-nav" href="reports.html">
                                                <i class="ri-file-chart-line"></i>
                                                <span>Báo cáo</span>
                                            </a>
                                        </li>
                                    </c:when> 
                                    <c:when test="${roleId == 7}">
                                        <li class="sidebar-list">
                                            <a class="sidebar-link sidebar-title link-nav" href="index.html">
                                                <i class="ri-home-line"></i>
                                                <span>Dashboard</span>
                                            </a>
                                        </li>

                                        <li class="sidebar-list">
                                            <a class="sidebar-link sidebar-title" href="javascript:void(0)">
                                                <i class="ri-archive-line"></i>
                                                <span>Đơn hàng</span>
                                            </a>
                                            <ul class="sidebar-submenu">
                                                <li>
                                                    <a href="/Gr1_Warehouse/sale-orders">Danh sách đơn hàng</a>
                                                </li>
                                                <li>
                                                    <a href="/Gr1_Warehouse/my-sale-orders">Đơn hàng của tôi</a>
                                                </li>
                                            </ul>
                                        </li>

                                        <li class="sidebar-list">
                                            <a class="sidebar-link sidebar-title" href="javascript:void(0)">
                                                <i class="ri-archive-line"></i>
                                                <span>Khách hàng</span>
                                            </a>
                                            <ul class="sidebar-submenu">
                                                <li>
                                                    <a href="/Gr1_Warehouse/browse-cus">Danh sách khách hàng</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="sidebar-list">
                                            <a class="sidebar-link sidebar-title link-nav" href="reports.html">
                                                <i class="ri-file-chart-line"></i>
                                                <span>Báo cáo</span>
                                            </a>
                                        </li>
                                    </c:when> 
                                </c:choose>
                                <li class="sidebar-list">
                                    <a class="sidebar-link sidebar-title link-nav" href="/Gr1_Warehouse/profilesetting">
                                        <i class="ri-file-chart-line"></i>
                                        <span>Cài đặt</span>
                                    </a>
                                </li>      
                            </ul>
                        </div>

                        <div class="right-arrow" id="right-arrow">
                            <i data-feather="arrow-right"></i>
                        </div>
                    </nav>
                </div>
                <!-- Page Sidebar Ends-->
                <!-- Page Body End -->

                <!-- Modal Start -->
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                    <div class="modal-dialog  modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <h5 class="modal-title" id="staticBackdropLabel">Đăng xuất</h5>
                                <p>Bạn có chắc chắn muốn đăng xuất?</p>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                <div class="button-box">
                                    <button type="button" class="btn btn--no" data-bs-dismiss="modal">Không</button>
                                    <a href="<%= request.getContextPath() %>/logout" class="btn btn--yes btn-primary">Có</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal End -->

                <!-- page-wrapper End-->

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
                                                        <form action="profilesetting" method="POST">
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
                                                                <input type="text" class="form-control" id="phone" name="phone" 
                                                                       placeholder="Nhập số điện thoại" value="${sessionScope.acc.phone}" required />
                                                                <label for="phone">SĐT</label>
                                                                <div id="phoneHelp" class="form-text">
                                                                    <small>Số điện thoại phải:</small>
                                                                    <ul class="list-unstyled mb-0">
                                                                        <li id="phone-length" class="text-danger"><small>• Có 10 hoặc 11 chữ số</small></li>
                                                                        <li id="phone-start" class="text-danger"><small>• Bắt đầu bằng số 0</small></li>
                                                                        <li id="phone-format" class="text-danger"><small>• Chỉ chứa các chữ số</small></li>
                                                                    </ul>
                                                                </div>
                                                            </div>

                                                            <!-- Address -->
                                                            <div class="form-floating mb-4 theme-form-floating">
                                                                <input type="text" class="form-control" id="address" name="address" placeholder="Enter address" value="${sessionScope.acc.address}" required />
                                                                <label for="address">Địa chỉ</label>
                                                            </div>
                                                            <%
String errorprofile = (String) request.getAttribute("errorprofile");
                                                            %>

                                                            <% if (errorprofile != null) { %>
                                                            <div class="alert alert-danger" role="alert" style="background-color:  red">
                                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                <%= errorprofile %>
                                                            </div>
                                                            <% } %>
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
                                                        <form action="profilesetting" method="POST">
                                                            <input type="hidden" name="userId" value="${sessionScope.acc.userId}" />
                                                            <input type="hidden" name="action" value="1" />

                                                            <!-- Old Password -->
                                                            <div class="form-floating mb-4 theme-form-floating">
                                                                <input type="password" class="form-control" id="currentpassword" name="currentpassword" placeholder="Enter Current Password" required />
                                                                <label for="oldpass">Mật khẩu cũ</label>
                                                            </div>

                                                            <!-- New Password -->
                                                            <div class="form-floating mb-4 theme-form-floating">
                                                                <input type="password" class="form-control" id="newpassword" name="newpassword" 
                                                                       placeholder="Mật khẩu mới"  required />
                                                                <label for="newpass">Mật khẩu mới</label>
                                                                <div id="passwordHelp" class="form-text">
                                                                    <small>Mật khẩu phải chứa:</small>
                                                                    <ul class="list-unstyled mb-0">
                                                                        <li id="length" class="text-danger"><small>• Tối thiểu 8 ký tự</small></li>
                                                                        <li id="uppercase" class="text-danger"><small>• Ít nhất 1 chữ in hoa (A-Z)</small></li>
                                                                        <li id="number" class="text-danger"><small>• Ít nhất 1 số (0-9)</small></li>
                                                                        <li id="special" class="text-danger"><small>• Ít nhất 1 ký tự đặc biệt (@$!%*?&)</small></li>
                                                                    </ul>
                                                                </div>
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
                                                            <div class="alert alert-danger" role="alert" style="background-color:  red">
                                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                <%= error %>
                                                            </div>
                                                            <% } %>

                                                            <% if (success != null) { %>
                                                            <div class="alert alert-success" role="alert" style="background-color:  green">
                                                                <%= success %>
                                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
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
        </div>
        <!-- page-wrapper End-->


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
        <!--<script src="${pageContext.request.contextPath}/assets2/js/customizer.js"></script>-->
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

        <script>
            <% if (request.getAttribute("errorprofile") != null) { %>
            $(document).ready(function () {
                $('#edit-profile').modal('show');
            });
            <% } %>
        </script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const passwordInput = document.getElementById('newpassword');
                const form = document.querySelector('form[action="profilesetting"]');

                // Các điều kiện
                const lengthReq = document.getElementById('length');
                const upperReq = document.getElementById('uppercase');
                const numberReq = document.getElementById('number');
                const specialReq = document.getElementById('special');

                // Kiểm tra khi người dùng nhập
                passwordInput.addEventListener('input', function () {
                    const password = passwordInput.value;

                    // Kiểm tra độ dài
                    if (password.length >= 8) {
                        lengthReq.classList.replace('text-danger', 'text-success');
                    } else {
                        lengthReq.classList.replace('text-success', 'text-danger');
                    }

                    // Kiểm tra chữ hoa
                    if (/[A-Z]/.test(password)) {
                        upperReq.classList.replace('text-danger', 'text-success');
                    } else {
                        upperReq.classList.replace('text-success', 'text-danger');
                    }

                    // Kiểm tra số
                    if (/\d/.test(password)) {
                        numberReq.classList.replace('text-danger', 'text-success');
                    } else {
                        numberReq.classList.replace('text-success', 'text-danger');
                    }

                    // Kiểm tra ký tự đặc biệt
                    if (/[@$!%*?&]/.test(password)) {
                        specialReq.classList.replace('text-danger', 'text-success');
                    } else {
                        specialReq.classList.replace('text-success', 'text-danger');
                    }
                });
            });
        </script>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const phoneInput = document.getElementById('phone');
                // Các điều kiện
                const lengthReq = document.getElementById('phone-length');
                const startReq = document.getElementById('phone-start');
                const formatReq = document.getElementById('phone-format');

                // Kiểm tra khi người dùng nhập
                phoneInput.addEventListener('input', function () {
                    const phone = phoneInput.value;

                    // Kiểm tra độ dài
                    if (phone.length === 10 || phone.length === 11) {
                        lengthReq.classList.replace('text-danger', 'text-success');
                    } else {
                        lengthReq.classList.replace('text-success', 'text-danger');
                    }

                    // Kiểm tra bắt đầu bằng số 0
                    if (phone.startsWith('0')) {
                        startReq.classList.replace('text-danger', 'text-success');
                    } else {
                        startReq.classList.replace('text-success', 'text-danger');
                    }

                    // Kiểm tra chỉ chứa chữ số
                    if (/^\d+$/.test(phone)) {
                        formatReq.classList.replace('text-danger', 'text-success');
                    } else {
                        formatReq.classList.replace('text-success', 'text-danger');
                    }
                });
            });
        </script>

    </body>

</html>