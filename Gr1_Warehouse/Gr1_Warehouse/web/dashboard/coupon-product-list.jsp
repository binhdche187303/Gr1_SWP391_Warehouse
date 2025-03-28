<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/8.png" type="image/x-icon">
        <title>Thêm mã giảm giá</title>

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

        <!-- Data Table css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/datatables.css">

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

        <!-- page-wrapper Start -->
        <div class="page-wrapper compact-wrapper" id="pageWrapper">

            <!-- Page Body Start-->
            <div class="page-body-wrapper">
                <!-- Container-fluid starts-->
                <!-- Coupon list table starts-->
                <div class="page-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card card-table">
                                    <div class="card-body">
                                        <div class="title-header option-title">
                                            <h5>Danh sách sản phẩm</h5>
                                            <div class="right-options">
                                                <ul>
                                                    <li>
                                                        <input type="text" id="productNameFilter" class="form-control" placeholder="Tìm theo tên sản phẩm">
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="card-body">
                                                <div class="table-responsive table-product">
                                                    <table class="table all-package coupon-list-table table-hover theme-table" id="table_id">
                                                        <thead>
                                                            <tr>
                                                                <th>Tên sản phẩm</th>
                                                                <th>Hành động</th>
                                                            </tr>
                                                        </thead>

                                                        <tbody>
                                                            <c:forEach items="${requestScope.listProduct}" var="lp">
                                                                <tr>
                                                                    <td class="theme-color">${lp.productName}</td>
                                                                    <td>
                                                                        <ul>
                                                                            <a href="discountproductdetail?product_id=${lp.productId}" 
                                                                               class="view-discount-history" 
                                                                               >
                                                                                <i class="ri-eye-line"></i>
                                                                            </a>
                                                                            <a href="createcouponproduct?product_id=${lp.productId}" class="view-discount-history">
                                                                                <i class="ri-add-circle-line" style="color: rgb(116, 125, 198);width: 19;height: 18"></i>
                                                                            </a>
                                                                        </ul>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Pagination End -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Container-fluid Ends-->

                    </div>
                </div>

            </div>
            <!-- page-wrapper End -->


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
            <!--<script src="${pageContext.request.contextPath}/assets2/js/customizer.js"></script>-->

            <!-- Sidebar js -->
            <script src="${pageContext.request.contextPath}/assets2/js/config.js"></script>

            <!-- Plugins JS -->
            <script src="${pageContext.request.contextPath}/assets2/js/sidebar-menu.js"></script>
    <!--        <script src="${pageContext.request.contextPath}/assets2/js/notify/bootstrap-notify.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets2/js/notify/index.js"></script>-->

            <!-- Data table js -->
    <!--        <script src="${pageContext.request.contextPath}/assets2/js/jquery.dataTables.js"></script>
            <script src="${pageContext.request.contextPath}/assets2/js/custom-data-table.js"></script>-->

            <!-- all checkbox select js -->
            <script src="${pageContext.request.contextPath}/assets2/js/checkbox-all-check.js"></script>

            <!-- sidebar effect -->
            <!--<script src="${pageContext.request.contextPath}/assets2/js/sidebareffect.js"></script>-->

            <!-- Theme js -->
            <script src="${pageContext.request.contextPath}/assets2/js/script.js"></script>

            <!-- DataTables CSS -->
            <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">

            <!-- DataTables JS -->
            <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

            <script>
                $(document).ready(function () {
                    // Khởi tạo DataTable với các cài đặt chi tiết
                    const table = $('#table_id').DataTable({
                        paging: true,
                        searching: true,
                        ordering: false,
                        info: true,
                        pageLength: 10,
                        lengthChange: false,
                        language: {
                            url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/vi.json',
                            emptyTable: "Không có sản phẩm nào trong hệ thống",
                            zeroRecords: "Không tìm thấy sản phẩm phù hợp",
                            info: "Hiển thị _START_ đến _END_ của _TOTAL_ sản phẩm",
                            infoEmpty: "Hiển thị 0 đến 0 của 0 sản phẩm",
                            infoFiltered: "(được lọc từ tổng số _MAX_ sản phẩm)",
                            paginate: {
                                first: "Đầu tiên",
                                last: "Cuối cùng",
                                next: "Tiếp theo",
                                previous: "Trước đó"
                            }
                        },
                        columnDefs: [
                            {orderable: false, targets: 0}, // Vô hiệu hóa sắp xếp cho các cột 0 và 1
                            {orderable: false, targets: 1} // Vô hiệu hóa sắp xếp cho các cột 0 và 1
                        ],
                        initComplete: function () {
                            // Ẩn thanh tìm kiếm mặc định của DataTables
                            $('.dataTables_filter').hide();
                        }
                    });

                    // Xử lý tìm kiếm
                    $('#productNameFilter').on('keyup', function () {
                        // Tìm kiếm không phân biệt chữ hoa chữ thường
                        table.columns(0).search(this.value.trim()).draw();
                    });
                }
                );
            </script>
    </body>

</html>