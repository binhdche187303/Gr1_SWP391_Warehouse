<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <link rel="icon" href="assets/images/favicon.png" type="image/x-icon">
        <link rel="shortcut icon" href="assets/images/favicon.png" type="image/x-icon">
        <title>Fastkart - Dashboard</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Bootstrap JS và Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>

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
        <%@ include file="/sale/sale_dashboard.jsp" %>
        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <!-- Page Body Start -->
            <div class="page-body-wrapper">
                <div class="page-body">
                    <div class="container-fluid">
                        <div class="row">
                            <!-- Cột chính (Thông tin đơn hàng) -->
                            <div class="col-lg-8">
                                <div class="card-body d-flex align-items-center">
                                    <div style="line-height: 1.2;">
                                        <h4 class="fw-bold">Đơn hàng ${orderDetail.order_id}</h4><br>
                                        <p class="text-muted">Thời gian đặt hàng: ${orderDetail.order_date}</p>
                                    </div>
                                </div>

                                <!-- Trạng thái thanh toán và giao hàng -->
                                <div class="card mb-4">
                                    <div class="card-body d-flex gap-4">
                                        <div>
                                            <p class="fw-bold">Trạng thái đơn hàng</p>
                                            <span class="badge bg-primary p-2">${orderDetail.order_status}</span>
                                        </div>
                                        <div>
                                            <p class="fw-bold">Trạng thái thanh toán</p>
                                            <span class="badge bg-success p-2">${orderDetail.payment_status}</span>
                                        </div>
                                    </div>
                                </div>

                                <!-- Chi tiết đơn hàng -->
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <h5 class="fw-bold">Chi tiết phiếu đóng gói</h5><br>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="small" style="font-size: 12px;">Sản phẩm</th>
                                                    <th class="small" style="font-size: 12px;">SKU</th>
                                                    <th class="small" style="font-size: 12px;">Kích thước</th>
                                                    <th class="small" style="font-size: 12px;">Số lượng</th>
                                                    <th class="small" style="font-size: 12px;">Giá</th>
                                                    <th class="small" style="font-size: 12px;">Thành tiền</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="totalBeforeDiscount" value="0" />
                                                <c:forEach var="product" items="${orderDetail.products}">
                                                    <tr>
                                                        <td>${product.product_name}</td>
                                                        <td>${product.sku}</td>
                                                        <td>${product.size_name}</td>
                                                        <td>${product.quantity}</td>
                                                        <td><fmt:formatNumber value="${product.unit_price}" type="currency" currencySymbol="₫" /></td>
                                                        <td><fmt:formatNumber value="${product.total_price}" type="currency" currencySymbol="₫" /></td>
                                                    </tr>
                                                    <c:set var="totalBeforeDiscount" value="${totalBeforeDiscount + product.total_price}" />
                                                </c:forEach>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="5" class="text-end fw-bold">Tổng:</td>
                                                    <td><fmt:formatNumber value="${totalBeforeDiscount}" type="currency" currencySymbol="₫" /></td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>                           
                                </div>
                                <div class="card mb-4">
                                    <div class="mt-3 fw-bold">
                                        <label for="note" class="form-label">Ghi chú đơn hàng</label>
                                        <textarea id="note" class="form-control" rows="3" placeholder="Nhập ghi chú về đơn hàng..."></textarea>
                                    </div>
                                </div>
                            </div>

                            <!-- Cột phụ (Xác thực đơn hàng & Thông tin khách hàng) -->
                            <div class="col-lg-4">
                                <div class="col-lg-4 d-flex justify-content-end">
                                    <button class="btn btn-primary position-absolute" 
                                            style="right: 10px; top: 0;" 
                                            onclick="window.location.href = '${pageContext.request.contextPath}/my-sale-orders'">
                                        Quay lại
                                    </button>
                                </div>

                                <!-- Xác nhận đơn hàng -->
                                <div class="card mb-4" style="margin-top: 105px;">
                                    <div class="card-body text-center">
                                        <h5 class="fw-bold">Xác nhận đơn hàng</h5>
                                        <p class="text-muted">Vui lòng xác thực đơn hàng khi đã tư vấn xong.</p>
                                        <button class="btn btn-primary w-100" id="confirmOrderBtn">Xác nhận</button>
                                    </div>
                                </div>
                                <!-- Modal Xác Nhận -->
                                <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="confirmModalLabel">Xác nhận đơn hàng</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Bạn có chắc muốn xác nhận đã tư vấn thành công <strong id="confirmOrderId"></strong> không?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                                <button type="button" class="btn btn-primary" id="confirmOrderSubmit">Xác nhận</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <!-- Thông tin nhân viên vận chuyển -->
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <h5 class="fw-bold">Thông tin nhân viên tư vấn</h5><br>
                                        <c:choose>
                                            <c:when test="${not empty orderDetail.staff_name}">
                                                <p class="fw-semibold">Tên: ${orderDetail.staff_name}</p>
                                                <ul class="list-unstyled text-muted">
                                                    <li>• Mã nhân viên: ${orderDetail.staff_id}</li>
                                                </ul>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="text-muted">Không có thông tin nhân viên tư vấn.</p>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>

                                <!-- Thông tin giao hàng -->
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <h5 class="fw-bold">Thông tin giao hàng</h5><br>
                                        <p class="fw-semibold">Người nhận: ${orderDetail.customer_name}</p>
                                        <p class="text-muted">Email: ${orderDetail.email}</p>
                                        <p class="text-muted">Số điện thoại: ${orderDetail.phone_number}</p>
                                        <p class="text-muted">Địa chỉ giao hàng: ${orderDetail.shipping_address}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="order-id" value="${orderDetail.order_id}">

            </div>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const confirmBtn = document.getElementById('confirmOrderBtn');
                const confirmSubmitBtn = document.getElementById('confirmOrderSubmit');
                const noteElement = document.getElementById('note');
                let selectedOrderId = null;

                // Lấy thông tin đơn hàng ngay khi trang được tải
                const orderIdElement = document.getElementById("order-id");
                const orderStatusElement = document.querySelector(".badge.bg-primary.p-2");

                // Kiểm tra nếu đơn hàng đã được xác nhận trước đó
                checkOrderConfirmationStatus();

                confirmBtn.addEventListener('click', function () {
                    if (!orderIdElement || !orderStatusElement) {
                        alert("️ Không tìm thấy thông tin đơn hàng!");
                        return;
                    }

                    selectedOrderId = orderIdElement.value.trim();
                    console.log("Selected Order ID:", selectedOrderId);

                    if (!selectedOrderId) {
                        alert("️ Không có mã đơn hàng!");
                        return;
                    }

                    // Kiểm tra xem đơn hàng đã được xác nhận chưa (từ localStorage)
                    if (localStorage.getItem('order_' + selectedOrderId + '_confirmed') === 'true') {
                        alert("Đơn hàng đã xác nhận, không thể xác nhận lại!");
                        return;
                    }

                    // Nếu trạng thái hợp lệ, hiển thị modal xác nhận
                    document.getElementById("confirmOrderId").innerText = selectedOrderId;
                    $('#confirmModal').modal('show');
                    console.log("Sending orderId:", selectedOrderId);
                });

                confirmSubmitBtn.addEventListener('click', function () {
                    if (!selectedOrderId)
                        return;

                    // Lấy nội dung ghi chú
                    const noteContent = noteElement.value.trim();
                    console.log("Order Note:", noteContent);

                    fetch("/Gr1_Warehouse/confirmSale", {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        },
                        body: new URLSearchParams({
                            'orderId': selectedOrderId,
                            'orderNote': noteContent
                        })
                    })
                            .then(response => response.json())
                            .then(data => {
                                console.log(" JSON đã xử lý:", data);
                                if (data.success === true) {
                                    console.log(" Xác nhận thành công!");
                                    // Ẩn modal xác nhận
                                    $('#confirmModal').modal('hide');
                                    // Hiển thị modal thông báo
                                    $('#depositModal').modal('show');

                                    // Cập nhật giao diện người dùng
                                    disableConfirmButton();
                                    makeNoteReadOnly();

                                    // 🔥 LƯU TRẠNG THÁI VÀO LOCAL STORAGE TRƯỚC KHI RELOAD
                                    localStorage.setItem('order_' + selectedOrderId + '_confirmed', 'true');
                                    localStorage.setItem('order_' + selectedOrderId + '_note', noteContent);

                                    // 🔥 TỰ ĐỘNG RELOAD SAU 1 GIÂY
                                    setTimeout(() => {
                                        location.reload();
                                    }, 1000);
                                } else {
                                    console.log("️ Xác nhận thất bại!");
                                    alert("Xác nhận đơn hàng thất bại. Vui lòng thử lại!");
                                }
                            })
                            .catch(error => {
                                console.error(" Lỗi:", error);
                                alert("Có lỗi xảy ra: " + error.message);
                            });
                });

                // Tạo các hàm helper để tái sử dụng code
                function disableConfirmButton() {
                    confirmBtn.disabled = true;
                    confirmBtn.classList.add('btn-secondary');
                    confirmBtn.classList.remove('btn-primary');
                    confirmBtn.innerText = 'Đã xác nhận';
                }

                function makeNoteReadOnly() {
                    if (noteElement) {
                        noteElement.readOnly = true;
                    }
                }

                function loadSavedNote(orderId) {
                    // Đầu tiên kiểm tra localStorage (trường hợp vừa xác nhận xong và reload)
                    const savedNote = localStorage.getItem('order_' + orderId + '_note');
                    if (savedNote) {
                        noteElement.value = savedNote;
                        return;
                    }

                    // Nếu không có trong localStorage, thử lấy từ server
                    fetch("/Gr1_Warehouse/getOrderNote", {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        },
                        body: new URLSearchParams({
                            'orderId': orderId
                        })
                    })
                            .then(response => response.json())
                            .then(data => {
                                if (data.success && data.note) {
                                    noteElement.value = data.note;
                                }
                            })
                            .catch(error => {
                                console.error("Lỗi khi lấy ghi chú:", error);
                            });
                }

                // Kiểm tra trạng thái xác nhận đơn hàng
                function checkOrderConfirmationStatus() {
                    if (orderIdElement) {
                        const orderId = orderIdElement.value.trim();
                        const isConfirmed = localStorage.getItem('order_' + orderId + '_confirmed');

                        if (isConfirmed === 'true') {
                            // Vô hiệu hóa nút và hiển thị ghi chú
                            disableConfirmButton();
                            makeNoteReadOnly();
                            loadSavedNote(orderId);
                        }
                    }
                }
            });
        </script>






        <style>
            .card {
                padding: 18px;
                margin-bottom: 10px;
                font-size: 12px;
            }

        </style>
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


