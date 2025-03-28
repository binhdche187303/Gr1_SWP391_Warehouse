<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/8.png" type="image/x-icon">
        <title>Phân quyền</title>

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
                                            <h5>Danh sách vai trò</h5>
                                        </div>
                                        <div>
                                            <div class="table-responsive">
                                                <table id="table_id" class="table role-table all-package theme-table">
                                                    <thead>
                                                        <tr>
                                                            <th>STT</th>
                                                            <th>Tên</th>
                                                            <th>Hành động</th>
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
                                                                               >
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
                        <h5 class="modal-title" id="exampleModalLabel">Sửa tên vai trò</h5>
                    </div>
                    <div class="modal-body">


                        <form action="role" method="POST">
                            <!-- Hidden input lưu roleId -->
                            <input type="hidden" name="roleId" value="${roleId}" />

                            <!-- Input chỉnh sửa roleName -->
                            <div class="form-floating mb-4 theme-form-floating">
                                <input type="text" class="form-control" id="roleName" name="roleName" 
                                       placeholder="Enter RoleName" value="${roleName}" required />
                                <label for="roleName">Tên vai trò</label>
                            </div>
                            <!-- Hiển thị thông báo lỗi nếu có -->
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger" style="background-color: red">${error}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            </c:if>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary btn-md" data-bs-dismiss="modal">Đóng</button>
                                <button type="submit" class="btn theme-bg-color btn-md text-white">Lưu thay đổi</button>
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
        <!--<script src="${pageContext.request.contextPath}/assets2/js/customizer.js"></script>-->

        <!-- Sidebar js -->
        <script src="${pageContext.request.contextPath}/assets2/js/config.js"></script>

        <!-- Plugins js -->
        <script src="${pageContext.request.contextPath}/assets2/js/sidebar-menu.js"></script>
    <!--    <script src="${pageContext.request.contextPath}/assets2/js/notify/bootstrap-notify.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/notify/index.js"></script>-->

        <!-- Data table js -->
        <script src="${pageContext.request.contextPath}/assets2/js/jquery.dataTables.js"></script>
<!--        <script src="${pageContext.request.contextPath}/assets2/js/custom-data-table.js"></script>-->

        <!-- all checkbox select js -->
        <script src="${pageContext.request.contextPath}/assets2/js/checkbox-all-check.js"></script>

        <!-- sidebar effect -->
        <!--<script src="${pageContext.request.contextPath}/assets2/js/sidebareffect.js"></script>-->

        <!-- Theme js -->
        <script src="${pageContext.request.contextPath}/assets2/js/script.js"></script>
        <script>
            $(document).ready(function () {
                $('#table_id').DataTable({
                    // Basic configuration
                    searching: true, // Enable search functionality
                    ordering: true, // Enable column sorting
                    paging: true, // Enable pagination
                    info: true, // Show info about table (entries)

                    // Customize the display
                    lengthChange: false,

                    pageLength: 10, // Default number of rows per page

                    // Column specific settings
                    columnDefs: [
                        {orderable: false, targets: 2}, // Disable sorting on action column (third column)
                        {searchable: false, targets: [0, 2]} // Disable search on first and third columns
                    ],

                    // Customize the language for Vietnamese
                    language: {
                        search: "Tìm kiếm:",
                        lengthMenu: "Hiển thị _MENU_ dòng",
                        info: "Hiển thị _START_ đến _END_ của _TOTAL_ vai trò",
                        infoEmpty: "",
                        infoFiltered: "",
                        paginate: {
                            first: "Đầu",
                            last: "Cuối",
                            next: "Tiếp",
                            previous: "Trước"
                        },
                        emptyTable: "Không có dữ liệu trong bảng",
                        zeroRecords: "Không tìm thấy kết quả phù hợp"
                    }
                });
            });


            document.addEventListener('DOMContentLoaded', function () {
                // Select all elements with class 'edit-role-btn'
                const editRoleButtons = document.querySelectorAll('.edit-role-btn');

                // Add click event listener to each edit button
                editRoleButtons.forEach(button => {
                    button.addEventListener('click', function () {
                        // Get the role ID and name from data attributes
                        const roleId = this.getAttribute('data-roleid');
                        const roleName = this.getAttribute('data-rolename');

                        // Get the modal element
                        const editModal = document.getElementById('editRoleName');

                        // Set the values in the modal form
                        const roleIdInput = editModal.querySelector('input[name="roleId"]');
                        const roleNameInput = editModal.querySelector('input[name="roleName"]');

                        roleIdInput.value = roleId;
                        roleNameInput.value = roleName;

                        // Open the modal using Bootstrap's modal method
                        var modal = new bootstrap.Modal(editModal);
                        modal.show();
                    });
                });

                // Check if there's a message from the servlet and open the modal if needed
                const message = document.querySelector('.alert-danger');
                if (message) {
                    // Get the modal element
                    const editModal = document.getElementById('editRoleName');

                    // Check if we have stored role data in session storage
                    const storedRoleId = sessionStorage.getItem('editRoleId');
                    const storedRoleName = sessionStorage.getItem('editRoleName');

                    if (storedRoleId && storedRoleName) {
                        // Set the values in the modal form
                        const roleIdInput = editModal.querySelector('input[name="roleId"]');
                        const roleNameInput = editModal.querySelector('input[name="roleName"]');

                        roleIdInput.value = storedRoleId;
                        roleNameInput.value = storedRoleName;

                        // Clear the stored data
                        sessionStorage.removeItem('editRoleId');
                        sessionStorage.removeItem('editRoleName');
                    }

                    // Open the modal
                    var modal = new bootstrap.Modal(editModal);
                    modal.show();
                }
            });

// Add this to store the role data before form submission
            document.querySelector('#editRoleName form').addEventListener('submit', function () {
                const roleIdInput = this.querySelector('input[name="roleId"]');
                const roleNameInput = this.querySelector('input[name="roleName"]');

                // Store the values in session storage to retrieve after redirect
                sessionStorage.setItem('editRoleId', roleIdInput.value);
                sessionStorage.setItem('editRoleName', roleNameInput.value);
            });
        </script>

    </body>

</html>