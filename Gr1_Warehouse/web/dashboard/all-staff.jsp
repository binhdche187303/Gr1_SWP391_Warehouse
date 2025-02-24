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
                                        <div class="title-header option-title d-flex justify-content-between align-items-center">
                                            <h5>All Staff</h5>
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
                                                                           data-id="${ls.userId}" 
                                                                           data-username=" ${ls.username}" 
                                                                           data-fullname="${ls.fullname}" 
                                                                           data-roleid="${ls.role.roleId}" 
                                                                           data-rolename="${ls.role.roleName}" 
                                                                           data-phone="${ls.phone}" 
                                                                           data-email="${ls.email}" 
                                                                           data-address="${ls.address}" 
                                                                           data-status="${ls.status}">
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
                    <!-- Bọc hai form trong một div có class d-flex justify-content-end -->
                    <div class="d-flex justify-content-end gap-3 mt-3">
                        <!-- Button xuất file nhân viên -->
                        <form action="addstaff" method="post" enctype="multipart/form-data" 
                              class="d-flex align-items-center bg-light p-2 rounded shadow-sm" style="max-width: 400px;">
                            <div class="input-group">
                                <input type="file" class="form-control" id="excelFile" name="excelFile" accept=".xlsx, .xls">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-upload"></i> Tải lên
                                </button>
                            </div>
                        </form>
                        <!-- Button xuất file nhân viên -->
                        <form class="d-inline-flex">
                            <a href="exportstaff" class="align-items-center btn btn-theme d-flex">
                                <i data-feather="download"></i> Xuất file nhân viên
                            </a>
                        </form>
                    </div>

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
                        <h5 class="modal-title">Edit Staff</h5>
                    </div>
                    <div class="modal-body">
                        <form action="allstaff" method="POST">
                            <input type="hidden" id="user_id" name="user_id" />
                            <!-- Username -->
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="username" name="username" readonly />
                                <label for="username">Username</label>
                            </div>

                            <!-- Full Name -->
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="fullname" name="fullname" readonly required />
                                <label for="fullname">Full Name</label>
                            </div>

                            <!-- Role Name -->
                            <div class="form-floating mb-3"> 
                                <select id="rolename" name="rolename" class="form-select">
                                    <c:forEach items="${requestScope.listRole}" var="lr">
                                        <c:if test="${lr.roleId != 1 && lr.roleId != 2}">
                                            <option value="${lr.roleId}">${lr.roleName}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                                <label for="rolename">Role Name</label>
                            </div>

                            <!-- Phone -->
                            <div class="form-floating mb-3">
                                <input type="tel" class="form-control" id="phone" name="phone" readonly required />
                                <label for="phone">Phone</label>
                            </div>

                            <!-- Email -->
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" id="email" name="email" readonly required />
                                <label for="email">Email</label>
                            </div>

                            <!-- Address -->
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="address" name="address" readonly required />
                                <label for="address">Address</label>
                            </div>

                            <!-- Status -->
                            <div class="mb-3">
                                <label for="status" class="form-label">Status</label>
                                <select id="status" name="status" class="form-select">
                                    <option value="Active">Active</option>
                                    <option value="Deactive">Inactive</option>
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
                // Get data from clicked element
                var id = $(this).data("id");
                var username = $(this).data("username");
                var fullname = $(this).data("fullname");
                var roleid = $(this).data("roleid");
                var rolename = $(this).data("rolename");
                var phone = $(this).data("phone");
                var email = $(this).data("email");
                var address = $(this).data("address");
                var status = $(this).data("status");

                // Populate modal fields
                $("#edit-staff input[name='user_id']").val(id);
                $("#edit-staff input[name='username']").val(username);
                $("#edit-staff input[name='fullname']").val(fullname);
                $("#edit-staff select[name='rolename']").val(roleid);
                $("#edit-staff input[name='rolename']").val(rolename);
                $("#edit-staff input[name='phone']").val(phone);
                $("#edit-staff input[name='email']").val(email);
                $("#edit-staff input[name='address']").val(address);
                $("#edit-staff select[name='status']").val(status);

                // Show the modal
                $("#edit-staff").modal("show");
            });
        </script>
    </body>

</html>