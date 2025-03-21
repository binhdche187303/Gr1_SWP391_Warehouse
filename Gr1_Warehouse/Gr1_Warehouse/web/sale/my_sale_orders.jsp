<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <link rel="icon" href="assets/images/favicon.png" type="image/x-icon">
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/8.png" type="image/x-icon">
        <title>Danh sách đơn hàng tư vấn của tôi</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Bootstrap JS và Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

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
        <!-- Bootstrap css-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/bootstrap.css">
        <!-- Slick Slider Css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets2/css/vendors/slick.css">
        <!-- App css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/style.css">
    </head>
    <body>

        <c:if test="${empty mySaleOrders}">
            <p>Chưa có đơn hàng nào được nhận.</p>
        </c:if>

        <%@ include file="/sale/sale_dashboard.jsp" %>
        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <!-- Page Body Start -->
            <div class="page-body-wrapper">
                <div class="page-body">
                    <div class="container mt-4">
                        <div class="card shadow-sm p-4">
                            <h3>Danh sách đơn hàng của tôi</h3><br>

                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <div class="input-group mb-3">
                                </div>
                                <div class="d-flex justify-content-end">
                                    <a href="sale-orders" class="btn btn-primary">Quay lại</a>
                                </div>
                            </div>
                            <div class="mb-2 d-flex align-items-center">
                                <label for="filterStatus" class="me-2 mb-0">Lọc trạng thái tư vấn:</label>
                                <select id="filterStatus" class="form-control" style="width: auto; min-width: 150px;">
                                    <option value="">Tất cả</option>
                                    <option value="Đã tư vấn">Đã tư vấn</option>
                                    <option value="Chưa tư vấn">Chưa tư vấn</option>
                                </select>
                            </div>
                            <table id="myTable" class="table table-striped table-bordered">
                                <thead class="table-light">
                                    <tr class="small fw-light">
                                        <th class="small text-center" style="font-size: 12px;">Mã đơn hàng</th>
                                        <th class="small text-center" style="font-size: 12px;">Trạng thái tư vấn</th>
                                        <th class="small text-center" style="font-size: 12px;">Chi tiết</th>
                                    </tr>
                                </thead>
                                <tbody class="text-center">
                                    <c:forEach var="order" items="${mySaleOrders}">
                                        <tr class="order-row" data-status="${order.status}">
                                            <td>${order.order_id}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${empty order.noteSale}">
                                                        Chưa tư vấn
                                                    </c:when>
                                                    <c:otherwise>
                                                        Đã tư vấn
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>


                                            <td>
                                                <a href="orderSaleDetail?orderId=${order.order_id}">
                                                    <i class="ri-eye-line"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                var table = $('#myTable').DataTable({
                    "paging": true,
                    "pageLength": 10,
                    "searching": true, // Vẫn phải bật tìm kiếm để lọc hoạt động
                    "lengthChange": false,
                    "ordering": true,
                    "dom": 'lrtip', // Ẩn thanh tìm kiếm mặc định
                    "language": {
                        "paginate": {
                            "first": "Trang đầu",
                            "last": "Trang cuối",
                            "next": "Tiếp",
                            "previous": "Trước"
                        },
                        "info": "Hiển thị _START_ đến _END_ trong tổng số _TOTAL_ đơn hàng",
                        "infoFiltered": ""
                    }
                });

                // Lọc theo trạng thái tư vấn khi thay đổi dropdown
                $('#filterStatus').on('change', function () {
                    var status = $(this).val();

                    // Sử dụng custom filtering
                    $.fn.dataTable.ext.search.pop(); // Xóa bộ lọc cũ nếu có
                    $.fn.dataTable.ext.search.push(
                            function (settings, data, dataIndex) {
                                // Nếu không chọn filter (giá trị rỗng) thì hiển thị tất cả
                                if (status === '') {
                                    return true;
                                }
                                // Kiểm tra nếu giá trị ở cột trạng thái (index 1) khớp với filter
                                return data[1].trim() === status;
                            }
                    );

                    table.draw(); // Vẽ lại bảng với bộ lọc mới
                });
            });
        </script>
        <!-- latest js -->
        <script src="${pageContext.request.contextPath}/assets2/js/jquery-3.6.0.min.js"></script>

        <!-- Bootstrap js -->
        <script src="${pageContext.request.contextPath}/assets2/js/bootstrap/bootstrap.bundle.min.js"></script>

        <!-- tooltip init js -->
        <script src="${pageContext.request.contextPath}/assets2/js/tooltip-init.js"></script>

        <!-- Plugins JS -->
        <script src="${pageContext.request.contextPath}/assets2/js/sidebar-menu.js"></script>

        <!-- slick slider js -->
        <script src="${pageContext.request.contextPath}/assets2/js/slick.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/custom-slick.js"></script>

        <!-- DataTables -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    </body>

</html>


