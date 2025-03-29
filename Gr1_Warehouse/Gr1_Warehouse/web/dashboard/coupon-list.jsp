<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="author" content="pixelstrap">
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/8.png" type="image/x-icon">
        <title>Danh sách mã giảm giá</title>

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

        <style>
            .coupon-list-table {
                table-layout: fixed;
                width: 100%;
            }

            .coupon-list-table th,
            .coupon-list-table td {
                white-space: nowrap; /* Ngăn chữ xuống dòng không mong muốn */
                overflow: hidden;
                text-overflow: ellipsis;
            }

            .coupon-list-table td span {
                display: block; /* Đảm bảo không bị tràn do inline */
            }

            .coupon-list-table th:nth-child(1),
            .coupon-list-table td:nth-child(1) {
                width: 10%; /* Điều chỉnh độ rộng cột */
            }

            .coupon-list-table th:nth-child(2),
            .coupon-list-table td:nth-child(2) {
                width: 10%;
            }

            .coupon-list-table th:nth-child(10),
            .coupon-list-table td:nth-child(10) {
                width: 12%; /* Đảm bảo cột Action không bị chồng lên */
            }
        </style>

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
                                            <h5>Danh sách mã giảm giá</h5>
                                            <div class="right-options">
                                                <ul>
                                                    <li>
                                                        <a class="btn btn-solid" href="/Gr1_Warehouse/createcoupon">Tạo mã giảm giá</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="d-flex justify-content-between mb-3">
                                                <input type="text" id="searchCode" class="form-control w-25" placeholder="Tìm theo mã giảm giá">
                                                <select id="filterStatus" class="form-select w-25">
                                                    <option value="">Tất cả trạng thái</option>
                                                    <option value="Active">Active</option>
                                                    <option value="Inactive">Inactive</option>
                                                </select>
                                            </div>
                                            <div class="table-responsive">
                                                <table class="table all-package coupon-list-table table-hover theme-table" id="table_id">
                                                    <thead>
                                                        <tr>
                                                            <th>Mã</th>
                                                            <th>% giảm</th>
                                                            <th>Số lượng tối thiểu</th>
                                                            <th>Giá trị đơn hàng tối thiểu</th>
                                                            <th>Ngày bắt đầu</th>
                                                            <th>Ngày kết thúc</th>
                                                            <th>Số lượng mã</th>
                                                            <th>Cập nhật lần cuôí</th>
                                                            <th>Trạng thái</th>
                                                            <th>Hành động</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <c:forEach items="${requestScope.listDiscounts}" var="ld">
                                                            <tr>
                                                                <td class="theme-color">${ld.discount_code}</td>
                                                                <td class="theme-color"><fmt:formatNumber value="${ld.discount_percentage}" type="number" pattern="#,#0.0"/>%</td>
                                                                <td class="theme-color">${ld.min_quantity}</td>
                                                                <td class="theme-color">${ld.min_order_value}</td>

                                                                <fmt:parseDate value="${ld.start_date}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedStartDate" />

                                                                <td class="menu-status">
                                                                    <span class="success">
                                                                        <fmt:formatDate value="${parsedStartDate}" pattern="dd/MM/yyyy"/>
                                                                    </span>
                                                                </td>
                                                                <td class="menu-status">
                                                                    <c:choose>
                                                                        <c:when test="${ld.end_date != null && ld.end_date != ''}">
                                                                            <fmt:parseDate value="${ld.end_date}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedEndDate" />
                                                                            <span class="danger">
                                                                                <fmt:formatDate value="${parsedEndDate}" pattern="dd/MM/yyyy"/>
                                                                            </span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span>
                                                                                <!-- Empty span with no class -->
                                                                            </span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>

                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${ld.max_uses == null}">

                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            ${ld.max_uses}
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>

                                                                <fmt:parseDate value="${ld.created_at}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedCreateDate" />
                                                                <td class="menu-status">
                                                                    <span class="danger">
                                                                        <fmt:formatDate value="${parsedCreateDate}" pattern="dd/MM/yyyy"/>
                                                                    </span>
                                                                </td>
                                                                <td class="<c:choose>
                                                                        <c:when test='${ld.status == "Active"}'>text-success</c:when>
                                                                        <c:otherwise>text-danger</c:otherwise>
                                                                    </c:choose>">
                                                                    ${ld.status}
                                                                </td>

                                                                <td>
                                                                    <ul>
                                                                        <a href="listdiscounthistory?discount_id=${ld.discount_id}" 
                                                                           class="view-discount-history" 
                                                                           >
                                                                            <i class="ri-eye-line"></i>
                                                                        </a>


                                                                        <li>
                                                                            <a href="javascript:void(0)" 
                                                                               class="edit-discount-btn"
                                                                               data-id="${ld.discount_id}" 
                                                                               data-code="${ld.discount_code}" 
                                                                               data-percentage="${ld.discount_percentage}" 
                                                                               data-start="${ld.start_date}" 
                                                                               data-end="${ld.end_date}" 
                                                                               data-status="${ld.status}" 
                                                                               data-max-uses="${ld.max_uses}">
                                                                                <i class="ri-pencil-line"></i>
                                                                            </a>

                                                                        </li>
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

        <!-- Edit Discount Modal -->
        <div class="modal fade theme-modal" id="edit-discount" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Chỉnh sửa mã giảm giá</h5>
                    </div>
                    <div class="modal-body">
                        <form action="couponlist" method="POST">
                            <input type="hidden" name="discount_id" value="" />

                            <!-- Discount Code -->
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="discount_code" name="discount_code" value="" readonly />
                                <label for="discount_code">Mã giảm giá</label>
                            </div>

                            <!-- Discount % -->
                            <div class="form-floating mb-3">
                                <input type="number" 
                                       class="form-control" 
                                       id="discount_percentage" 
                                       name="discount_percentage" 
                                       min="0.1" 
                                       max="99.9" 
                                       step="0.1" 
                                       value="" 
                                       required/>
                                <label for="discount_percentage">Giảm giá(%)</label>
                            </div>  

                            <!-- Start Date & End Date cùng hàng -->
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input type="date" class="form-control" id="start_date" name="start_date" value="" required readonly />
                                        <label for="start_date">Ngày bắt đầu</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input type="date" class="form-control" id="end_date" name="end_date" value="" required readonly />
                                        <label for="end_date">Ngày kết thúc</label>
                                    </div>
                                </div>
                            </div>

                            <!-- Quantity -->
                            <div class="form-floating mb-3">
                                <input type="number" class="form-control" id="max_uses" name="max_uses" value="" />
                                <label for="max_uses">Số lượng mã</label>
                            </div>

                            <!-- Status -->
                            <div class="mb-3">
                                <label for="status" class="form-label">Trạng thái</label>
                                <select id="status" name="status" class="form-select">
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>

                            <!-- Modal Footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit Profile Modal End -->

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


        <!-- Sidebar js -->
        <script src="${pageContext.request.contextPath}/assets2/js/config.js"></script>

        <!-- Plugins JS -->
        <script src="${pageContext.request.contextPath}/assets2/js/sidebar-menu.js"></script>


        <!-- Data table js -->
        <script src="${pageContext.request.contextPath}/assets2/js/jquery.dataTables.js"></script><!--
        <script src="${pageContext.request.contextPath}/assets2/js/custom-data-table.js"></script>-->

        <!-- all checkbox select js -->
        <script src="${pageContext.request.contextPath}/assets2/js/checkbox-all-check.js"></script>


        <!-- Theme js -->
        <script src="${pageContext.request.contextPath}/assets2/js/script.js"></script>

        <script>
            //Datatable
            $(document).ready(function () {
                // Khởi tạo DataTable
                var table = $("#table_id").DataTable({
                    "paging": true, // Bật phân trang
                    "ordering": true, // Cho phép sắp xếp
                    "info": true, // Hiển thị thông tin số dòng
                    "searching": true, // Vẫn cho phép tìm kiếm nhưng ẩn ô tìm kiếm mặc định
                    "dom": "tip", // Ẩn lengthMenu và ô tìm kiếm mặc định
                    "language": {
                        "zeroRecords": "Không tìm thấy dữ liệu",
                        "info": "Hiển thị _PAGE_ của _PAGES_",
                        "infoEmpty": "Không có dữ liệu",
                        "infoFiltered": "(lọc từ _MAX_ dòng)",
                        "paginate": {
                            "first": "Đầu",
                            "last": "Cuối",
                            "next": "Tiếp",
                            "previous": "Trước"
                        }
                    }
                });


                // Tìm kiếm theo mã giảm giá
                $("#searchCode").on("keyup", function () {
                    table.columns(0).search(this.value).draw();
                });

                // Lọc theo trạng thái
                $("#filterStatus").on("change", function () {
                    table.columns(8).search(this.value).draw();
                });
            });

