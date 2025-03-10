<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hóa Đơn</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container min-vh-100 d-flex justify-content-center align-items-center">
            <div class="invoice-container w-100">
                <div class="invoice-header d-flex justify-content-between align-items-center mb-4">
                    <div>
                        <h1>Fastkart</h1>
                        <p class="text-muted">2345 Đường Tail Ends, ORADELL, New Jersey</p>
                    </div>
                    <div class="text-end">
                        <h2 class="bg-success text-white px-3 py-2 rounded">Hóa Đơn</h2>
                        <p class="text-muted">
                            Ngày phát hành: <fmt:formatDate value="${orderDetail['order_date']}" pattern="dd/MM/yyyy" /><br>
                            Mã hóa đơn: ${orderDetail['order_id']}<br>
                        </p>
                    </div>
                </div>

                <div class="mb-3">
                    <h5><strong>Khách hàng:</strong> ${orderDetail['customer_name']}</h5>
                    <h5><strong>Địa chỉ:</strong> ${orderDetail['shipping_address']}</h5>
                    <h5><strong>Số điện thoại:</strong> ${orderDetail['phone_number']}</h5>
                    <h5><strong>Ghi chú:</strong> ${orderDetail['notes']}</h5>

                </div>

                <table class="table table-bordered text-center">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Sản phẩm</th>
                            <th>SKU</th>
                            <th>Kích thước</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="totalBeforeDiscount" value="0" />
                        <c:forEach var="product" items="${orderDetail['products']}" varStatus="status">
                            <c:set var="productTotal" value="${product['unit_price'] * product['quantity']}" />
                            <c:set var="totalBeforeDiscount" value="${totalBeforeDiscount + productTotal}" />
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>${product['product_name']}</td>
                                <td>${product['sku']}</td>
                                <td>${product['size_name']}</td>
                                <td>${product['quantity']}</td>
                                <td><fmt:formatNumber value="${product['unit_price']}" type="currency" currencySymbol="₫" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="5" class="text-end fw-bold">Tổng (trước khi giảm giá):</td>
                            <td><fmt:formatNumber value="${totalBeforeDiscount}" type="currency" currencySymbol="₫" /></td>
                        </tr>
                        <tr>
                            <td colspan="5" class="text-end fw-bold">Tổng (sau giảm giá):</td>
                            <td>
                                <fmt:formatNumber value="${orderDetail.total_amount}" type="currency" currencySymbol="₫" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5" class="text-end fw-bold">Tiền cọc (50%):</td>
                            <td><fmt:formatNumber value="${orderDetail.total_amount * 0.5}" type="currency" currencySymbol="₫" /></td>
                        </tr>
                        <tr>
                            <td colspan="5" class="text-end fw-bold">Tổng (sau khi cọc 50%):</td>
                            <td><fmt:formatNumber value="${orderDetail.total_amount * 0.5}" type="currency" currencySymbol="₫" /></td>
                        </tr>
                    </tfoot>
                </table>


                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="fw-bold">Thông tin nhân viên đóng gói</h5>
                        <c:choose>
                            <c:when test="${not empty orderDetail.staff_name}">
                                <p class="fw-semibold">Tên: ${orderDetail.staff_name}</p>
                                <ul class="list-unstyled text-muted">
                                    <li>• Mã nhân viên: ${orderDetail.staff_id}</li>
                                    <li>• Ngày đóng gói: ${orderDetail.packed_at}</li>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <p class="text-muted">Không có thông tin nhân viên đóng gói.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="d-flex justify-content-between align-items-center mt-4">
                    <button class="btn btn-dark" onclick="printInvoice()">In hóa đơn</button>
                </div>
            </div>
        </div>

        <script>
            function printInvoice() {
                window.print(); // In hóa đơn
                setTimeout(() => {
                    window.location.href = "http://localhost:8080/Gr1_Warehouse/my-packing-orders";
                }, 2000);
            }
        </script>

        <style>
            body {
                background-color: #f8f9fa;
            }
            .invoice-container {
                max-width: 900px;
                background: #fff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            }
            .invoice-header {
                border-bottom: 2px solid #28a745;
                padding-bottom: 10px;
            }
            .invoice-header h1 {
                font-size: 2rem;
                font-weight: bold;
                color: #28a745;
            }
            .table thead {
                background: #28a745;
                color: white;
            }
            .total-amount {
                font-size: 1.5rem;
                font-weight: bold;
                color: #28a745;
            }
            .btn-print {
                background: #343a40;
                color: white;
                padding: 10px 20px;
                border-radius: 5px;
            }
            body {
                font-size: 18px;
            }
            .invoice-container {
                font-size: 15px; /* Chỉnh theo nhu cầu */
            }
            .invoice-container h1,
            .invoice-container h2,
            .invoice-container h5,
            .invoice-container p,
            .invoice-container table {
                font-size: 15px; /* Có thể đổi thành 12px nếu muốn nhỏ hơn */
            }

        </style>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
