<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Fastkart">
        <meta name="keywords" content="Fastkart">
        <meta name="author" content="Fastkart">
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/1.png" type="image/x-icon">
        <title>Shop List</title>

        <!-- Google font -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <!-- bootstrap css -->
        <link id="rtl-link" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/bootstrap.css">

        <!-- wow css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/animate.min.css" />

        <!-- font-awesome css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/font-awesome.css">

        <!-- feather icon css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/feather-icon.css">

        <!-- slick css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/slick/slick.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/slick/slick-theme.css">

        <!-- Iconly css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bulk-style.css">

        <!-- Template css -->
        <link id="color-link" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
                margin: 0;
                padding: 0;
            }

            .cd__main {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 80vh;
            }

            .jumbotron {
                background: #f2f4f7; /* Màu nền nhạt */
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                text-align: center;
                width: 60%;
            }

            .jumbotron h1 {
                font-size: 2.5rem;
                color: #333;
                font-weight: 600;
                margin-bottom: 15px;
            }

            .jumbotron p.lead {
                font-size: 1.2rem;
                color: #666;
            }

            .jumbotron hr {
                width: 80%;
                border-top: 1px solid #ddd;
                margin: 20px auto;
            }

            .btn-primary {
                background-color: #007bff;
                border: none;
                padding: 10px 20px;
                font-size: 1rem;
                border-radius: 6px;
                transition: 0.3s ease-in-out;
            }

            .btn-primary:hover {
                background-color: #0056b3;
            }

        </style>
    </head>

    <body>
        <%@ include file="/includes/header.jsp" %>
        <main class="cd__main">
            <div class="jumbotron text-center">
                <h1 class="display-3">
                    <%
                        String status = (String) request.getAttribute("status");
                        if ("success".equals(status)) {
                    %>
                    Cảm ơn bạn đã đặt hàng!
                    <%
                        } else if ("error".equals(status)) {
                    %>
                    Đặt hàng thất bại!
                    <%
                        } else if ("emptyCart".equals(status)) {
                    %>
                    Giỏ hàng trống!
                    <%
                        } else {
                    %>
                    Trạng thái không xác định!
                    <%
                        }
                    %>
                </h1>

                <p class="lead">
                    <strong>
                        <%
                            if ("success".equals(status)) {
                        %>
                        Đơn hàng của bạn đã được xác nhận. Chúng tôi sẽ sớm liên hệ với bạn!
                        <%
                            } else if ("error".equals(status)) {
                        %>
                        Có lỗi xảy ra khi xử lý đơn hàng. Vui lòng thử lại sau!
                        <%
                            } else if ("emptyCart".equals(status)) {
                        %>
                        Không có sản phẩm nào trong giỏ hàng để thanh toán!
                        <%
                            } else {
                        %>
                        Hãy kiểm tra lại thông tin đơn hàng của bạn.
                        <%
                            }
                        %>
                    </strong>
                </p>

                <hr />

                <p class="lead">
                    <a class="btn btn-primary btn-sm" href="home" role="button">Tiếp tục mua sắm</a>
                </p>
            </div>
        </main>
        <%@ include file="/includes/footer.jsp" %>
    </body>
</html>