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
                                <h3>Welcome To Fastkart</h3>
                                <h4>Create New Account</h4>
                            </div>

                            <div class="input-box">
                                <!-- Registration Form -->
                                <form action="${pageContext.request.contextPath}/register" method="post" class="mt-4">
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input type="email" class="form-control" id="email" name="email" required value="${param.email}">
                                    </div>

                                    <div class="form-group mt-3">
                                        <label for="username">Username</label>
                                        <input type="text" class="form-control" id="username" name="username" required value="${param.username}">
                                    </div>

                                    <div class="form-group mt-3">
                                        <label for="password">Password</label>
                                        <input type="password" class="form-control" id="password" name="password" required>
                                    </div>

                                    <div class="form-group mt-3">
                                        <label for="fullname">Full Name</label>
                                        <input type="text" class="form-control" id="fullname" name="fullname" required value="${param.fullname}">
                                    </div>

                                    <div class="form-group mt-3">
                                        <label for="phone">Phone Number</label>
                                        <input type="text" class="form-control" id="phone" name="phone" required value="${param.phone}">
                                    </div>
                                    <br><!-- comment -->
                                <div class="col-12">
                                    <button class="btn btn-animation w-100" type="submit">Sign Up</button>
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
                                            Sign up with Google
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://www.facebook.com/" class="btn google-button w-100">
                                            <img src="${pageContext.request.contextPath}/assets/images/inner-page/facebook.png" class="blur-up lazyload"
                                                 alt=""> Sign up with Facebook
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="sign-up-box">
                                <h4>Already have an account?</h4>
                                <a href="${pageContext.request.contextPath}/login">Log In</a>
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
