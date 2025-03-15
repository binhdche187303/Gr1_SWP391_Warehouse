<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
        <title>Fastkart - Coupon List</title>

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

        <!-- Themify icon css-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/themify.css">

        <!-- Data Table css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/datatables.css">

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
            .coupon-list-table {
                table-layout: fixed;
                width: 100%;
            }

            .coupon-list-table th,
            .coupon-list-table td {
                white-space: nowrap; /* Ngăn chữ xuống dòng không mong muốn */
                overflow: hidden;
                text-overflow: ellipsis;
            }

            .coupon-list-table td span {
                display: block; /* Đảm bảo không bị tràn do inline */
            }


            .coupon-list-table th:nth-child(10),
            .coupon-list-table td:nth-child(10) {
                width: 12%; /* Đảm bảo cột Action không bị chồng lên */
            }

            /* Pagination Styling */
            .pagination-container {
                margin-top: 20px;
                margin-bottom: 20px;
            }

            .pagination .page-item.active .page-link {
                background-color: #0da487;
                border-color: #0da487;
            }

            .pagination .page-link {
                color: #0da487;
            }

            .pagination .page-link:hover {
                background-color: #e9ecef;
                border-color: #dee2e6;
                color: #0da487;
            }

            .pagination .page-item.disabled .page-link {
                color: #6c757d;
                pointer-events: none;
                background-color: #fff;
                border-color: #dee2e6;
            }
        </style>

    </head>

    <body>
        <%@include file="/includes/admin.jsp" %>

        <!-- page-wrapper Start -->
        <div class="page-wrapper compact-wrapper" id="pageWrapper">

            <!-- Page Body Start-->
            <div class="page-body-wrapper">
                <!-- Container-fluid starts-->
                <!-- Coupon list table starts-->
                <div class="page-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card card-table">
                                    <div class="card-body">
                                        <div class="title-header option-title">
                                            <h5>Danh sách sản phẩm</h5>
                                            <div class="right-options">
                                                <ul>
                                                    <li>
                                                        <form action="couponproductlist" method="post">
                                                            <input style="width: 300px" type="text" name="sub_name" id="searchBox" class="form-control" placeholder="Tìm kiếm sản phẩm giảm giá...">
                                                            <input hidden type="submit">
                                                        </form>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="table-responsive">
                                                <table class="table all-package coupon-list-table table-hover theme-table" id="table_id">
                                                    <thead>
                                                        <tr>
                                                            <th>Tên sản phẩm</th>
                                                            <th>Hành động</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <c:forEach items="${requestScope.listProduct}" var="lp">
                                                            <tr>
                                                                <td class="theme-color">${lp.productName}</td>
                                                                <td>
                                                                    <ul>
                                                                        <a href="discountproductdetail?product_id=${lp.productId}" 
                                                                           class="view-discount-history" 
                                                                           >
                                                                            <i class="ri-eye-line"></i>
                                                                        </a>
                                                                        <a href="createcouponproduct?product_id=${lp.productId}" class="view-discount-history">
                                                                            <i class="ri-add-circle-line" style="color: rgb(116, 125, 198);width: 19;height: 18"></i>
                                                                        </a>
                                                                    </ul>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Pagination End -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Container-fluid Ends-->

                </div>
            </div>

        </div>
        <!-- page-wrapper End -->


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

        <!-- Plugins JS -->
        <script src="${pageContext.request.contextPath}/assets2/js/sidebar-menu.js"></script>
<!--        <script src="${pageContext.request.contextPath}/assets2/js/notify/bootstrap-notify.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/notify/index.js"></script>-->

        <!-- Data table js -->
