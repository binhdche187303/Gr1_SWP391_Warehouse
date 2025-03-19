<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Fastkart">
        <meta name="keywords" content="Fastkart">
        <meta name="author" content="Fastkart">
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/1.png" type="image/x-icon">
        <title>Sign Up</title>

        <!-- Google font -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

        <!-- bootstrap css -->
        <link id="rtl-link" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/bootstrap.css">

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
    </head>
    <body>
        <%@ include file="/includes/header.jsp" %> <!-- Nhúng header -->
        <section class="breadscrumb-section pt-0">
            <div class="container-fluid-lg">
                <div class="row">
                    <div class="col-12">
                        <div class="breadscrumb-contain">
                            <h2 class="mb-2">Đăng kí</h2>
                            <nav>
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item">
                                        <a href="index.html">
                                            <i class="fa-solid fa-house"></i>
                                        </a>
                                    </li>
                                    <li class="breadcrumb-item active">Đăng kí</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- sign up section start -->
        <section class="log-in-section section-b-space">
            <div class="container-fluid-lg w-100">
                <div class="row">
                    <div class="col-xxl-6 col-xl-5 col-lg-6 d-lg-block d-none ms-auto">
                        <div class="image-contain">
                            <img src="${pageContext.request.contextPath}/assets/images/inner-page/sign-up.png" class="img-fluid" alt="">
                        </div>
                    </div>

                    <div class="col-xxl-4 col-xl-5 col-lg-6 col-sm-8 mx-auto">
                        <div class="log-in-box">
                            <div class="log-in-title">
                                <h3>Chào mừng đến với BULKMART</h3>                                
                                <h4>Tạo tài khoản mới</h4>
                            </div>

                            <div class="input-box">
                                <!-- Registration Form -->
                                <form action="${pageContext.request.contextPath}/register" method="post" class="mt-4">
                                    <c:if test="${not empty error}">
                                        <div class="alert alert-danger">${error}</div>
                                    </c:if>

                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input type="email" class="form-control" id="email" name="email" required value="${email}">
                                        <c:if test="${not empty errorEmail}">
                                            <small class="text-danger">${errorEmail}</small>
                                        </c:if>
                                    </div>

                                    <div class="form-group mt-3">
                                        <label for="username">Tên người dùng</label>
                                        <input type="text" class="form-control" id="username" name="username" required value="${username}">
                                        <c:if test="${not empty errorUsername}">
                                            <small class="text-danger">${errorUsername}</small>
                                        </c:if>
                                    </div>

                                    <div class="form-group mt-3">
                                        <label for="password">Mật khẩu</label>
                                        <input type="password" class="form-control" id="password" name="password" required value="${password}">
                                        <small class="text-muted">Ít nhất 1 chữ in hoa, 1 ký tự đặc biệt, 1 số, tối thiểu 8 ký tự.</small>
                                        <c:if test="${not empty errorPassword}">
                                            <small class="text-danger">${errorPassword}</small>
                                        </c:if>
                                    </div>

                                    <div class="form-group mt-3">
                                        <label for="fullname">Tên đầy đủ</label>
                                        <input type="text" class="form-control" id="fullname" name="fullname" required value="${fullname}">
                                    </div>

                                    <div class="form-group mt-3">
                                        <label for="phone">Số điện thoại</label>
                                        <input type="text" class="form-control" id="phone" name="phone" required value="${phone}">
                                        <c:if test="${not empty errorPhone}">
                                            <small class="text-danger">${errorPhone}</small>
                                        </c:if>
                                    </div>

                                    <!-- 🏪 Thêm thông tin cửa hàng -->
                                    <div class="form-group mt-3">
                                        <label for="storeName">Tên cửa hàng</label>
                                        <input type="text" class="form-control" id="storeName" name="storeName" required value="${storeName}">
                                    </div>

                                    <div class="form-group mt-3">
                                        <label for="storeAddress">Địa chỉ cửa hàng</label>
                                        <input type="text" class="form-control" id="storeAddress" name="storeAddress" required value="${storeAddress}">
                                    </div>

                                    <div class="form-group mt-3">
                                        <label for="taxCode">Mã số thuế</label>
                                        <input type="text" class="form-control" id="taxCode" name="taxCode" required value="${taxCode}">
                                        <c:if test="${not empty errorTaxCode}">
                                            <small class="text-danger">${errorTaxCode}</small>
                                        </c:if>
                                    </div>

                                    <div class="form-group mt-3">
                                        <label for="businessLicense">Giấy phép kinh doanh (URL Google Drive)</label>
                                        <input type="text" class="form-control" id="businessLicense" name="businessLicense" required 
                                               value="${param.businessLicense}"
                                               pattern="https://drive\.google\.com/file/d/[a-zA-Z0-9_-]+/view"
                                               title="Vui lòng nhập đúng định dạng Google Drive: https://drive.google.com/file/d/[ID]/view">
                                        <small class="text-muted">Ví dụ: https://drive.google.com/file/d/11qqtZj31PQRjCVBu80IdsJTfw2sGlkuh/view</small>
                                    </div>

                                    <div class="col-12 mt-4">
                                        <button class="btn btn-animation w-100" type="submit">Đăng kí</button>
                                    </div>
                                </form>

                            </div>

                            <div class="other-log-in">
                                <h6>or</h6>
                            </div>

                            <div class="log-in-button">
                                <ul>
                                    <li>
                                        <a href="https://accounts.google.com/signin/v2/identifier?flowName=GlifWebSignIn&flowEntry=ServiceLogin"
                                           class="btn google-button w-100">
                                            <img src="${pageContext.request.contextPath}/assets/images/inner-page/google.png" class="blur-up lazyload"
                                                 alt="">
                                            Đăng ký với Google
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="sign-up-box">
                                <h4>Bạn đã có tài khoản?</h4>
                                <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-xxl-7 col-xl-6 col-lg-6"></div>
                </div>
            </div>
        </section>
        <!-- sign up section end -->    

        <!-- Tap to top start -->
        <div class="theme-option">
            <div class="back-to-top">
                <a id="back-to-top" href="#">
                    <i class="fas fa-chevron-up"></i>
                </a>
            </div>
        </div>
        <!-- Tap to top end -->

        <!-- Bg overlay Start -->
        <div class="bg-overlay"></div>
        <!-- Bg overlay End -->

        <!-- latest jquery-->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>

        <!-- Bootstrap js-->
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/popper.min.js"></script>

        <!-- feather icon js-->
        <script src="${pageContext.request.contextPath}/assets/js/feather/feather.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/feather/feather-icon.js"></script>

        <!-- Slick js-->
        <script src="${pageContext.request.contextPath}/assets/js/slick/slick.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/slick/slick-animation.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/slick/custom_slick.js"></script>

        <!-- Lazyload Js -->
        <script src="${pageContext.request.contextPath}/assets/js/lazysizes.min.js"></script>

        <!-- script js -->
        <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
        <%@ include file="/includes/footer.jsp" %> <!-- Nhúng footer -->

    </body>
</html>
