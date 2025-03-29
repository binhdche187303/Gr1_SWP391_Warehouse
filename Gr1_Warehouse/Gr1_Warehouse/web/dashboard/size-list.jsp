<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/8.png" type="image/x-icon">
        <title>Danh sách thể loại</title>

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

        <style>
            .custom-alert {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 10px 15px;
                background-color: red;
                color: white;
                border: 1px solid darkred;
                font-weight: bold;
            }

            .custom-alert button {
                background: none;
                border: none;
                color: white;
                font-size: 20px;
                cursor: pointer;
                font-weight: bold;
            }

        </style>
    </head>
    <body>


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
                                            <h5>Danh sách Thương hiệu</h5>


                                            <form class="d-inline-flex">
                                                <a href="/Gr1_Warehouse/createsize" class="btn btn-primary btn-lg shadow-sm">
                                                    <i class="fas fa-plus-circle"></i> Tạo kích cỡ mới
                                                </a>
                                            </form>

                                        </div>
                                        <div class="table-responsive table-product">
                                            <table class="table all-package theme-table" id="table_id">
                                                <thead>
                                                    <tr>
                                                        <th style="text-align: center">STT</th>
                                                        <th style="text-align: center">Tên kích cỡ</th>
                                                        <th style="text-align: center">Hành động</th>

                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <c:forEach var="ls" items="${requestScope.listSizes}">
                                                        <tr>
                                                            <td style="text-align: center"></td>
                                                            <td style="text-align: center">${ls.size_name}</td>
                                                            <td style="text-align: center">
                                                                <ul>
                                                                    <li>
                                                                        <a href="javascript:void(0)" 
                                                                           class="edit-size"
                                                                           data-size-id="${ls.size_id}" 
                                                                           data-size-name="${ls.size_name}"  
                                                                           >
                                                                            <i class="ri-pencil-line"></i>
                                                                        </a>
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

        <!-- Edit Size Modal Start-->
        <div class="modal fade theme-modal" id="edit-size" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Chỉnh sửa kích cỡ</h5>
                    </div>
                    <div class="modal-body">
                        <form action="sizelist" method="POST">
                            <input type="hidden" name="size_id" value="" /> 

                            <!-- Quantity -->
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="size_name" name="size_name" value="" required />
                                <label for="size">Tên kích cỡ</label>
                            </div>
                            <c:if test="${not empty requestScope.message}">
                                <div class="custom-alert alert alert-dismissible fade show" role="alert">
                                    <span>${requestScope.message}</span>
                                    <button type="button" data-bs-dismiss="alert" aria-label="Close">✖</button>
                                </div>
                            </c:if>
                            <!-- Modal Footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit Size Modal End -->

        <%
    String successMessage = (String) session.getAttribute("success");
    if (successMessage != null) {
        %>
        <script>
            alert("<%= successMessage %>");
        </script>
        <%
                session.removeAttribute("success"); // Xóa session để không hiển thị lại
            }
        %>

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


        <!-- ratio js -->
        <script src="${pageContext.request.contextPath}/assets2/js/ratio.js"></script>


        <!-- Theme js -->
        <script src="${pageContext.request.contextPath}/assets2/js/script.js"></script>

        <!-- DataTables CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">

        <!-- DataTables JS -->
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>


        <script>
            $(document).ready(function () {
                // Chèn ô tìm kiếm sau tiêu đề
                const filterForm = `
        <div class="card-body">
            <div class="row mb-4">
                <div class="col-md-3 mb-2">
                    <input type="text" id="sizeFilter" class="form-control" placeholder="Tìm theo kích cỡ">
                </div>
            </div>
        </div>
    `;
                $('.title-header').after(filterForm);
                // Khởi tạo DataTable
                const table = $('#table_id').DataTable({
                    paging: true,
                    searching: true, // Cho phép tìm kiếm
                    ordering: true,
                    info: true,
                    pageLength: 10,
                    lengthChange: false,
                    language: {
                        url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/vi.json',
                        emptyTable: "Không có kích cỡ nào trong hệ thống",
                        zeroRecords: "Không tìm thấy kích cỡ phù hợp",
                        info: "Hiển thị _START_ đến _END_ của _TOTAL_ kích cỡ",
                        infoEmpty: "Hiển thị 0 đến 0 của 0 kích cỡ",
                        infoFiltered: "(lọc từ _MAX_ kích cỡ)",
                        paginate: {
                            first: "Đầu tiên",
                            last: "Cuối cùng",
                            next: "Tiếp theo",
                            previous: "Trước đó"
                        }
                    },
                    columnDefs: [
                        {orderable: false, targets: 0}, // Khóa sắp xếp STT
                        {orderable: true, targets: 1}   // Chỉ cho phép sắp xếp theo tên kích cỡ
                    ],
                    initComplete: function () {
                        $('.dataTables_filter').hide(); // Ẩn thanh tìm kiếm mặc định
                    }
                });
                // Xử lý tìm kiếm theo kích cỡ
                $('#sizeFilter').on('keyup change', function () {
                    let searchValue = this.value.toLowerCase().trim();
                    table.columns(1).search(searchValue).draw();
                });
                // Cập nhật số thứ tự (STT) theo thứ tự hiển thị thực tế
                function updateSTT() {
                    let visibleRows = table.rows({filter: 'applied'}).nodes(); // Lấy hàng được hiển thị sau khi lọc

                    if (visibleRows.length === 0) {
                        return; // Nếu không có dữ liệu, không cập nhật STT
                    }

                    $(visibleRows).each(function (index) {
                        $(this).find("td:first").text(index + 1);
                    });
                }

                table.on('draw.dt', function () {
                    updateSTT();
                });
                updateSTT(); // Chạy lần đầu để cập nhật STT
            });

