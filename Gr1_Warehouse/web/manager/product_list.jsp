<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                                                            <a href="createproduct?product_id=${lp.productId}" class="view-discount-history">
                                                                                <i class="ri-add-circle-line" style="color: rgb(116, 125, 198);width: 19;height: 18"></i>
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
        <script src="${pageContext.request.contextPath}/assets2/js/customizer.js"></script>

        <!-- ratio js -->
        <script src="${pageContext.request.contextPath}/assets2/js/ratio.js"></script>

        <!-- sidebar effect -->
        <script src="${pageContext.request.contextPath}/assets2/js/sidebareffect.js"></script>

        <!-- Theme js -->
        <script src="${pageContext.request.contextPath}/assets2/js/script.js"></script>

        <!-- DataTables CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">

        <!-- DataTables JS -->
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>


        <script>

            $(document).ready(function () {
                // Add filter form to the page
                const filterForm = `
        <div class="card-body">
            <div class="row mb-4">
                <div class="col-md-3 mb-2">
                    <input type="text" id="productNameFilter" class="form-control" placeholder="Tìm theo tên sản phẩm">
                </div>
                <div class="col-md-3 mb-2">
                    <input type="text" id="brandFilter" class="form-control" placeholder="Tìm theo thương hiệu">
                </div>
                <div class="col-md-3 mb-2">
                    <input type="text" id="categoryFilter" class="form-control" placeholder="Tìm theo loại">
                </div>
                <div class="col-md-3 mb-2">
                    <input type="text" id="originFilter" class="form-control" placeholder="Tìm theo nguồn gốc">
                </div>
            </div>
        </div>
    `;

                // Insert the filter form after the title-header
                $('.title-header').after(filterForm);

                // Initialize DataTable with search functionality
                const table = $('#table_id').DataTable({
                    paging: true,
                    searching: true,
                    ordering: true,
                    info: true,
                    pageLength: 5,
                    lengthChange: false,
                    language: {
                        url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/vi.json',
                        // Tùy chỉnh thông báo không tìm thấy dữ liệu
                        emptyTable: "Không có sản phẩm nào trong hệ thống",
                        zeroRecords: "Không tìm thấy sản phẩm phù hợp",
                        // Tùy chỉnh thông tin hiển thị phân trang
                        info: "Hiển thị _START_ đến _END_ của _TOTAL_ sản phẩm",
                        infoEmpty: "Hiển thị 0 đến 0 của 0 sản phẩm",
                        infoFiltered: "(được lọc từ tổng số _MAX_ sản phẩm)",
                        // Tùy chỉnh nút phân trang
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
                    // Ẩn thanh tìm kiếm mặc định và thực hiện các cài đặt khác
                    initComplete: function () {
                        // Remove sort indicator from image column
                        $('.sorting:first').removeClass('sorting').addClass('sorting_disabled');

                        // Ẩn thanh tìm kiếm mặc định
                        $('.dataTables_filter').hide();
                    }
                });

                // Custom filtering function
                $.fn.dataTable.ext.search.push(
                        function (settings, data, dataIndex) {
                            const productName = data[1].toLowerCase();
                            const brand = data[2].toLowerCase();
                            const category = data[3].toLowerCase();
                            const origin = data[4].toLowerCase();

                            const nameFilter = $('#productNameFilter').val().toLowerCase();
                            const brandFilter = $('#brandFilter').val().toLowerCase();
                            const categoryFilter = $('#categoryFilter').val().toLowerCase();
                            const originFilter = $('#originFilter').val().toLowerCase();

                            // Return true if all filters match
                            return (nameFilter === '' || productName.includes(nameFilter)) &&
                                    (brandFilter === '' || brand.includes(brandFilter)) &&
                                    (categoryFilter === '' || category.includes(categoryFilter)) &&
                                    (originFilter === '' || origin.includes(originFilter));
                        }
                );

                // Add event listeners to the filter inputs
                $('#productNameFilter, #brandFilter, #categoryFilter, #originFilter').on('keyup change', function () {
                    table.draw();
                });
            });

        </script>
    </body>

</html>
