<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/8.png" type="image/x-icon">
        <title>Duyệt khách hàng</title>

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
        <c:if test="${not empty sessionScope.message}">
            <div class="alert alert-success">${sessionScope.message}</div>
            <c:remove var="message" scope="session"/>
        </c:if>

        <%@ include file="/sale/sale_dashboard.jsp" %>
        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <!-- Page Body Start -->
            <div class="page-body-wrapper">
                <div class="page-body">
                    <div class="container mt-4">
                        <div class="card shadow-sm p-4">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h3>Danh sách khách hàng</h3>
                            </div>
                            <!-- Lấy giá trị từ request parameter -->
                            <c:set var="success" value="${param.success}" />
                            <c:set var="error" value="${param.error}" />

                            <!-- Hiển thị thông báo thành công -->
                            <c:if test="${success eq 'approve'}">
                                <div class="alert alert-success">Khách hàng đã được phê duyệt thành công!</div>
                            </c:if>

                            <c:if test="${success eq 'reject'}">
                                <div class="alert alert-success">Khách hàng đã bị từ chối!</div>
                            </c:if>
                            <!-- Hiển thị thông báo lỗi -->
                            <c:if test="${error eq 'invalid_action'}">
                                <div class="alert alert-danger">Hành động không hợp lệ!</div>
                            </c:if>

                            <c:if test="${error eq 'update_failed'}">
                                <div class="alert alert-danger">Cập nhật trạng thái thất bại!</div>
                            </c:if>
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h3></h3>
                                <select id="statusFilter" class="form-select form-select-sm" style="max-width: 200px;">
                                    <option value="all">Tất cả</option>
                                    <option value="Hoạt động">Hoạt động</option>
                                    <option value="Bị từ chối">Bị từ chối</option>
                                    <option value="Chờ duyệt">Chờ duyệt</option>
                                </select>
                            </div>
                            <!-- Your table content -->
                            <table id="customerTable" class="table table-striped table-bordered">
                                <thead class="table-light">
                                    <tr class="small fw-light">
                                        <th class="small text-center" style="font-size: 12px;">Mã khách hàng</th>
                                        <th class="small text-center" style="font-size: 12px;">Tên cửa hàng</th>
                                        <th class="small text-center" style="font-size: 12px;">Số điện thoại</th>
                                        <th class="small text-center" style="font-size: 12px;">Mã số thuế</th>
                                        <th class="small text-center" style="font-size: 12px;">Giấy phép kinh doanh</th>
                                        <th class="small text-center" style="font-size: 12px;">Trạng thái</th>
                                        <th class="small text-center" style="font-size: 12px;">Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="customer" items="${customers}">
                                        <tr>
                                            <td class="text-center">${customer.userId}</td>
                                            <td class="text-center">${customer.storeName}</td>
                                            <td class="text-center">${customer.storeAddress}</td>
                                            <td class="text-center">${customer.taxCode}</td>
                                            <td class="text-center">
                                                <c:choose>
                                                    <c:when test="${fn:startsWith(customer.businessLicense, 'http')}">
                                                        <a href="${customer.businessLicense}" target="_blank">
                                                            <img src="${customer.businessLicense}" alt="Giấy phép kinh doanh" style="max-width: 100px; height: auto;"
                                                                 onerror="this.onerror=null; this.style.display='none'; this.parentNode.innerHTML='<a href=\'${customer.businessLicense}\' target=\'_blank\'>Xem Giấy phép kinh doanh</a>';">
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${customer.businessLicense}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${customer.status == 'Hoạt động'}">
                                                        <span class="badge bg-success">Hoạt động</span>
                                                    </c:when>
                                                    <c:when test="${customer.status == 'Bị từ chối'}">
                                                        <span class="badge bg-danger">Bị từ chối</span>
                                                    </c:when>
                                                    <c:when test="${customer.status == 'Chờ duyệt'}">
                                                        <span class="badge bg-warning text-dark">Chờ duyệt</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-secondary">${customer.status}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>               
                                            <td>
                                                <c:choose>
                                                    <c:when test="${customer.status == 'Chờ duyệt'}">
                                                        <div class="d-flex gap-2">
                                                            <button class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#confirmModal" data-action="approve" data-id="${customer.userId}">Duyệt</button>
                                                            <button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#confirmModal" data-action="reject" data-id="${customer.userId}">Từ chối</button>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="text-center">Đã xử lý</div>
                                                    </c:otherwise>                                                
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <!-- Modal xác nhận -->
                            <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="confirmModalLabel">Xác nhận hành động</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            Bạn có chắc chắn muốn duyệt hoặc từ chối khách hàng này không?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                            <a href="#" id="confirmButton" class="btn btn-primary">Xác nhận</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- Thêm Script để xử lý Modal -->
        <script>
            var confirmButton = document.getElementById("confirmButton");

            // Lắng nghe sự kiện khi modal được mở
            var confirmModal = document.getElementById("confirmModal");
            confirmModal.addEventListener('show.bs.modal', function (event) {
                var button = event.relatedTarget;
                var action = button.getAttribute("data-action");
                var userId = button.getAttribute("data-id");

                // Cập nhật URL cho hành động xác nhận
                confirmButton.href = "browse-cus?action=" + action + "&id=" + userId;
            });
        </script>
        <script>
            document.getElementById("statusFilter").addEventListener("change", function () {
                var filterValue = this.value;
                var rows = document.querySelectorAll("table tbody tr");

                rows.forEach(function (row) {
                    var statusCell = row.querySelector("td:nth-child(6)"); // Cột trạng thái
                    if (filterValue === "all" || statusCell.textContent.trim() === filterValue) {
                        row.style.display = ""; // Hiển thị dòng
                    } else {
                        row.style.display = "none"; // Ẩn dòng
                    }
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
    </body>

</html>


