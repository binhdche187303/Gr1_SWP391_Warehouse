<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/8.png" type="image/x-icon">
        <title>Danh sách sản phẩm</title>

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


        <%@include file="/includes/admin.jsp" %>
        <!-- page-wrapper Start-->
        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <!-- Page Body Start -->
            <div class="page-body-wrapper">
                <!-- Container-fluid starts-->
                <div class="page-body">
                    <!-- All User Table Start -->
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card card-table">
                                    <div class="card-body">
                                        <div class="title-header option-title">
                                            <h5>Danh sách sản phẩm</h5>

                                            <form class="d-inline-flex">
                                                <a href="/Gr1_Warehouse/createproductgeneral" class="btn btn-primary btn-lg shadow-sm">
                                                    <i class="fas fa-plus-circle"></i>Tạo sản phẩm mới
                                                </a>
                                            </form>
                                        </div>

                                        <div class="table-responsive table-product">
                                            <table class="table all-package theme-table" id="table_id">
                                                <thead>
                                                    <tr>
                                                        <th style="text-align: center">Ảnh</th>
                                                        <th style="text-align: center">Tên sản phẩm</th>
                                                        <th style="text-align: center">Thương hiệu</th>
                                                        <th style="text-align: center">Loại</th>
                                                        <th style="text-align: center">Nguồn gốc</th>
                                                        <th style="text-align: center">Hành động</th>
                                                    </tr>
                                                </thead>


                                                <tbody>
                                                    <c:forEach var="lp" items="${requestScope.listProducts}">
                                                        <tr>
                                                            <td style="text-align: center">
                                                                <img style=" object-fit: cover;; height:80px" src="${lp.images[0].image_url}" alt="${lp.productName}">
                                                            </td>

                                                            <td style="text-align: center">
                                                                ${lp.productName}

                                                            </td>
                                                            <td style="text-align: center">${lp.brand.brand_name}</td>
                                                            <td style="text-align: center">${lp.cate.category_name}</td>
                                                            <td style="text-align: center">${lp.origin}</td>

                                                            <td>
                                                                <ul>
                                                                    <li>
                                                                        <ul>
                                                                            <a href="productdetail?product_id=${lp.productId}" 
                                                                               class="view-discount-history" 
                                                                               >
                                                                                <i class="ri-eye-line"></i>
                                                                            </a>
                                                                        </ul>
                                                                    </li>

                                                                </ul>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- All User Table Ends-->
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

        <!-- DataTables CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">

        <!-- DataTables JS -->
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

        <script>
            $(document).ready(function () {
                // Lấy danh sách các thương hiệu duy nhất từ bảng
                var brandNames = {};
                $('#table_id tbody tr').each(function () {
                    var brand = $(this).find('td:eq(2)').text().trim(); // Cột 2: Thương hiệu
                    if (brand && !brandNames[brand]) {
                        brandNames[brand] = true;
                    }
                });

                // Tạo dropdown Thương hiệu thủ công
                var brandFilter = '<option value="">Tất cả thương hiệu</option>';
                for (var brand in brandNames) {
                    if (brandNames.hasOwnProperty(brand)) {
                        brandFilter += '<option value="' + brand + '">' + brand + '</option>';
                    }
                }

                // Lấy danh sách các danh mục duy nhất từ bảng
                var categoryNames = {};
                $('#table_id tbody tr').each(function () {
                    var category = $(this).find('td:eq(3)').text().trim(); // Cột 3: Danh mục
                    if (category && !categoryNames[category]) {
                        categoryNames[category] = true;
                    }
                });

                // Tạo dropdown Danh mục thủ công
                var categoryFilter = '<option value="">Tất cả danh mục</option>';
                for (var category in categoryNames) {
                    if (categoryNames.hasOwnProperty(category)) {
                        categoryFilter += '<option value="' + category + '">' + category + '</option>';
                    }
                }

                // Cập nhật form filter
                var filterForm =
                        '<div class="card-body">' +
                        '<div class="row mb-4">' +
                        '<div class="col-md-2 mb-2">' +
                        '<input type="text" id="productNameFilter" class="form-control" placeholder="Tìm theo Tên sản phẩm">' +
                        '</div>' +
                        '<div class="col-md-2 mb-2">' +
                        '<select id="brandFilter" class="form-control">' + brandFilter + '</select>' +
                        '</div>' +
                        '<div class="col-md-2 mb-2">' +
                        '<select id="categoryFilter" class="form-control">' + categoryFilter + '</select>' +
                        '</div>' +
                        '<div class="col-md-2 mb-2">' +
                        '<input type="text" id="originFilter" class="form-control" placeholder="Tìm theo Nguồn gốc">' +
                        '</div>' +
                        '</div>' +
                        '</div>';

                $('.title-header').after(filterForm);

                // Khởi tạo DataTable
                var table = $('#table_id').DataTable({
                    paging: true,
                    searching: true,
                    ordering: true,
                    info: true,
                    pageLength: 5,
                    lengthChange: false,
                    language: {
                        url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/vi.json',
                        emptyTable: "Không có sản phẩm nào trong hệ thống",
                        zeroRecords: "Không tìm thấy sản phẩm phù hợp",
                        info: "Hiển thị _START_ đến _END_ của _TOTAL_ sản phẩm",
                        infoEmpty: "Hiển thị 0 đến 0 của 0 sản phẩm",
                        infoFiltered: "(lọc từ _MAX_ sản phẩm)",
                        paginate: {
                            first: "Đầu tiên",
                            last: "Cuối cùng",
                            next: "Tiếp theo",
                            previous: "Trước đó"
                        }
                    },
                    columnDefs: [
                        {orderable: false, targets: 0}, // Disable sorting on image column
                        {orderable: false, targets: 5}  // Disable sorting on action column
                    ],
                    initComplete: function () {
                        $('.dataTables_filter').hide();
                    }
                });

                // Xử lý tìm kiếm theo Tên sản phẩm
                document.getElementById("productNameFilter").addEventListener("keyup", function () {
                    table.columns(1).search(this.value.trim()).draw(); // Cột 1: Tên sản phẩm
                });

                // Xử lý tìm kiếm theo Thương hiệu
                document.getElementById("brandFilter").addEventListener("change", function () {
                    table.columns(2).search(this.value.trim()).draw(); // Cột 2: Thương hiệu
                });

                // Xử lý tìm kiếm theo Danh mục
                document.getElementById("categoryFilter").addEventListener("change", function () {
                    table.columns(3).search(this.value.trim()).draw(); // Cột 3: Danh mục
                });

                // Xử lý tìm kiếm theo Nguồn gốc
                document.getElementById("originFilter").addEventListener("keyup", function () {
                    table.columns(4).search(this.value.trim()).draw(); // Cột 4: Nguồn gốc
                });
            });
        </script>
    </body>

</html>