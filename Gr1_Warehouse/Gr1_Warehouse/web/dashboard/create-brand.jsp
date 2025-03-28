<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/8.png" type="image/x-icon">
        <title>Thêm thương hiệu</title>

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

        <!-- bootstrap css -->
        <link id="rtl-link" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/bootstrap.css">

        <!-- wow css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/animate.min.css" />

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
            /* Định dạng container phân trang */
            .dataTables_paginate {
                padding: 15px 0;
                text-align: center !important;
                margin-top: 15px !important;
                width: 100%;
            }

            /* Định dạng các nút phân trang */
            .dataTables_paginate .paginate_button {
                padding: 8px 14px !important;
                margin: 0 3px !important;
                border: 1px solid #e0e0e0 !important;
                background: #ffffff !important;
                border-radius: 4px !important;
                color: #333 !important;
                cursor: pointer;
                transition: all 0.3s ease;
                display: inline-block;
                text-decoration: none !important;
            }

            /* Hiệu ứng hover trên nút phân trang */
            .dataTables_paginate .paginate_button:hover {
                background: #f5f5f5 !important;
                border-color: #ccc !important;
                color: #000 !important;
            }

            /* Định dạng nút trang đang được chọn */
            .dataTables_paginate .paginate_button.current {
                background: #0d6efd !important;
                border-color: #0d6efd !important;
                color: white !important;
                font-weight: bold;
            }

            /* Hiệu ứng hover trên nút trang đang được chọn */
            .dataTables_paginate .paginate_button.current:hover {
                background: #0b5ed7 !important;
                border-color: #0a58ca !important;
            }

            /* Định dạng nút bị vô hiệu hóa */
            .dataTables_paginate .paginate_button.disabled {
                color: #aaa !important;
                border-color: #e0e0e0 !important;
                background: #f5f5f5 !important;
                cursor: not-allowed;
            }

            /* Định dạng thông tin phân trang "Hiển thị x đến y của z bản ghi" */
            .dataTables_info {
                padding: 15px 0;
                text-align: center;
                color: #666;
                font-style: italic;
                margin-top: 10px;
                width: 100%;
            }

            /* Căn chỉnh số trang giữa dòng */
            .dataTables_wrapper .row:last-child {
                justify-content: center;
                align-items: center;
            }
        </style>
    </head>
    <body>

        <%@include file="/includes/admin.jsp" %>
        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <!-- Page Body Start -->
            <div class="page-body-wrapper">
                <!-- Container-fluid starts-->
                <div class="page-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="title-header option-title">
                                                    <h5>Tạo thương hiệu mới</h5>
                                                    <a href="/Gr1_Warehouse/brandlist" class="btn btn-primary btn-lg shadow-sm">
                                                        <i class=""></i>Danh sách thương hiệu
                                                    </a>
                                                </div>
                                                <div class="tab-content" id="pills-tabContent">
                                                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel">
                                                        <form class="theme-form theme-form-2 mega-form" action="createbrand" method="post">
                                                            <div class="row">
                                                                <div class="mb-4 row align-items-center">
                                                                    <label
                                                                        class="col-lg-2 col-md-3 col-form-label form-label-title">Tên thương hiệu</label>
                                                                    <div class="col-md-9 col-lg-10">
                                                                        <input class="form-control" type="text" name="brand_name" required 
                                                                               value="${requestScope.brand_name != null ? requestScope.brand_name : ''}">
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-2 col-md-3 mb-4"></div>
                                                                <div class="col-md-9 col-lg-10">
                                                                    <button type="submit" class="btn btn-primary">Gửi</button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                        <c:if test="${not empty requestScope.message}">
                                                            <div class="alert alert-dismissible fade show" 
                                                                 role="alert" 
                                                                 style="background-color: red; color: white; border: 1px solid darkred; font-weight: bold;">
                                                                ${requestScope.message}
                                                                <button stype="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" style="filter: invert(1);"></button>
                                                            </div>
                                                        </c:if>
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
        <!--<script src="${pageContext.request.contextPath}/assets2/js/customizer.js"></script>-->

        <!-- ratio js -->
        <script src="${pageContext.request.contextPath}/assets2/js/ratio.js"></script>

        <!-- sidebar effect -->
        <!--<script src="${pageContext.request.contextPath}/assets2/js/sidebareffect.js"></script>-->

        <!-- Theme js -->
        <script src="${pageContext.request.contextPath}/assets2/js/script.js"></script>

        <!-- latest jquery-->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>

        <!-- jquery ui-->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-ui.min.js"></script>

        <!-- Bootstrap js-->
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap-notify.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/popper.min.js"></script>

        <!-- feather icon js-->
        <script src="${pageContext.request.contextPath}/assets/js/feather/feather.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/feather/feather-icon.js"></script>

        <!-- Lazyload Js -->
        <script src="${pageContext.request.contextPath}/assets/js/lazysizes.min.js"></script>

        <!-- Slick js-->
        <script src="${pageContext.request.contextPath}/assets/js/slick/slick.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/slick/slick-animation.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/custom-slick-animated.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/slick/custom_slick.js"></script>

        <!-- Price Range Js -->
        <script src="${pageContext.request.contextPath}/assets/js/ion.rangeSlider.min.js"></script>

        <!-- sidebar open js -->
        <script src="${pageContext.request.contextPath}/assets/js/filter-sidebar.js"></script>

        <!-- Quantity js -->
        <script src="${pageContext.request.contextPath}/assets/js/quantity-2.js"></script>

        <!-- Zoom Js -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery.elevatezoom.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/zoom-filter.js"></script>


        <!-- Sticky-bar js -->
        <script src="${pageContext.request.contextPath}/assets/js/sticky-cart-bottom.js"></script>

        <!-- script js -->
        <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>                 

        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    </body>

</html>