//
            $(document).on("click", ".edit-discount-btn", function () {
                var id = $(this).data("id");
                var code = $(this).data("code");
                var percentage = $(this).data("percentage");
                var start = $(this).data("start");
                var end = $(this).data("end");
                var maxUses = $(this).data("max-uses");
                var status = $(this).data("status");

                function formatDate(dateString) {
                    if (!dateString)
                        return "";
                    var date = new Date(dateString);
                    if (isNaN(date))
                        return "";
                    return date.getFullYear() + "-" +
                            String(date.getMonth() + 1).padStart(2, '0') + "-" +
                            String(date.getDate()).padStart(2, '0');
                }

                $("#edit-discount input[name='discount_id']").val(id);
                $("#edit-discount input[name='discount_code']").val(code);

                // Kiểm tra nếu percentage không phải số, tránh lỗi
                if (percentage !== undefined && !isNaN(percentage)) {
                    $("#edit-discount input[name='discount_percentage']").val(parseFloat(percentage).toFixed(1));
                } else {
                    $("#edit-discount input[name='discount_percentage']").val("");
                }

                $("#edit-discount input[name='start_date']").val(formatDate(start));
                $("#edit-discount input[name='end_date']").val(formatDate(end));
                $("#edit-discount input[name='max_uses']").val(maxUses);
                $("#edit-discount select[name='status']").val(status);
                $("#edit-discount input[name='max_uses']").attr("min", maxUses);

                $("#edit-discount").modal("show");
            });


