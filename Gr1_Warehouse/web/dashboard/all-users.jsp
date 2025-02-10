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
                                                    <i data-feather="plus"></i>Add New
                                                </a>
                                            </form>
                                        </div>

                                        <div class="table-responsive table-product">
                                            <table class="table all-package theme-table" id="table_id">
                                                <thead>
                                                    <tr>
                                                        <th>User Name</th>
                                                        <th>Full Name</th>
                                                        <th>Phone</th>
                                                        <th>Email</th>
                                                        <th>Address</th>
                                                        <th>Status</th>

                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <c:forEach items="${requestScope.listUser}" var="lu">

                                                        <tr>
                                                            <td>
                                                                ${lu.username}
                                                            </td>
                                                            <td>
                                                                <span>${lu.fullname}</span>
                                                            </td>
                                                            <td>${lu.phone}</td>
                                                            <td>${lu.email}</td>
                                                            <td>${lu.address}</td>
                                                            <td>
                                                                <form action="allusers" method="POST" style="margin: 0">
                                                                    <input type="hidden" name="user_id" value="${lu.userId}">
                                                                    <div class="select-wrapper">
                                                                        <select name="status" onchange="confirmStatusChange(this)" data-original="${lu.status}">
                                                                            <option value="Active" ${lu.status == 'Active' ? 'selected' : ''}>Active</option>
                                                                            <option value="Deactive" ${lu.status == 'Deactive' ? 'selected' : ''}>Deactive</option>
                                                                        </select>
                                                                    </div>
                                                                </form>
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
                    <!-- All User Table Ends-->
                </div>
                <!-- Container-fluid end -->
            </div>
            <!-- Page Body End -->
        </div>



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
        <script src="${pageContext.request.contextPath}/assets2/js/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/custom-data-table.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/checkbox-all-check.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/sidebareffect.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/script.js"></script>


        <script>
                                                                            function confirmStatusChange(selectElement) {
                                                                                if (confirm('Bạn có chắc chắn muốn thay đổi trạng thái của khách hàng?')) {
                                                                                    selectElement.form.submit();
                                                                                } else {
                                                                                    selectElement.value = selectElement.getAttribute('data-original');
                                                                                }
                                                                            }
        </script>
    </body>

</html>