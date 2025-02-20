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
        <title>Fastkart - Create Coupon</title>

        <!-- Google font-->
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

        <!-- Fontawesome css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/font-awesome.css">

        <!-- Linear Icon css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets2/css/linearicon.css">

        <!-- remixicon css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/remixicon.css">

        <!-- Themify icon css-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/themify.css">

        <!-- Feather icon css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/feather-icon.css">

        <!-- Plugins css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/scrollbar.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/animate.css">

        <!-- Bootstrap css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/bootstrap.css">

        <!-- App css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/style.css">
    </head>

    <body>
        <%@include file="/includes/admin.jsp" %>

        <!-- page-wrapper Start-->
        <div class="page-wrapper compact-wrapper" id="pageWrapper">

            <!-- Page Body Start-->
            <div class="page-body-wrapper">

                <div class="page-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-2">
                                <div class="main-tiles border-5 border-0  card-hover card o-hidden">
                                    <div class="custome-1-bg b-r-4 card-body">
                                        <div class="media align-items-center static-top-widget">
                                            <div class="media-body p-0">
                                                <span class="m-0">Tổng doanh thu</span>
                                                <h4 class="mb-0 counter">$6659        
                                                </h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-2 col-md-2 col-sm-2">
                                <div class="main-tiles border-5 card-hover border-0 card o-hidden">
                                    <div class="custome-2-bg b-r-4 card-body">
                                        <div class="media static-top-widget">
                                            <div class="media-body p-0">
                                                <span class="m-0">Tổng đơn hàng</span>
                                                <h4 class="mb-0 counter">9856
                                                </h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-2 col-md-2 col-sm-2">
                                <div class="main-tiles border-5 card-hover border-0  card o-hidden">
                                    <div class="custome-3-bg b-r-4 card-body">
                                        <div class="media static-top-widget">
                                            <div class="media-body p-0">
                                                <span class="m-0">Tổng sản phẩm</span>
                                                <h4 class="mb-0 counter">${requestScope.totalProduct}
                                                </h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-2 col-md-2 col-sm-2">
                                <div class="main-tiles border-5 card-hover border-0 card o-hidden">
                                    <div class="custome-4-bg b-r-4 card-body">
                                        <div class="media static-top-widget">
                                            <div class="media-body p-0">
                                                <span class="m-0">Tổng người dùng</span>
                                                <h4 class="mb-0 counter">${requestScope.totalUser}
                                                </h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-2 col-md-2 col-sm-2">
                                <div class="main-tiles border-5 card-hover border-0 card o-hidden">
                                    <div class="custome-4-bg b-r-4 card-body">
                                        <div class="media static-top-widget">
                                            <div class="media-body p-0">
                                                <span class="m-0">Tổng nhân viên</span>
                                                <h4 class="mb-0 counter">${requestScope.totalStaff} 
                                                </h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earning chart star-->
                            <div class="col-xl-6">
                                <div class="card o-hidden card-hover">
                                    <div class="card-header border-0 pb-1">
                                        <div class="card-header-title">
                                            <h4>Revenue Report</h4>
                                        </div>
                                    </div>
                                    <div class="card-body p-0">
                                        <div id="report-chart"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- Earning chart  end-->


                            <!-- Best Selling Product Start -->
                            <div class="col-xl-6 col-md-12">
                                <div class="card o-hidden card-hover">
                                    <div class="card-header card-header-top card-header--2 px-0 pt-0">
                                        <div class="card-header-title">
                                            <h4>Best Selling Product</h4>
                                        </div>

                                        <div class="best-selling-box d-sm-flex d-none">
                                            <span>Short By:</span>
                                            <div class="dropdown">
                                                <button class="btn p-0 dropdown-toggle" type="button"
                                                        id="dropdownMenuButton1" data-bs-toggle="dropdown"
                                                        data-bs-auto-close="true">Today</button>
                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card-body p-0">
                                        <div>
                                            <div class="table-responsive">
                                                <table class="best-selling-table w-image
                                                       w-image
                                                       w-image table border-0">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <div class="best-product-box">
                                                                    <div class="product-image">
                                                                        <img src="assets/images/product/1.png"
                                                                             class="img-fluid" alt="Product">
                                                                    </div>
                                                                    <div class="product-name">
                                                                        <h5>Aata Buscuit</h5>
                                                                        <h6>26-08-2022</h6>
                                                                    </div>
                                                                </div>
                                                            </td>

                                                            <td>
                                                                <div class="product-detail-box">
                                                                    <h6>Price</h6>
                                                                    <h5>$29.00</h5>
                                                                </div>
                                                            </td>

                                                            <td>
                                                                <div class="product-detail-box">
                                                                    <h6>Orders</h6>
                                                                    <h5>62</h5>
                                                                </div>
                                                            </td>

                                                            <td>
                                                                <div class="product-detail-box">
                                                                    <h6>Stock</h6>
                                                                    <h5>510</h5>
                                                                </div>
                                                            </td>

                                                            <td>
                                                                <div class="product-detail-box">
                                                                    <h6>Amount</h6>
                                                                    <h5>$1,798</h5>
                                                                </div>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <div class="best-product-box">
                                                                    <div class="product-image">
                                                                        <img src="assets/images/product/2.png"
                                                                             class="img-fluid" alt="Product">
                                                                    </div>
                                                                    <div class="product-name">
                                                                        <h5>Aata Buscuit</h5>
                                                                        <h6>26-08-2022</h6>
                                                                    </div>
                                                                </div>
                                                            </td>

                                                            <td>
                                                                <div class="product-detail-box">
                                                                    <h6>Price</h6>
                                                                    <h5>$29.00</h5>
                                                                </div>
                                                            </td>

                                                            <td>
                                                                <div class="product-detail-box">
                                                                    <h6>Orders</h6>
                                                                    <h5>62</h5>
                                                                </div>
                                                            </td>

                                                            <td>
                                                                <div class="product-detail-box">
                                                                    <h6>Stock</h6>
                                                                    <h5>510</h5>
                                                                </div>
                                                            </td>

                                                            <td>
                                                                <div class="product-detail-box">
                                                                    <h6>Amount</h6>
                                                                    <h5>$1,798</h5>
                                                                </div>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <div class="best-product-box">
                                                                    <div class="product-image">
                                                                        <img src="assets/images/product/3.png"
                                                                             class="img-fluid" alt="Product">
                                                                    </div>
                                                                    <div class="product-name">
                                                                        <h5>Aata Buscuit</h5>
                                                                        <h6>26-08-2022</h6>
                                                                    </div>
                                                                </div>
                                                            </td>

                                                            <td>
                                                                <div class="product-detail-box">
                                                                    <h6>Price</h6>
                                                                    <h5>$29.00</h5>
                                                                </div>
                                                            </td>

                                                            <td>
                                                                <div class="product-detail-box">
                                                                    <h6>Orders</h6>
                                                                    <h5>62</h5>
                                                                </div>
                                                            </td>

                                                            <td>
                                                                <div class="product-detail-box">
                                                                    <h6>Stock</h6>
                                                                    <h5>510</h5>
                                                                </div>
                                                            </td>

                                                            <td>
                                                                <div class="product-detail-box">
                                                                    <h6>Amount</h6>
                                                                    <h5>$1,798</h5>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Best Selling Product End -->

                            <!-- Earning chart star-->
                            <div class="col-xl-6">
                                <div class="card o-hidden card-hover">
                                    <div class="card-header border-0 mb-0">
                                        <div class="card-header-title">
                                            <h4>Earning</h4>
                                        </div>
                                    </div>
                                    <div class="card-body p-0">
                                        <div id="bar-chart-earning"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- Earning chart end-->

                            <!-- visitors chart start-->
                            <div class="col-xxl-4 col-md-6">
                                <div class="h-100">
                                    <div class="card o-hidden card-hover">
                                        <div class="card-header border-0">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <div class="card-header-title">
                                                    <h4>Visitors</h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body pt-0">
                                            <div class="pie-chart">
                                                <div id="pie-chart-visitors"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- visitors chart end-->
                        </div>
                    </div>
                    <!-- Container-fluid Ends-->
                </div>
            </div>
        </div>
        <!-- page-wrapper end-->


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

        <!-- customizer js -->
        <script src="${pageContext.request.contextPath}/assets2/js/customizer.js"></script>

        <!-- Sidebar js -->
        <script src="${pageContext.request.contextPath}/assets2/js/config.js"></script>

        <!-- Plugins JS -->
        <script src="${pageContext.request.contextPath}/assets2/js/sidebar-menu.js"></script>
    <!--    <script src="${pageContext.request.contextPath}/assets2/js/notify/bootstrap-notify.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/notify/index.js"></script>-->

        <!--Dropzon js -->
        <script src="${pageContext.request.contextPath}/assets2/js/dropzone/dropzone.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/dropzone/dropzone-script.js"></script>

        <!-- select 2 js -->
        <script src="${pageContext.request.contextPath}/assets2/js/select2.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/select2-custom.js"></script>

        <!-- sidebar effect -->
        <script src="${pageContext.request.contextPath}/assets2/js/sidebareffect.js"></script>

        <!-- Theme js -->
        <script src="${pageContext.request.contextPath}/assets2/js/script.js"></script>
    </body>

</html>