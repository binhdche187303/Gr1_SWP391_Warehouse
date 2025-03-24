<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/8.png" type="image/x-icon">
        <title>Danh sách đơn hàng</title>

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

        <%@ include file="/packing_staff/packing_dashboard.jsp" %>
        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <!-- Page Body Start -->
            <div class="page-body-wrapper">
                <div class="page-body">
                    <div class="container mt-4">
                        <div class="card shadow-sm p-4">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h3>Danh sách đơn hàng</h3>
                            </div>
                            <!-- Button positioned below the table, without overlapping -->
                            <div class="d-flex justify-content-end mt-3">
                                <a href="my-packing-orders" class="btn btn-primary">Đơn hàng của tôi</a>
                            </div><br>
                            <!-- Your table content -->
                            <table class="table table-striped table-bordered">
                                <thead class="table-light">
                                    <tr class="small fw-light">
                                        <th class="small text-center" style="font-size: 12px;">Mã đơn hàng</th>
                                        <th class="small text-center" style="font-size: 12px;">Trạng thái đơn hàng</th>
                                        <th class="small text-center" style="font-size: 12px;">Trạng thái thanh toán</th>
                                        <th class="small text-center" style="font-size: 12px;">Nhân viên đóng gói</th>
                                        <th class="small text-center" style="font-size: 12px;">Hành động</th>
                                    </tr>
                                </thead>
                                <tbody class="text-center">
                                    <c:choose>
                                        <c:when test="${not empty packingOrders}">
                                            <c:forEach var="order" items="${packingOrders}">
                                                <tr class="small text-center order-row" data-assigned="${order.assigned_staff ne null}">
                                                    <td>${order.order_id}</td>
                                                    <td>${order.status}</td>
                                                    <td>${order.payment_status}</td>
                                                    <td class="assigned-staff">
                                                        <c:choose>
                                                            <c:when test="${empty order.assigned_staff}">
                                                                Chưa phân công
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${order.assigned_staff}
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="text-center">
                                                        <c:if test="${empty order.assigned_staff}">
                                                            <form action="assignPackingOrder" method="post" class="d-flex justify-content-center">
                                                                <input type="hidden" name="orderId" value="${order.order_id}">
                                                                <button type="submit" class="btn btn-success btn-sm">Nhận đơn đóng gói</button>
                                                            </form>
                                                        </c:if>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr class="small">
                                                <td colspan="6" class="text-center">Không có đơn hàng nào cần đóng gói.</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>


                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!--                                                                <div class="input-group mb-3">
                                                                    <button id="filterButton" class="btn btn-primary">Lọc đơn chưa nhận</button>
                                                                </div>
                <script>
                    document.getElementById("filterButton").addEventListener("click", function () {
                        document.querySelectorAll(".order-row").forEach(row => {
                            let isAssigned = row.dataset.assigned === "true";
                            if (isAssigned) {
                                row.style.display = (row.style.display === "none") ? "" : "none";
                            }
                        });
                    });
                </script>-->

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

