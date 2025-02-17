<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en" >

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description"
              content="Fastkart admin is super flexible, powerful, clean &amp; modern responsive bootstrap 5 admin template with unlimited possibilities.">
        <meta name="keywords"
              content="admin template, Fastkart admin template, dashboard template, flat admin template, responsive admin template, web app">
        <meta name="author" content="pixelstrap">
        <link rel="icon" href="${pageContext.request.contextPath}/assets2/images/favicon.png" type="image/x-icon">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets2/images/favicon.png" type="image/x-icon">
        <title>Fastkart - All User</title>
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

        <!-- Data Table css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/datatables.css">

        <!-- Themify icon css-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/themify.css">

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
            /* Bọc select trong một wrapper */
            .select-wrapper {
                position: relative;
                display: inline-block;
                width: 120px; /* Điều chỉnh chiều rộng theo nhu cầu */
            }

            /* Tạo style cho select */
            .select-wrapper select {
                appearance: none;
                -webkit-appearance: none;
                -moz-appearance: none;
                background-color: #fff;
                border: 2px solid #007bff;
                border-radius: 8px;
                padding: 10px 35px 10px 15px;
                font-size: 14px;
                font-weight: 500;
                cursor: pointer;
                width: 100%;
                transition: all 0.3s ease;
            }

            /* Khi select được focus */
            .select-wrapper select:focus {
                outline: none;
                border-color: #0056b3;
                box-shadow: 0 0 8px rgba(0, 123, 255, 0.5);
            }

            /* Ẩn mũi tên mặc định */
            .select-wrapper select::-ms-expand {
                display: none;
            }

            /* Icon mũi tên tùy chỉnh */
            .select-wrapper::after {
                content: '\25BC'; /* Unicode icon cho mũi tên xuống */
                position: absolute;
                top: 50%;
                right: 10px;
                transform: translateY(-50%);
                pointer-events: none;
                color: #007bff;
                font-size: 14px;
            }

            /* Tạo hiệu ứng hover */
            .select-wrapper select:hover {
                background-color: #f8f9fa;
            }

            /* Tùy chỉnh option */
            .select-wrapper select option {
                padding: 10px;
            }
        </style>
    </head>

    <body
        <%@include file="/includes/admin.jsp" %>
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
                                            <h5>All Users</h5>
                                            <form class="d-inline-flex">
                                                <a href="add-new-user.html" class="align-items-center btn btn-theme d-flex">
                                                    <i data-feather="plus"></i>Thêm nhân viên
                                                </a>
                                            </form>
                                        </div>
                                        <div class="table-responsive table-product">
                                            <table class="table all-package theme-table" id="table_id">
                                                <thead>
                                                    <tr>
                                                        <th>User Name</th>
                                                        <th>Full Name</th>
                                                        <th>Role Name</th>
                                                        <th>Phone</th>
                                                        <th>Email</th>
                                                        <th>Address</th>
                                                        <th>Status</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <c:forEach items="${requestScope.listStaff}" var="ls">

                                                        <tr>
                                                            <td>
                                                                ${ls.username}
                                                            </td>
                                                            <td>
                                                                <span>${ls.fullname}</span>
                                                            </td>
                                                            <td>${ls.role.roleName}</td>

                                                            <td>${ls.phone}</td>
                                                            <td>${ls.email}</td>
                                                            <td>${ls.address}</td>
                                                            <td class="<c:choose>
                                                                    <c:when test='${ls.status == "Active"}'>text-success</c:when>
                                                                    <c:otherwise>text-danger</c:otherwise>
                                                                </c:choose>">
                                                                ${ls.status}
                                                            </td>
                                                            <td>  
                                                                <ul>
                                                                    <li>
                                                                        <a href="javascript:void(0)" 
                                                                           class="edit-staff"
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
                                                    </c:forEach >
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <form class="d-inline-flex">
                        <a href="add-new-user.html" class="align-items-center btn btn-theme d-flex">
                            <i data-feather="plus"></i>Xuất file nhân viên
                        </a>
                    </form>
                    <!-- All User Table Ends-->
                </div>

                <!-- Container-fluid end -->
            </div>
            <!-- Page Body End -->
        </div>

        <!-- Edit Staff Modal -->
        <div class="modal fade theme-modal" id="edit-staff" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="edit-staff">Edit Discount</h5>
                    </div>
                    <div class="modal-body">
                        <form action="couponlist" method="POST">
                            <input type="hidden" name="discount_id" value="" />

                            <!-- Discount Code -->
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="discount_code" name="discount_code" value="" readonly />
                                <label for="discount_code">Coupon Code</label>
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
                                <label for="discount_percentage">Discount (%)</label>
                            </div>  

                            <!-- Start Date & End Date cùng hàng -->
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input type="date" class="form-control" id="start_date" name="start_date" value="" required readonly />
                                        <label for="start_date">Start Date</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input type="date" class="form-control" id="end_date" name="end_date" value="" required readonly />
                                        <label for="end_date">End Date</label>
                                    </div>
                                </div>
                            </div>

                            <!-- Quantity -->
                            <div class="form-floating mb-3">
                                <input type="number" class="form-control" id="max_uses" name="max_uses" value="" />
                                <label for="max_uses">Quantity</label>
                            </div>

                            <!-- Status -->
                            <div class="mb-3">
                                <label for="status" class="form-label">Status</label>
                                <select id="status" name="status" class="form-select">
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>

                            <!-- Modal Footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit Staff Modal End -->


        <script src="${pageContext.request.contextPath}/assets2/js/jquery-3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/bootstrap/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/icons/feather-icon/feather.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/icons/feather-icon/feather-icon.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/scrollbar/simplebar.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/scrollbar/custom.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/customizer.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/config.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/sidebar-menu.js"></script>
<!--        <script src="${pageContext.request.contextPath}/assets2/js/notify/bootstrap-notify.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/notify/index.js"></script>-->
<!--        <script src="${pageContext.request.contextPath}/assets2/js/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/custom-data-table.js"></script>-->
        <script src="${pageContext.request.contextPath}/assets2/js/checkbox-all-check.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/sidebareffect.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/script.js"></script>


        <script>

            $(document).on("click", ".edit-staff", function () {
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

                $("#edit-staff").modal("show");
            });
        </script>
    </body>

</html>