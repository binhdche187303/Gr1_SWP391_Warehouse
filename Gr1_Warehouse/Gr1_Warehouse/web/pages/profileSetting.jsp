<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        <%@include file="/includes/header.jsp" %> <!-- Nhúng header -->

        <!-- User Dashboard Section Start -->
        <section class="user-dashboard-section section-b-space">
            <div class="container-fluid-lg">
                <div class="row">
                    <div class="col-xxl-3 col-lg-4">
                        <div class="dashboard-left-sidebar">
                            <div class="close-button d-flex d-lg-none">
                                <button class="close-sidebar">
                                    <i class="fa-solid fa-xmark"></i>
                                </button>
                            </div>
                            <div class="profile-box">
                                <div class="cover-image">
                                    <img src="${pageContext.request.contextPath}/assets/images/inner-page/cover-img.jpg" class="img-fluid blur-up lazyload" alt="" />
                                </div>

                                <div class="profile-contain">
                                    <div class="profile-name">
                                        <h3>${sessionScope.acc.fullname}</h3> 
                                        <h6 class="text-content">${sessionScope.acc.email}</h6>
                                    </div>
                                </div>
                            </div>

                            <ul class="nav nav-pills user-nav-pills" id="pills-tab" role="tablist">

                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-dashboard-tab" data-bs-toggle="pill" data-bs-target="#pills-dashboard" type="button" role="tab" aria-controls="pills-dashboard" aria-selected="false"><i data-feather="home">                                        
                                        </i> Bảng điều khiển</button>

                                </li>

                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-order-tab" data-bs-toggle="pill" data-bs-target="#pills-order"
                                            type="button" role="tab" aria-controls="pills-order" aria-selected="true"
                                            onclick="loadOrders()">
                                        <i data-feather="shopping-bag"></i> Đơn hàng
                                    </button>
                                </li>
                                <li class="nav-item active" role="presentation"><button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false"><i data-feather="user">
                                        </i> Hồ sơ</button>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-xxl-9 col-lg-8">
                        <div class="dashboard-right-sidebar">
                            <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade" id="pills-dashboard" role="tabpanel" aria-labelledby="pills-dashboard-tab">
                                    <div class="dashboard-home">
                                        <div class="title">
                                            <h2>Bảng điều khiển</h2>
                                            <span class="title-leaf">
                                                <svg class="icon-width bg-gray">
                                                <use xlink:href="${pageContext.request.contextPath}/assets/svg/leaf.svg#leaf"></use>
                                                </svg>
                                            </span>
                                        </div>

                                        <div class="dashboard-user-name">
                                            <h6 class="text-content">
                                                Xin chào, <b class="text-title">${sessionScope.acc.fullname}</b>
                                            </h6>
                                            <p class="text-content"> 
                                                Từ bảng điều khiển của tôi, bạn có thể xem ảnh chụp nhanh về hoạt động tài 
                                                khoản gần đây của mình và cập nhật thông tin tài khoản. 
                                                Chọn liên kết bên dưới để xem hoặc chỉnh sửa thông tin.</p>
                                        </div>

                                        <div class="total-box">
                                            <div class="row g-sm-4 g-3">
                                                <div class="col-xxl-6 col-lg-6 col-md-4 col-sm-6">
                                                    <div class="totle-contain">
                                                        <img src="${pageContext.request.contextPath}/assets/images/svg/order.svg" class="blur-up lazyload" alt="" />
                                                        <div class="totle-detail">
                                                            <h5>Tổng đơn đặt hàng</h5>
                                                            <h3>3658</h3>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-xxl-6 col-lg-6 col-md-4 col-sm-6">
                                                    <div class="totle-contain">
                                                        <img src="${pageContext.request.contextPath}/assets/images/svg/pending.svg" class="blur-up lazyload" alt="" />
                                                        <div class="totle-detail">
                                                            <h5>Tổng đơn chờ xử lí</h5>
                                                            <h3>254</h3>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="tab-pane fade show" id="pills-order" role="tabpanel" aria-labelledby="pills-order-tab">
                                    <div class="dashboard-order">
                                        <div class="title">
                                            <h2 style="margin-bottom: 20px;">Lịch sử đơn hàng của tôi</h2>
                                            <span class="title-leaf">
                                                <svg class="icon-width bg-gray">
                                                <use xlink:href="${pageContext.request.contextPath}/assets/svg/leaf.svg#leaf"></use>
                                                </svg>
                                            </span>
                                        </div>

                                        <div id="pills-order-content">
                                            <!-- Dữ liệu đơn hàng sẽ được hiển thị ở đây -->
                                        </div>
                                    </div>
                                </div>
                                <div
                                    class="tab-pane fade show active"
                                    id="pills-profile"
                                    role="tabpanel"
                                    aria-labelledby="pills-profile-tab"
                                    >
                                    <div class="dashboard-profile">
                                        <div class="title">
                                            <h2>Hồ sơ của tôi</h2>
                                            <span class="title-leaf">
                                                <svg class="icon-width bg-gray">
                                                <use xlink:href="../assets/svg/leaf.svg#leaf"></use>
                                                </svg>
                                            </span>
                                        </div>

                                        <div class="profile-detail dashboard-bg-box">
                                            <div class="dashboard-title">
                                                <h3>Tên hồ sơ</h3>
                                            </div>
                                            <div class="profile-name-detail">
                                                <div class="d-sm-flex align-items-center d-block">

                                                    <h3>${sessionScope.acc.fullname}</h3>

                                                </div>
                                            </div>

                                            <div class="location-profile">
                                                <ul>
                                                    <li>
                                                        <div class="location-box">
                                                            <i data-feather="mail"></i>
                                                            <h6>${sessionScope.acc.email}</h6>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>

                                        <div class="profile-about dashboard-bg-box">
                                            <div class="row">
                                                <div class="col-xxl-7">
                                                    <div class="dashboard-title mb-3">
                                                        <h3>Hồ sơ Giới thiệu</h3>
                                                    </div>

                                                    <div class="table-responsive">
                                                        <table class="table">
                                                            <tbody>
                                                                <tr>
                                                                    <td>Tên người dùng:</td>
                                                                    <td>${sessionScope.acc.username}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Họ và tên:</td>
                                                                    <td>${sessionScope.acc.fullname}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Số điện thoại :</td>
                                                                    <td>
                                                                        <a href="javascript:void(0)">
                                                                            ${sessionScope.acc.phone}</a
                                                                        >
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Địa chỉ :</td>
                                                                    <td>${sessionScope.acc.address}</td>
                                                                </tr>
                                                                <tr>

                                                                    <td>
                                                                        <a href="javascript:void(0)">
                                                                            <span data-bs-toggle="modal" data-bs-target="#edit-profile">Chỉnh sửa hồ sơ</span>
                                                                        </a>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <c:if test="${not empty requestScope.successprofile}">
                                                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                                                ${requestScope.successprofile}
                                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                            </div>
                                                        </c:if>
                                                    </div>



                                                    <div class="dashboard-title mb-3">
                                                        <h3>Chi tiết đăng nhập</h3>
                                                    </div>

                                                    <div class="table-responsive">
                                                        <table class="table">
                                                            <tbody>
                                                                <tr>
                                                                    <td>Email :</td>
                                                                    <td>
                                                                        <a href="javascript:void(0)">${sessionScope.acc.email}</a>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Mật khẩu :</td>
                                                                    <td>
                                                                        <a href="javascript:void(0)">
                                                                            ****** 
                                                                            <span data-bs-toggle="modal" data-bs-target="#edit-password">Chỉnh sửa</span>
                                                                        </a>
                                                                    </td>

                                                                </tr>
                                                            </tbody>
                                                        </table>

                                                    </div>
                                                </div>

                                                <!-- Edit Password Modal Start -->
                                                <div class="modal fade theme-modal" id="edit-password" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Đổi mật khẩu</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                                    <i class="fa-solid fa-xmark"></i>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form action="changepassword" method="POST">
                                                                    <input type="hidden" name="userId" value="${sessionScope.acc.userId}" />

                                                                    <!-- Old Password -->
                                                                    <div class="form-floating mb-4 theme-form-floating">
                                                                        <input type="password" class="form-control" id="currentpassword" name="currentpassword" placeholder="Enter Current Password" required />
                                                                        <label for="oldpass">Mật khẩu cũ</label>
                                                                    </div>

                                                                    <!-- New Password -->
                                                                    <div class="form-floating mb-4 theme-form-floating">
                                                                        <input type="password" class="form-control" id="newpassword" name="newpassword" placeholder="Enter New Password" required />
                                                                        <label for="newpass">Mật khẩu mới</label>
                                                                    </div>

                                                                    <!-- Confirm New Password -->
                                                                    <div class="form-floating mb-4 theme-form-floating">
                                                                        <input type="password" class="form-control" id="confirmpassword" name="confirmpassword" placeholder="Confirm New Password" required />
                                                                        <label for="confirmpass">Xác nhận mật khẩu mới</label>
                                                                    </div>
                                                                    <%
    String error = (String) request.getAttribute("error");
    String success = (String) request.getAttribute("success");
                                                                    %>

                                                                    <% if (error != null) { %>
                                                                    <div class="alert alert-danger" role="alert">
                                                                        <%= error %>
                                                                    </div>
                                                                    <% } %>

                                                                    <% if (success != null) { %>
                                                                    <div class="alert alert-success" role="alert">
                                                                        <%= success %>
                                                                    </div>
                                                                    <% } %>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary btn-md" data-bs-dismiss="modal">Close</button>
                                                                        <button type="submit" class="btn theme-bg-color btn-md text-white">Save changes</button>
                                                                    </div>
                                                                </form>



                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Edit Password Modal End -->

                                                <!-- Edit Profile Modal Start -->
                                                <div class="modal fade theme-modal" id="edit-profile" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Thay đổi hồ sơ</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                                    <i class="fa-solid fa-xmark"></i>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form action="changeprofile" method="POST">
                                                                    <input type="hidden" name="userId" value="${sessionScope.acc.userId}" />

                                                                    <!-- FullName -->
                                                                    <div class="form-floating mb-4 theme-form-floating">
                                                                        <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Enter FullName" value="${sessionScope.acc.fullname}" required />
                                                                        <label for="fullname">Họ và tên:</label>
                                                                    </div>

                                                                    <!-- PhoneNumber -->
                                                                    <div class="form-floating mb-4 theme-form-floating">
                                                                        <input type="number" class="form-control" id="phone" name="phone" placeholder="Enter Phone" value="${sessionScope.acc.phone}" required />
                                                                        <label for="phone">Số điện thoại:</label>
                                                                    </div>

                                                                    <!-- Address -->
                                                                    <div class="form-floating mb-4 theme-form-floating">
                                                                        <input type="text" class="form-control" id="address" name="address" placeholder="Enter address" value="${sessionScope.acc.address}" required />
                                                                        <label for="address">Địa chỉ: </label>
                                                                    </div>

                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary btn-md" data-bs-dismiss="modal">Đóng</button>
                                                                        <button type="submit" class="btn theme-bg-color btn-md text-white">Lưu</button>
                                                                    </div>

                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Edit Profile Modal End -->

                                                <div class="col-xxl-5">
                                                    <div class="profile-image">
                                                        <img
                                                            src="${pageContext.request.contextPath}/assets/images/inner-page/dashboard-profile.png"
                                                            class="img-fluid blur-up lazyload"
                                                            alt=""
                                                            />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- User Dashboard Section End -->

        <!-- Tap to top start -->
        <div class="theme-option">
            <div class="back-to-top">
                <a id="back-to-top" href="#">
                    <i class="fas fa-chevron-up"></i>
                </a>
            </div>
        </div>
        <!-- Tap to top end -->

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
        <style>
            .order-contain {
                margin-bottom: 30px; /* Tạo khoảng cách giữa các đơn hàng */
            }

            .order-box {
                width: 100%;
                max-width: 1200px; /* Giới hạn chiều rộng để không bị quá lớn */
                padding: 20px;
                border-radius: 10px;
                background-color: #f8f9fa;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            }

            .order-container {
                display: flex;
                align-items: center;
                gap: 20px;
            }

            .order-icon i {
                font-size: 40px;
                color: #ff8c00;
            }

            .order-detail {
                flex-grow: 1;
            }

            .order-footer {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 15px;
            }

            .order-footer h5 {
                font-size: 18px;
                color: #333;
            }

            .btn-primary {
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 5px;
            }
        </style>


        <script>
                                                function loadOrders() {
                                                    console.log("📌 Fetching order data...");
                                                    fetch('/Gr1_Warehouse/customer-order')
                                                            .then(function (response) {
                                                                if (!response.ok) {
                                                                    throw new Error("Server returned " + response.status);
                                                                }
                                                                return response.json(); // ✅ Chuyển đổi phản hồi thành JSON
                                                            })
                                                            .then(function (orderList) {
                                                                console.log("✅ Orders received:", orderList);

                                                                // Sắp xếp đơn hàng theo ngày (mới nhất lên đầu)
                                                                orderList.sort(function (a, b) {
                                                                    var dateA = new Date(a.order.orderDate);
                                                                    var dateB = new Date(b.order.orderDate);
                                                                    return dateB - dateA; // Sắp xếp giảm dần
                                                                });
                                                                
                                                                var orderHTML = "";
                                                                if (orderList.length === 0) {
                                                                    orderHTML = "<p class='text-danger'>🚨 Bạn chưa có đơn hàng nào!</p>";
                                                                } else {
                                                                    orderList.forEach(function (orderDetail) {
                                                                        var order = orderDetail.order;

                                                                        // ✅ Chuyển đổi timestamp thành ngày tháng chuẩn
                                                                        var formattedDate = new Date(order.orderDate).toLocaleString('vi-VN', {
                                                                            day: '2-digit', month: '2-digit', year: 'numeric',
                                                                            hour: '2-digit', minute: '2-digit'
                                                                        });

                                                                        // ✅ Nối chuỗi bằng cách sử dụng dấu `+`
                                                                        orderHTML += "<div class='order-contain'>" +
                                                                                "<div class='order-box dashboard-bg-box'>" +
                                                                                "<div class='order-container'>" +
                                                                                "<div class='order-icon'><i data-feather='box'></i></div>" +
                                                                                "<div class='order-detail'>" +
                                                                                "<h4>Mã đơn hàng: <span>#" + order.orderId + "</span></h4>" +
                                                                                "<h6 class='text-content'>Ngày đặt hàng: " + formattedDate + "</h6>" +
                                                                                "<h6 class='text-content'>Trạng thái đơn hàng: <span class='badge bg-warning'>" + order.status + "</span></h6>" +
                                                                                "<h6 class='text-content'>Tổng: " + order.totalAmount.toLocaleString('vi-VN') + " VND</h6>" +
                                                                                "</div>" +
                                                                                "</div>" +
                                                                                "<div class='order-footer d-flex justify-content-end'>" +
                                                                                "<a href='customerOrderDetail?orderId=" + order.orderId + "' class='btn btn-primary'>View Details</a>" +
                                                                                "</div>" +
                                                                                "</div>" +
                                                                                "</div>";
                                                                    });
                                                                }
                                                                document.getElementById('pills-order-content').innerHTML = orderHTML;
                                                            })
                                                            .catch(function (error) {
                                                                console.error("❌ Error loading orders:", error);
                                                            });
                                                }

        </script>

        <script>
            // Kiểm tra xem có thông báo error hoặc success không
            <% if (error != null || success != null) { %>
            // Tự động mở modal edit-password
            $(document).ready(function () {
                $('#edit-password').modal('show');
            });
            <% } %>
        </script>

        <%@ include file="/includes/footer.jsp" %> <!-- Nhúng footer -->
    </body>
