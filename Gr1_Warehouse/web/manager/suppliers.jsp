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
                                            <h5>All Suppliers</h5>
                                            <form class="d-inline-flex">
                                                <button type="button" class="align-items-center btn btn-theme d-flex" data-bs-toggle="modal" data-bs-target="#addSupplierModal">
                                                    <i data-feather="plus"></i>Add New Supplier
                                                </button>
                                            </form>
                                        </div>


                                        <!-- Modal -->
                                        <!-- Modal thêm nhà cung cấp -->
                                        <div class="modal fade" id="addSupplierModal" tabindex="-1" aria-labelledby="addSupplierModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="addSupplierModalLabel">Thêm Nhà Cung Cấp</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form id="addSupplierForm">
                                                            <div class="mb-3">
                                                                <label for="supplierName" class="form-label">Tên Nhà Cung Cấp</label>
                                                                <input type="text" class="form-control" id="supplierName" name="supplierName" required>
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="phone" class="form-label">Số Điện Thoại</label>
                                                                <input type="text" class="form-control" id="phone" name="phone" >
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="email" class="form-label">Email</label>
                                                                <input type="text" class="form-control" id="email" name="email" >
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="address" class="form-label">Địa Chỉ</label>
                                                                <input type="text" class="form-control" id="address" name="address" >
                                                            </div>
                                                            <button type="submit" class="btn btn-primary">Thêm</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="table-responsive table-product">
                                            <table class="table all-package theme-table" id="table_id">
                                                <thead>
                                                    <tr>
                                                        <th>Tên nhà cung cấp</th>
                                                        <th>Số điện thoại</th>
                                                        <th>Địa chỉ </th>
                                                        <th>Trạng thái</th>
                                                        <th>Tùy chọn</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <c:forEach var="supplier" items="${suppliers}">
                                                        <tr>
                                                            <td>
                                                                <div class="user-name">
                                                                    <span>${supplier.supplierName}</span>
                                                                </div>
                                                            </td>
                                                            <td>${supplier.phone}</td>
                                                            <td>${supplier.address}</td>
                                                            <td class="<c:choose>
                                                                    <c:when test='${supplier.status == "Active"}'>text-success</c:when>
                                                                    <c:otherwise>text-danger</c:otherwise>
                                                                </c:choose>">
                                                                ${supplier.status}
                                                            </td>
                                                            <td>
                                                                <ul>
                                                                    <li>
                                                                        <a href="order-detail.html">
                                                                            <i class="ri-eye-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <form action="/Gr1_Warehouse/editSupplier" method="get">
                                                                            <input class="form-control" type="text" name="supplier_id" value="${supplier.supplierId}" readonly hidden="">
                                                                            <button type="submit" style="background: none; border: none;">
                                                                                <i class="ri-pencil-line"></i>
                                                                            </button>
                                                                        </form>
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
        <script>
//            document.getElementById("addSupplierForm").addEventListener("submit", function (event) {
//                if (!this.checkValidity()) {
//                    event.preventDefault(); 
//
//                    let invalidFields = this.querySelectorAll(":invalid");
//                    invalidFields.forEach(function (field) {
//                        field.classList.add("is-invalid"); 
//                    });
//
//                    alert("Vui lòng nhập đầy đủ và chính xác thông tin."); 
//                } else {
//                    event.preventDefault(); 
//
//                    let formData = new URLSearchParams(new FormData(this));
//
//                    let xhr = new XMLHttpRequest();
//                    xhr.open("POST", "addSupplier", true);
//
//                    xhr.onload = function () {
//                        if (xhr.status === 200) {
//                            let result = xhr.responseText;
//                            console.log("Server response:", result);
//                            if (result === "success") {
//                                alert("Thêm nhà cung cấp thành công!");
//                                location.reload();
//                            } else {
//                                alert("Có lỗi xảy ra: " + result);
//                            }
//                        } else {
//                            alert("Lỗi kết nối: " + xhr.status);
//                        }
//                    };
//                    xhr.send(formData);
//                }
//            });
            document.getElementById("addSupplierForm").addEventListener("submit", function (event) {
                event.preventDefault();

                let isValid = true;

                let invalidFields = this.querySelectorAll(".is-invalid");
                invalidFields.forEach(function (field) {
                    field.classList.remove("is-invalid");
                });

                let phoneField = document.getElementById("phone");
                let phoneValue = phoneField.value;
                if (!/^(\d{10})$/.test(phoneValue)) {
                    phoneField.classList.add("is-invalid");
                    isValid = false;
                    alert("Số điện thoại không hợp lệ. Vui lòng nhập số điện thoại đúng.");
                }

                let emailField = document.getElementById("email");
                let emailValue = emailField.value;
                let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                if (!emailPattern.test(emailValue)) {
                    emailField.classList.add("is-invalid");
                    isValid = false;
                    alert("Email không hợp lệ. Vui lòng nhập email đúng định dạng.");
                }

                let addressField = document.getElementById("address");
                let addressValue = addressField.value;
                if (addressValue.trim() === "") {
                    addressField.classList.add("is-invalid");
                    isValid = false;
                    alert("Địa chỉ không được để trống.");
                }

                if (isValid) {
                    let formData = new URLSearchParams(new FormData(this));

                    let xhr = new XMLHttpRequest();
                    xhr.open("POST", "addSupplier", true);

                    // Xử lý phản hồi từ server
                    xhr.onload = function () {
                        if (xhr.status === 200) {
                            let result = xhr.responseText;
                            console.log("Server response:", result);
                            if (result === "success") {
                                alert("Thêm nhà cung cấp thành công!");
                                location.reload();
                            } else {
                                alert("Có lỗi xảy ra: " + result);
                            }
                        } else {
                            alert("Lỗi kết nối: " + xhr.status);
                        }
                    };
                    xhr.send(formData);
                }
            });

        </script>


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

    </body>

</html>