//Modal
            document.addEventListener('DOMContentLoaded', function () {
                // Select all elements with class 'edit-size'
                const editSizeButtons = document.querySelectorAll('.edit-size');

                // Add click event listener to each edit button
                editSizeButtons.forEach(button => {
                    button.addEventListener('click', function () {
                        // Get the size ID and name from data attributes
                        const sizeId = this.getAttribute('data-size-id');
                        const sizeName = this.getAttribute('data-size-name');

                        // Get the modal element
                        const editModal = document.getElementById('edit-size');

                        // Set the values in the modal form
                        const sizeIdInput = editModal.querySelector('input[name="size_id"]');
                        const sizeNameInput = editModal.querySelector('input[name="size_name"]');
                        sizeIdInput.value = sizeId;
                        sizeNameInput.value = sizeName;

                        // Open the modal using Bootstrap's modal method
                        var modal = new bootstrap.Modal(editModal);
                        modal.show();
                    });
                });

                // Check if there's a message from the servlet and open the modal if needed
                const message = document.querySelector('.custom-alert');
                if (message) {
                    // Get the modal element
                    const editModal = document.getElementById('edit-size');

                    // Check if we have stored size data in session storage
                    const storedSizeId = sessionStorage.getItem('editSizeId');
                    const storedSizeName = sessionStorage.getItem('editSizeName');

                    if (storedSizeId && storedSizeName) {
                        // Set the values in the modal form
                        const sizeIdInput = editModal.querySelector('input[name="size_id"]');
                        const sizeNameInput = editModal.querySelector('input[name="size_name"]');
                        sizeIdInput.value = storedSizeId;
                        sizeNameInput.value = storedSizeName;

                        // Clear the stored data
                        sessionStorage.removeItem('editSizeId');
                        sessionStorage.removeItem('editSizeName');
                    }

                    // Open the modal
                    var modal = new bootstrap.Modal(editModal);
                    modal.show();
                }
            });

// Add this to store the size data before form submission
            document.querySelector('#edit-size form').addEventListener('submit', function () {
                const sizeIdInput = this.querySelector('input[name="size_id"]');
                const sizeNameInput = this.querySelector('input[name="size_name"]');

                // Store the values in session storage to retrieve after redirect
                sessionStorage.setItem('editSizeId', sizeIdInput.value);
                sessionStorage.setItem('editSizeName', sizeNameInput.value);
            });
        </script>


    </body>

</html>