<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="icon" href="${pageContext.request.contextPath}/assets2/images/favicon.png" type="image/x-icon">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets2/images/favicon.png" type="image/x-icon">
        <title>Fastkart - Currency Rate</title>

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

        <!-- Themify icon css -->
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
    </head>

    <body>

        <%@include file="/includes/admin.jsp" %>

        <!-- page-wrapper Start -->
        <div class="page-wrapper compact-wrapper" id="pageWrapper">

            <!-- Page Body Start -->
            <div class="page-body-wrapper">

                <!-- Container-fluid starts-->
                <div class="page-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card card-table">
                                    <!-- Table Start -->
                                    <div class="card-body">
                                        <div class="title-header option-title">
                                            <h5>Role List</h5>
                                            <form class="d-inline-flex">
                                                <a href="create-role.html" class="align-items-center btn btn-theme d-flex">
                                                    <i data-feather="plus"></i>Add Role
                                                </a>
                                            </form>
                                        </div>
                                        <div>
                                            <div class="table-responsive">
                                                <table id="table_id" class="table role-table all-package theme-table">
                                                    <thead>
                                                        <tr>
                                                            <th>No</th>
                                                            <th>Name</th>
                                                            <th>Options</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <c:set var="num" value="0"/>
                                                        <c:forEach items="${requestScope.listRole}" var="lr">
                                                            <tr>
                                                                <c:set var="num" value="${num+1}"/>
                                                                <td>${num}</td>
                                                                <td>${lr.roleName}</td>
                                                                <td>
                                                                    <ul>
                                                                        <li>
                                                                            <a href="javascript:void(0)" 
                                                                               class="edit-role-btn" 
                                                                               data-roleid="${lr.roleId}" 
                                                                               data-rolename="${lr.roleName}" 
                                                                               data-bs-toggle="modal"
                                                                               data-bs-target="#editRoleName">
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
                                    <!-- Table End -->
                                    <c:if test="${not empty requestScope.success}">
                                        <div class="alert alert-success alert-dismissible fade show d-flex align-items-center" style="background-color: #198754; color: white;" role="alert">
                                            <span>${requestScope.success}</span>
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Container-fluid Ends-->
                </div>
            </div>
            <!-- Page Body End -->

        </div>
        <!-- page-wrapper End-->

        <!-- Edit Profile Modal Start -->
        <!-- Modal chỉnh sửa -->
        <div class="modal fade theme-modal" id="editRoleName" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Edit Role Name</h5>
                    </div>
                    <div class="modal-body">
                        <form action="role" method="POST">
                            <!-- Hidden input lưu roleId -->
                            <input type="hidden" name="roleId"/>

                            <!-- Input chỉnh sửa roleName -->
                            <div class="form-floating mb-4 theme-form-floating">
                                <input type="text" class="form-control" id="roleName" name="roleName" placeholder="Enter RoleName" required />
                                <label for="roleName">RoleName</label>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary btn-md" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn theme-bg-color btn-md text-white">Save changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit Profile Modal End -->

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

        <!-- customizer js -->
        <script src="${pageContext.request.contextPath}/assets2/js/customizer.js"></script>

        <!-- Sidebar js -->
        <script src="${pageContext.request.contextPath}/assets2/js/config.js"></script>

        <!-- Plugins js -->
        <script src="${pageContext.request.contextPath}/assets2/js/sidebar-menu.js"></script>
    <!--    <script src="${pageContext.request.contextPath}/assets2/js/notify/bootstrap-notify.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/notify/index.js"></script>-->

        <!-- Data table js -->
        <script src="${pageContext.request.contextPath}/assets2/js/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/custom-data-table.js"></script>

        <!-- all checkbox select js -->
        <script src="${pageContext.request.contextPath}/assets2/js/checkbox-all-check.js"></script>

        <!-- sidebar effect -->
        <script src="${pageContext.request.contextPath}/assets2/js/sidebareffect.js"></script>

        <!-- Theme js -->
        <script src="${pageContext.request.contextPath}/assets2/js/script.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Lấy tất cả các nút "Edit"
                const editButtons = document.querySelectorAll(".edit-role-btn");

                editButtons.forEach(button => {
                    button.addEventListener("click", function () {
                        // Lấy roleId và roleName từ thuộc tính data của nút
                        const roleId = this.getAttribute("data-roleid");
                        const roleName = this.getAttribute("data-rolename");

                        // Gán giá trị vào modal
                        document.querySelector("#editRoleName input[name='roleId']").value = roleId;
                        document.querySelector("#editRoleName input[name='roleName']").value = roleName;
                    });
                });
            });
        </script>

    </body>

</html>