<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/8.png" type="image/x-icon">
        <title>Thêm nhân viên</title>

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
            /* Định dạng container phân trang */
            .dataTables_paginate {
                padding: 15px 0;
                text-align: center !important;
                margin-top: 15px !important;
                width: 100%;
            }

            /* Định dạng các nút phân trang */
            .dataTables_paginate .paginate_button {
                padding: 8px 14px !important;
                margin: 0 3px !important;
                border: 1px solid #e0e0e0 !important;
                background: #ffffff !important;
                border-radius: 4px !important;
                color: #333 !important;
                cursor: pointer;
                transition: all 0.3s ease;
                display: inline-block;
                text-decoration: none !important;
            }

            /* Hiệu ứng hover trên nút phân trang */
            .dataTables_paginate .paginate_button:hover {
                background: #f5f5f5 !important;
                border-color: #ccc !important;
                color: #000 !important;
            }

            /* Định dạng nút trang đang được chọn */
            .dataTables_paginate .paginate_button.current {
                background: #0d6efd !important;
                border-color: #0d6efd !important;
                color: white !important;
                font-weight: bold;
            }

            /* Hiệu ứng hover trên nút trang đang được chọn */
            .dataTables_paginate .paginate_button.current:hover {
                background: #0b5ed7 !important;
                border-color: #0a58ca !important;
            }

            /* Định dạng nút bị vô hiệu hóa */
            .dataTables_paginate .paginate_button.disabled {
                color: #aaa !important;
                border-color: #e0e0e0 !important;
                background: #f5f5f5 !important;
                cursor: not-allowed;
            }

            /* Định dạng thông tin phân trang "Hiển thị x đến y của z bản ghi" */
            .dataTables_info {
                padding: 15px 0;
                text-align: center;
                color: #666;
                font-style: italic;
                margin-top: 10px;
                width: 100%;
            }

            /* Căn chỉnh số trang giữa dòng */
            .dataTables_wrapper .row:last-child {
                justify-content: center;
                align-items: center;
            }
        </style>
    </head>
    <body>

        <%@include file="/includes/admin.jsp" %>
        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <!-- Page Body Start -->
            <div class="page-body-wrapper">
                <!-- Container-fluid starts-->
                <div class="page-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="title-header option-title">
                                                    <h5>Tạo tài khoản nhân viên mới</h5>
                                                    <a href="/Gr1_Warehouse/allstaff" class="btn btn-primary btn-lg shadow-sm">
                                                        <i class=""></i>Danh sách nhân viên
                                                    </a>
                                                </div>
                                                <div class="tab-content" id="pills-tabContent">
                                                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel">
                                                        <form class="theme-form theme-form-2 mega-form" action="createstaff" method="post">
                                                            <div class="row">
                                                                <div class="mb-4 row align-items-center">
                                                                    <label class="col-lg-2 col-md-3 col-form-label form-label-title">Tên tài khoản</label>
                                                                    <div class="col-md-9 col-lg-10">
                                                                        <input class="form-control" type="text" name="username" required value="${requestScope.username}">
                                                                    </div>
                                                                </div>

                                                                <div class="mb-4 row align-items-center">
                                                                    <label class="col-lg-2 col-md-3 col-form-label form-label-title">Email</label>
                                                                    <div class="col-md-9 col-lg-10">
                                                                        <input class="form-control" type="email" name="email" required value="${requestScope.email}" 
                                                                               pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" 
                                                                               title="Vui lòng nhập đúng định dạng email (ví dụ: example@domain.com)">
                                                                    </div>
                                                                </div>

                                                                <div class="mb-4 row align-items-center">
                                                                    <label class="col-lg-2 col-md-3 col-form-label form-label-title">Vai trò</label>
                                                                    <div class="col-md-9 col-lg-10">
                                                                        <select id="roleId" name="roleId" class="form-select" >
                                                                            <c:forEach items="${requestScope.listRoles}" var="lr">
                                                                                <option value="${lr.roleId}" ${requestScope.roleId == lr.roleId ? 'selected' : ''}>${lr.roleName}</option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </div>

                                                                <div class="mb-4 row align-items-center">
                                                                    <div class="col-lg-2 col-md-3"></div>
                                                                    <div class="col-md-9 col-lg-10">
                                                                        <button type="submit" class="btn btn-primary">Gửi</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>

                                                        <c:if test="${not empty requestScope.message}">
                                                            <div class="alert alert-dismissible fade show" 
                                                                 role="alert" 
                                                                 style="background-color: red; color: white; border: 1px solid darkred; font-weight: bold;">
                                                                ${requestScope.message}
                                                                <button stype="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" style="filter: invert(1);"></button>
                                                            </div>
                                                        </c:if>
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
        </div>

        <script>
            document.querySelector("input[name='email']").addEventListener("input", function () {
                var emailInput = this;
                var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

                if (!emailRegex.test(emailInput.value)) {
                    emailInput.setCustomValidity("Email không hợp lệ! Vui lòng nhập đúng định dạng (ví dụ: example@gmail.com)");
                } else {
                    emailInput.setCustomValidity("");
                }
            });
        </script>

        <script src="${pageContext.request.contextPath}/assets2/js/jquery-3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/bootstrap/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/icons/feather-icon/feather.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/icons/feather-icon/feather-icon.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/scrollbar/simplebar.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/scrollbar/custom.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/config.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/sidebar-menu.js"></script>
<!--        <script src="${pageContext.request.contextPath}/assets2/js/notify/bootstrap-notify.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/notify/index.js"></script>-->
        <script src="${pageContext.request.contextPath}/assets2/js/jquery.dataTables.js"></script>
<!--        <script src="${pageContext.request.contextPath}/assets2/js/custom-data-table.js"></script>-->
        <script src="${pageContext.request.contextPath}/assets2/js/checkbox-all-check.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/script.js"></script>
    </body>

</html>