//Check end date
// Function to add warning icons/indicators to discount end dates
            document.addEventListener('DOMContentLoaded', function () {
                // Get all rows in the discount table
                const tableRows = document.querySelectorAll('#table_id tbody tr');
                const currentDate = new Date();

                // Set the warning threshold (7 days before expiration)
                const warningThreshold = 7;

                tableRows.forEach(function (row) {
                    // Get the end date cell (6th column, index 5)
                    const endDateCell = row.querySelector('td:nth-child(6)');
                    if (!endDateCell)
                        return;

                    // Extract the date from the span inside the cell
                    const dateSpan = endDateCell.querySelector('span');
                    if (!dateSpan)
                        return;

                    const dateText = dateSpan.textContent.trim();
                    if (!dateText)
                        return;

                    // Parse the date (format: dd/MM/yyyy)
                    const dateParts = dateText.split('/');
                    const day = parseInt(dateParts[0], 10);
                    const month = parseInt(dateParts[1], 10);
                    const year = parseInt(dateParts[2], 10);
                    const endDate = new Date(year, month - 1, day); // Month is 0-based in JavaScript

                    // Calculate days difference
                    const differenceInTime = endDate.getTime() - currentDate.getTime();
                    const differenceInDays = Math.ceil(differenceInTime / (1000 * 3600 * 24));

                    // Create warning element
                    const warningElement = document.createElement('span');
                    warningElement.style.marginLeft = '10px';
                    warningElement.style.fontWeight = 'bold';
                    warningElement.style.borderRadius = '3px';
                    warningElement.style.padding = '2px 6px';

                    // Apply different styles based on urgency
                    if (differenceInDays < 0) {
                        // Past expiration
                        warningElement.textContent = 'Đã hết hạn';
                        warningElement.style.backgroundColor = '#ffcccc';
                        warningElement.style.color = '#d9534f';
                    } else if (differenceInDays <= warningThreshold) {
                        // Approaching expiration
                        warningElement.textContent = 'Còn ' + differenceInDays + ' ngày';
                        warningElement.style.backgroundColor = '#fff3cd';
                        warningElement.style.color = '#ffc107';
                    } else {
                        // No warning needed for dates far in the future
                        return;
                    }

                    // Add warning element to the cell
                    dateSpan.appendChild(warningElement);

                    // Also highlight the entire row for expired discounts
                    if (differenceInDays < 0) {
                        row.style.backgroundColor = 'rgba(255, 204, 204, 0.2)';
                    } else if (differenceInDays <= warningThreshold) {
                        row.style.backgroundColor = 'rgba(255, 243, 205, 0.2)';
                    }
                });

            });
        </script>

    </body>

</html>