<!--        <script src="${pageContext.request.contextPath}/assets2/js/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/custom-data-table.js"></script>-->

        <!-- all checkbox select js -->
        <script src="${pageContext.request.contextPath}/assets2/js/checkbox-all-check.js"></script>

        <!-- sidebar effect -->
        <script src="${pageContext.request.contextPath}/assets2/js/sidebareffect.js"></script>

        <!-- Theme js -->
        <script src="${pageContext.request.contextPath}/assets2/js/script.js"></script>

        <script>

            /**
             * Product List Pagination Implementation
             * - Adds pagination to the product list table with exactly 10 products per page
             * - Fixed pagination calculation and display
             */

            document.addEventListener('DOMContentLoaded', function () {
                // Pagination configuration
                const itemsPerPage = 10;
                let currentPage = 1;
                let allProducts = [];

                // Initial load - fetch all products and implement pagination
                function initializePagination() {
                    // Get initial list of products from the table
                    allProducts = [];
                    const rows = document.querySelectorAll('#table_id tbody tr');

                    rows.forEach(function (row) {
                        const productName = row.querySelector('td:first-child').textContent;
                        const link = row.querySelector('a:first-child');
                        const href = link.getAttribute('href');
                        const productId = href.split('product_id=')[1];

                        allProducts.push({
                            productName: productName,
                            productId: productId
                        });
                    });

                    // Render the pagination
                    renderPagination();
                    showPage(1);
                }

                // Render pagination controls
                function renderPagination() {
                    const pageCount = Math.ceil(allProducts.length / itemsPerPage);

                    // Clear existing pagination if any
                    const existingPagination = document.querySelector('.pagination-container');
                    if (existingPagination) {
                        existingPagination.remove();
                    }

                    // Don't show pagination if only one page or no products
                    if (pageCount <= 1) {
                        return;
                    }

                    // Create pagination container
                    const paginationContainer = document.createElement('div');
                    paginationContainer.className = 'pagination-container mt-4 d-flex justify-content-center';

                    let paginationHTML = '<ul class="pagination">';
                    paginationHTML += '<li class="page-item" id="prevPage">';
                    paginationHTML += '<a class="page-link" href="#" aria-label="Previous">';
                    paginationHTML += '<span aria-hidden="true">&laquo;</span>';
                    paginationHTML += '</a></li>';

                    // Add page numbers
                    for (let i = 1; i <= pageCount; i++) {
                        paginationHTML += '<li class="page-item" data-page="' + i + '">';
                        paginationHTML += '<a class="page-link" href="#">' + i + '</a>';
                        paginationHTML += '</li>';
                    }

                    paginationHTML += '<li class="page-item" id="nextPage">';
                    paginationHTML += '<a class="page-link" href="#" aria-label="Next">';
                    paginationHTML += '<span aria-hidden="true">&raquo;</span>';
                    paginationHTML += '</a></li>';
                    paginationHTML += '</ul>';

                    paginationContainer.innerHTML = paginationHTML;

                    // Append pagination controls after the table
                    const table = document.getElementById('table_id');
                    table.parentNode.insertBefore(paginationContainer, table.nextSibling);

                    // Add event listeners to pagination controls
                    const pageItems = document.querySelectorAll('.page-item');
                    pageItems.forEach(function (item) {
                        item.addEventListener('click', function (e) {
                            e.preventDefault();

                            if (this.id === 'prevPage') {
                                if (currentPage > 1) {
                                    showPage(currentPage - 1);
                                }
                            } else if (this.id === 'nextPage') {
                                if (currentPage < pageCount) {
                                    showPage(currentPage + 1);
                                }
                            } else {
                                const page = parseInt(this.getAttribute('data-page'));
                                showPage(page);
                            }
                        });
                    });
                }

                // Show specific page of products with exactly 10 items per page
                function showPage(page) {
                    currentPage = page;

                    // Calculate start and end indices for this page
                    const startIndex = (page - 1) * itemsPerPage;
                    const endIndex = Math.min(startIndex + itemsPerPage, allProducts.length);

                    // Only show items for this specific page
                    const productsForThisPage = allProducts.slice(startIndex, endIndex);

                    // Clear the table
                    const tbody = document.querySelector('#table_id tbody');
                    tbody.innerHTML = '';

                    // Add products for current page
                    productsForThisPage.forEach(function (product) {
                        const row = document.createElement('tr');

                        // Product name cell
                        const nameCell = document.createElement('td');
                        nameCell.className = 'theme-color';
                        nameCell.textContent = product.productName;
                        row.appendChild(nameCell);

                        // Define href variables
                        const hrefView = "discountproductdetail?product_id=" + product.productId;
                        const hrefEdit = "createcouponproduct?product_id=" + product.productId;

                        // Actions cell
                        const actionsCell = document.createElement("td");
                        let actionsHTML = '<ul>';
                        actionsHTML += '<a href="' + hrefView + '" class="view-discount-history">';
                        actionsHTML += '<i class="ri-eye-line"></i>';
                        actionsHTML += '</a>';
                        actionsHTML += '<a href="' + hrefEdit + '" class="view-discount-history">';
                        actionsHTML += '<i class="ri-add-circle-line" style="color: rgb(116, 125, 198);"></i>';
                        actionsHTML += '</a>';
                        actionsHTML += '</ul>';

                        actionsCell.innerHTML = actionsHTML;
                        row.appendChild(actionsCell);
                        tbody.appendChild(row);
                    });

                    // Update active page
                    const pageItems = document.querySelectorAll('.page-item');
                    pageItems.forEach(function (item) {
                        item.classList.remove('active');
                        if (item.getAttribute('data-page') == page) {
                            item.classList.add('active');
                        }
                    });

                    // Update prev/next buttons
                    const pageCount = Math.ceil(allProducts.length / itemsPerPage);
                    const prevButton = document.getElementById('prevPage');
                    const nextButton = document.getElementById('nextPage');

                    if (prevButton) {
                        if (page === 1) {
                            prevButton.classList.add('disabled');
                        } else {
                            prevButton.classList.remove('disabled');
                        }
                    }

                    if (nextButton) {
                        if (page === pageCount) {
                            nextButton.classList.add('disabled');
                        } else {
                            nextButton.classList.remove('disabled');
                        }
                    }
                }

                // Handle search with vanilla JavaScript
                let timeoutId;
                const searchBox = document.getElementById('searchBox');

                if (searchBox) {
                    searchBox.addEventListener('input', function () {
                        clearTimeout(timeoutId);
                        timeoutId = setTimeout(function () {
                            const searchValue = searchBox.value;

                            // Create XMLHttpRequest
                            const xhr = new XMLHttpRequest();
                            xhr.open('POST', 'couponproductlist', true);
                            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                            xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');

                            xhr.onload = function () {
                                if (xhr.status === 200) {
                                    console.log('Response:', xhr.responseText);

                                    // Parse JSON response
                                    try {
                                        // Update the global products array
                                        allProducts = JSON.parse(xhr.responseText);
                                        console.log('Total products loaded:', allProducts.length);

                                        // Reset to first page and re-render pagination
                                        currentPage = 1;
                                        renderPagination();
                                        showPage(1);
                                    } catch (e) {
                                        console.error('Error parsing JSON:', e);
                                    }
                                } else {
                                    console.error('Error:', xhr.statusText);
                                }
                            };

                            xhr.onerror = function () {
                                console.error('Network Error');
                            };

                            // Send request
                            xhr.send('sub_name=' + encodeURIComponent(searchValue));
                        }, 300);
                    });
                }

                // Prevent form submission
                const searchForm = searchBox ? searchBox.closest('form') : null;
                if (searchForm) {
                    searchForm.addEventListener('submit', function (e) {
                        e.preventDefault();
                    });
                }

                // Initialize pagination on page load
                initializePagination();
            });
        </script>


    </body>

</html>