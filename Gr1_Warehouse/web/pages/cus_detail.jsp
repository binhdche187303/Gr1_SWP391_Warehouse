<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="Fastkart" />
        <meta name="keywords" content="Fastkart" />
        <meta name="author" content="Fastkart" />
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/1.png" type="image/x-icon" />
        <title>User Dashboard</title>

        <!-- Google font -->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@400;500;600;700;800;900&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />

        <!-- bootstrap css -->
        <link id="rtl-link" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/bootstrap.css" />

        <!-- font-awesome css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/font-awesome.css" />

        <!-- feather icon css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/feather-icon.css" />

        <!-- slick css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/slick/slick.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/slick/slick-theme.css" />

        <!-- Iconly css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bulk-style.css" />

        <!-- Template css -->
        <link id="color-link" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css" />
    <body>
    </head>
    <%@ include file="/includes/header.jsp" %>

    <div class="container mt-5">
        <div class="order-detail-container">
            <h2 class="text-center mb-4">Chi tiết đơn hàng</h2>

            <!-- Thông tin đơn hàng -->
            <div class="order-info mb-4">
                <p><strong>Mã đơn hàng:</strong> #${orderDetail.order.orderId}</p>
                <p><strong>Ngày đặt hàng:</strong> ${orderDetail.order.orderDate}</p>
                <p><strong>Trạng thái đơn hàng:</strong> 
                    <span class="badge ${orderDetail.order.status eq 'Pending' ? 'bg-warning' : 'bg-success'}">
                        ${orderDetail.order.status}
                    </span>
                </p>
                <p><strong>Trạng thái thanh toán:</strong> 
                    <span class="badge ${paymentStatus eq 'Thanh toán 50%' ? 'bg-info' : (paymentStatus eq 'Đã thanh toán' ? 'bg-success' : 'bg-danger')}">
                        ${paymentStatus}
                    </span>
                </p>

                <p><strong>Tổng:</strong> 
                    <fmt:formatNumber value="${orderDetail.order.totalAmount}" type="currency" currencySymbol="VND" groupingUsed="true"/>
                </p>
            </div>
            <input type="hidden" id="order-id" value="${orderDetail.order.orderId}">

            <!-- Danh sách sản phẩm -->
            <table class="table table-striped table-bordered">
                <thead class="table-light">
                    <tr>
                        <th>Sản phẩm</th>
                        <th>SKU</th>
                        <th>Size</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Tổng</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="i" begin="0" end="${orderDetail.orderDetails.size() - 1}">
                        <tr>
                            <td>${orderDetail.products[i].productName}</td>
                            <td>${orderDetail.productVariants[i].sku}</td>
                            <td>${orderDetail.sizes[i].size_name}</td>
                            <td><fmt:formatNumber value="${orderDetail.orderDetails[i].unitPrice}" type="currency" currencySymbol="VND" /></td>
                            <td>${orderDetail.orderDetails[i].quantity}</td>
                            <td><fmt:formatNumber value="${orderDetail.orderDetails[i].unitPrice * orderDetail.orderDetails[i].quantity}" type="currency" currencySymbol="VND" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5" class="text-end"><strong>Tổng (trước khi giảm giá):</strong></td>
                        <td><strong><fmt:formatNumber value="${orderDetail.totalBeforeDiscount}" type="currency" currencySymbol="VND" groupingUsed="true"/></strong></td>
                    </tr>
                    <tr>
                        <td colspan="5" class="text-end"><strong>Tổng (sau khi giảm giá):</strong></td>
                        <td><strong><fmt:formatNumber value="${orderDetail.order.totalAmount}" type="currency" currencySymbol="VND" groupingUsed="true"/></strong></td>
                    </tr>
                    <tr>
                        <td colspan="5" class="text-end"><strong>Tiền cọc:</strong></td>
                        <td><strong><fmt:formatNumber value="${orderPayment.depositAmount}" type="currency" currencySymbol="VND" groupingUsed="true"/></strong></td>
                    </tr>
                    <tr>
                        <td colspan="5" class="text-end"><strong>Tổng (sau khi cọc 50%):</strong></td>
                        <td><strong><fmt:formatNumber value="${remainingAmount}" type="currency" currencySymbol="VND" groupingUsed="true"/></strong></td>
                    </tr>
                </tfoot>

                <!-- Nút xác nhận đơn hàng, khi nhấn sẽ mở modal -->
                <button type="button" id="confirmOrderBtn" class="btn btn-warning">Xác nhận đơn hàng</button>

            </table>

            <!-- Nút quay về lịch sử đơn hàng -->
            <a href="profileSetting" class="btn btn-success">Quay trở lại </a>
            <!-- Modal yêu cầu thanh toán -->
            <div class="modal fade" id="depositModal" tabindex="-1" role="dialog" aria-labelledby="depositModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="depositModalLabel">Xác Nhận Thanh Toán Cọc</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p id="modalMessage"></p>
                            <!-- Phần tử chứa QR code -->
                            <div id="qrCodeContainer"></div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            <button type="button" class="btn btn-primary" id="confirmPaymentBtn">Xác nhận thanh toán</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="/includes/footer.jsp" %>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Lắng nghe sự kiện click trên nút xác nhận đơn hàng
            document.getElementById('confirmOrderBtn').addEventListener('click', function () {
                const orderIdElement = document.getElementById("order-id"); // Lấy phần tử order-id
                const orderStatusElement = document.querySelector(".badge"); // Lấy phần tử chứa trạng thái đơn hàng

                if (orderStatusElement) {
                    const orderStatus = orderStatusElement.textContent.trim(); // Lấy nội dung trạng thái đơn hàng và loại bỏ dấu cách thừa
                    console.log("Trạng thái đơn hàng:", orderStatus);

                    // Kiểm tra nếu trạng thái đơn hàng đang đóng gói
                    if (orderStatus === 'Đang đóng gói') {
                        alert("📦️ Đơn hàng của bạn đang được đóng gói!");
                        return; // Ngừng thực thi nếu trạng thái là 'Đang đóng gói'
                    }

                    // Kiểm tra nếu trạng thái đơn hàng đã gửi hàng
                    if (orderStatus === 'Đã gửi hàng') {
                        alert("🚚️ Đơn hàng của bạn đã được gửi đi. Bạn không thể xác nhận đơn hàng nữa.");
                        return; // Ngừng thực thi nếu trạng thái là 'Đã gửi hàng'
                    }

                    // Kiểm tra nếu trạng thái đơn hàng chưa xác nhận
                    if (orderStatus !== 'Đã xác nhận') {
                        alert("✅️ Đơn hàng chưa được xác nhận! Bạn không thể xác nhận đơn hàng khi trạng thái chưa xác nhận.");
                        return; // Ngừng thực thi nếu trạng thái không phải 'Đã xác nhận'
                    }
                } else {
                    alert("⚠️ Không tìm thấy trạng thái đơn hàng.");
                    return;
                }

                // Kiểm tra nếu không tìm thấy mã đơn hàng
                if (!orderIdElement) {
                    alert("⚠️ Không tìm thấy mã đơn hàng!");
                    return;
                }

                const orderId = orderIdElement.value; // Lấy giá trị từ input hidden
                console.log("Order ID:", orderId); // Kiểm tra giá trị orderId

                if (!orderId) {
                    alert("⚠️ Không có mã đơn hàng!"); // Nếu orderId rỗng, hiển thị cảnh báo
                    return;
                }

                // Gửi yêu cầu xác nhận đơn hàng tới servlet của Manager
                fetch('/Gr1_Warehouse/confirmOrder', {
                    method: 'POST',
                    body: new URLSearchParams({
                        'orderId': orderId // Truyền orderId vào body của yêu cầu POST
                    })
                })
                        .then(response => response.json()) // Đảm bảo phản hồi trả về dưới dạng JSON
                        .then(data => {
                            console.log("Dữ liệu nhận được từ server:", data);

                            // Xử lý phản hồi thành công
                            if (data.status === "success") {
                                console.log("Xác nhận thành công: ", data.message);
                                document.getElementById('modalMessage').innerText = data.message;

                                // Ẩn phần QR code nếu không cần thiết
                                document.getElementById("qrCodeContainer").style.display = 'none';

                                // Hiển thị modal yêu cầu khách cọc tiền
                                $('#depositModal').modal('show');
                            } else {
                                // Nếu xác nhận thất bại, hiển thị thông báo lỗi
                                console.log("Xác nhận thất bại: ", data.message);
                                document.getElementById('modalMessage').innerText = data.message;
                                $('#depositModal').modal('show');
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert('Có lỗi xảy ra. Vui lòng thử lại sau.');
                        });
            });
        });


        // Xử lý xác nhận thanh toán
        document.getElementById('confirmPaymentBtn').addEventListener('click', function () {

            // Cập nhật trạng thái thanh toán thành "50% deposit" khi nút xác nhận thanh toán được click
            fetch('/Gr1_Warehouse/updatePaymentStatus', {
                method: 'POST',
                body: new URLSearchParams({
                    'orderId': document.getElementById('order-id').value, // Lấy giá trị orderId từ input hidden
                    'status': 'Thanh toán 50%' // Cập nhật trạng thái thanh toán
                })
            })
                    .then(response => response.json()) // Đảm bảo phản hồi trả về dưới dạng JSON
                    .then(data => {
                        // Nếu cập nhật thành công
                        if (data.status === "success") {
                            alert("Thanh toán cọc 50% đã được xác nhận!"); // Thông báo thanh toán thành công
                            $('#depositModal').modal('hide'); // Đóng modal sau khi thanh toán thành công
                            // 🔥 Reload trang sau 1.5 giây để cập nhật trạng thái
                            setTimeout(() => {
                                location.reload();
                            }, 1500);
                        } else {
                            alert("Đã thanh toán 50% giá trị đơn hàng!"); // Hiển thị thông báo
                            $('#depositModal').modal('hide'); // Đóng modal trước khi reload
                            setTimeout(() => {
                                location.reload(); // Reload sau 1.5 giây
                            }, 1500);

                        }
                    })
                    .catch(error => {
                        // Nếu có lỗi xảy ra trong quá trình cập nhật trạng thái
                        alert("Có lỗi xảy ra khi cập nhật trạng thái thanh toán."); // Hiển thị thông báo lỗi
                    });
        });


        document.querySelectorAll('[data-dismiss="modal"]').forEach(function (button) {
            button.addEventListener('click', function () {
                $('#depositModal').modal('hide');
            });
        });
    </script>




    <style>
        .order-detail-container {
            max-width: 900px;
            margin: auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .order-info {
            margin-bottom: 20px;
        }
        .order-items {
            width: 100%;
        }
        .order-items th, .order-items td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .back-btn {
            margin-top: 20px;
        }
    </style>
    <!-- Edit Card End -->
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

    <!-- Wizard js -->
    <script src="${pageContext.request.contextPath}/assets/js/wizard.js"></script>

    <!-- Slick js-->
    <script src="${pageContext.request.contextPath}/assets/js/slick/slick.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/slick/custom_slick.js"></script>

    <!-- Quantity js -->
    <script src="${pageContext.request.contextPath}/assets/js/quantity-2.js"></script>

    <!-- Nav & tab upside js -->
    <script src="${pageContext.request.contextPath}/assets/js/nav-tab.js"></script>

    <!-- script js -->
    <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
</body>