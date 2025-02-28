<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <link rel="icon" href="assets/images/favicon.png" type="image/x-icon">
        <link rel="shortcut icon" href="assets/images/favicon.png" type="image/x-icon">
        <title>Fastkart - Dashboard</title>

        <!-- Google font-->
        <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
              rel="stylesheet">
        <!-- Linear Icon css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets2/css/linearicon.css">
        <!-- fontawesome css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/font-awesome.css">
        <!-- Themify icon css-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/themify.css">
        <!-- ratio css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/ratio.css">
        <!-- remixicon css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/remixicon.css">
        <!-- Feather icon css-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/feather-icon.css">
        <!-- Plugins css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/scrollbar.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/animate.css">
        <!-- Bootstrap css-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/bootstrap.css">
        <!-- vector map css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vector-map.css">
        <!-- Slick Slider Css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets2/css/vendors/slick.css">
        <!-- App css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/style.css">
    </head>
    <body>
        <%@ include file="/manager/manager_dashboard.jsp" %>
        <!-- page-wrapper Start-->
        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <!-- Page Body Start -->
            <div class="page-body-wrapper">
                <!-- Page Sidebar Start-->
                <div class="page-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="title-header option-title">
                                                    <h5>Chỉnh sửa nhà cung cấp</h5>
                                                </div>                                             
                                                <div class="tab-content" id="pills-tabContent">
                                                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel">
                                                        <form class="theme-form theme-form-2 mega-form" action="/Gr1_Warehouse/editSupplier" method="post">

                                                            <input type="hidden" name="supplier_id" value="${supplier.supplierId}">
                                                            <div class="card-header-1">
                                                                <h5>Chi tiết nhà cung cấp</h5>
                                                            </div>
                                                            <div class="row">
                                                                <div class="mb-4 row align-items-center">
                                                                    <label class="col-lg-2 col-md-3 col-form-label form-label-title">Tên nhà cung cấp</label>
                                                                    <div class="col-md-9 col-lg-10">
                                                                        <input class="form-control" type="text" name="supplier_name" value="${supplier.supplierName}">
                                                                    </div>
                                                                </div>
                                                                <div class="mb-4 row align-items-center">
                                                                    <label class="col-lg-2 col-md-3 col-form-label form-label-title">Mã nhà cung cấp (VD: A, B, C)</label>
                                                                    <div class="col-md-9 col-lg-10">
                                                                        <input class="form-control" type="text" name="supplier_code" value="${supplier.supplierCode}" readonly="">
                                                                    </div>
                                                                </div>
                                                                <div class="mb-4 row align-items-center">
                                                                    <label class="col-lg-2 col-md-3 col-form-label form-label-title">Số điện thoại</label>
                                                                    <div class="col-md-9 col-lg-10">
                                                                        <input class="form-control" type="tel" name="phone" pattern="[0-9]{10}" value="${supplier.phone}">
                                                                    </div>
                                                                </div>
                                                                <div class="mb-4 row align-items-center">
                                                                    <label class="col-lg-2 col-md-3 col-form-label form-label-title">Email</label>
                                                                    <div class="col-md-9 col-lg-10">
                                                                        <input class="form-control" type="email" name="email" value="${supplier.email}">
                                                                    </div>
                                                                </div>
                                                                <div class="mb-4 row align-items-center">
                                                                    <label class="col-lg-2 col-md-3 col-form-label form-label-title">Địa chỉ</label>
                                                                    <div class="col-md-9 col-lg-10">
                                                                        <input class="form-control" type="text" name="address" value="${supplier.address}">
                                                                    </div>
                                                                </div>
                                                                <div class="mb-4 row align-items-center">
                                                                    <label class="col-lg-2 col-md-3 col-form-label form-label-title">Trạng thái</label>
                                                                    <div class="col-md-9 col-lg-10">
                                                                        <select class="form-control" name="status">
                                                                            <option value="Active" ${supplier.status == 'Active' ? 'selected' : ''}>Active</option>
                                                                            <option value="Deactive" ${supplier.status == 'Deactive' ? 'selected' : ''}>Deactive</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-4">
                                                                <div class="col-md-9 col-lg-10 offset-md-3 offset-lg-2">
                                                                    <button type="submit" class="btn btn-primary">Lưu</button>
                                                                </div>
                                                            </div>
                                                        </form>
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
                <!-- Page Sidebar End -->
            </div>               
        </div>
        <style>
            /* Màu sắc cho trạng thái Active */
            .status-close {
                background-color: #28a745; /* Màu xanh (hoặc màu bạn muốn) */
                color: white;
            }

            /* Màu sắc cho trạng thái Deactive */
            .status-danger {
                background-color: #dc3545; /* Màu đỏ (hoặc màu bạn muốn) */
                color: white;
            }
        </style>
        <!-- latest js -->
        <script src="${pageContext.request.contextPath}/assets2/js/jquery-3.6.0.min.js"></script>
        <!-- Bootstrap js -->
        <script src="${pageContext.request.contextPath}/assets2/js/bootstrap/bootstrap.bundle.min.js"></script>
        <!-- feather icon js -->
        <script src="${pageContext.request.contextPath}/assets2/js/icons/feather-icon/feather.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/icons/feather-icon/feather-icon.js"></script>
        <!-- scrollbar simplebar js -->
        <script src="${pageContext.request.contextPath}/assets2/js/scrollbar/simplebar.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/scrollbar/custom.js"></script>
        <!-- Sidebar jquery -->
        <script src="${pageContext.request.contextPath}/assets2/js/config.js"></script>
        <!-- tooltip init js -->
        <script src="${pageContext.request.contextPath}/assets2/js/tooltip-init.js"></script>
        <!-- Plugins JS -->
        <script src="${pageContext.request.contextPath}/assets2/js/sidebar-menu.js"></script>
        <!-- customizer js -->
        <script src="${pageContext.request.contextPath}/assets2/js/customizer.js"></script>
        <!-- ratio js -->
        <script src="${pageContext.request.contextPath}/assets2/js/ratio.js"></script>
    </body>
</html>
