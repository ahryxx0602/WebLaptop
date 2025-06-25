<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>Giỏ hàng - Laptopshop</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <meta content="" name="keywords">
                <meta content="" name="description">

                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">

                <!-- Icon Font Stylesheet -->
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                <!-- Customized Bootstrap Stylesheet -->
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/client/css/style.css" rel="stylesheet">
            </head>

            <body>
                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->
                <!--HEADER-->
                <jsp:include page="../layout/header.jsp" />

                <!--Cart Start-->
                <div class="container-fluid py-5">
                    <div class="container py-5">
                        <div class="mb-3">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
                                </ol>
                            </nav>
                        </div>
                        <!--Chi tiết giỏ hàng-->
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col">Products</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Handle</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">
                                            <div class="d-flex align-items-center">
                                                <img src="img/vegetable-item-3.png" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">
                                            </div>
                                        </th>
                                        <td>
                                            <p class="mb-0 mt-4">Big Banana</p>
                                        </td>
                                        <td>
                                            <p class="mb-0 mt-4">2.99 $</p>
                                        </td>
                                        <td>
                                            <div class="input-group quantity mt-4" style="width: 100px;">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-minus rounded-circle bg-light border" >
                                                    <i class="fa fa-minus"></i>
                                                    </button>
                                                </div>
                                                <input type="text" class="form-control form-control-sm text-center border-0" value="1">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="mb-0 mt-4">2.99 $</p>
                                        </td>
                                        <td>
                                            <button class="btn btn-md rounded-circle bg-light border mt-4" >
                                                <i class="fa fa-times text-danger"></i>
                                            </button>
                                        </td>
                                    
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <div class="d-flex align-items-center">
                                                <img src="img/vegetable-item-5.jpg" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="" alt="">
                                            </div>
                                        </th>
                                        <td>
                                            <p class="mb-0 mt-4">Potatoes</p>
                                        </td>
                                        <td>
                                            <p class="mb-0 mt-4">2.99 $</p>
                                        </td>
                                        <td>
                                            <div class="input-group quantity mt-4" style="width: 100px;">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-minus rounded-circle bg-light border" >
                                                    <i class="fa fa-minus"></i>
                                                    </button>
                                                </div>
                                                <input type="text" class="form-control form-control-sm text-center border-0" value="1">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="mb-0 mt-4">2.99 $</p>
                                        </td>
                                        <td>
                                            <button class="btn btn-md rounded-circle bg-light border mt-4" >
                                                <i class="fa fa-times text-danger"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <div class="d-flex align-items-center">
                                                <img src="img/vegetable-item-2.jpg" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="" alt="">
                                            </div>
                                        </th>
                                        <td>
                                            <p class="mb-0 mt-4">Awesome Brocoli</p>
                                        </td>
                                        <td>
                                            <p class="mb-0 mt-4">2.99 $</p>
                                        </td>
                                        <td>
                                            <div class="input-group quantity mt-4" style="width: 100px;">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-minus rounded-circle bg-light border" >
                                                    <i class="fa fa-minus"></i>
                                                    </button>
                                                </div>
                                                <input type="text" class="form-control form-control-sm text-center border-0" value="1">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="mb-0 mt-4">2.99 $</p>
                                        </td>
                                        <td>
                                            <button class="btn btn-md rounded-circle bg-light border mt-4" >
                                                <i class="fa fa-times text-danger"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!--Tổng tiền giỏ hàng-->
                        <div class="row justify-content-center mt-5">
                            <div class="col-12 col-md-8 col-lg-6">
                                <div class="card shadow rounded-4">
                                    <div class="card-body p-4">
                                        <h1 class="card-title text-center mb-4 display-6">Cart <span class="fw-normal">Total</span></h1>
                                        <ul class="list-group list-group-flush mb-4">
                                            <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                                <span class="fw-medium">Subtotal:</span>
                                                <span class="fw-bold text-primary">$96.00</span>
                                            </li>
                                            <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0">
                                                <span class="fw-medium">Shipping</span>
                                                <span class="text-muted"><i class="fas fa-shipping-fast me-2"></i>Flat rate: $3.00</span>
                                            </li>
                                            <li class="list-group-item border-0 px-0 pt-0 pb-0 text-end text-muted">
                                                Shipping to Ukraine.
                                            </li>
                                        </ul>
                                        <div class="d-flex justify-content-between align-items-center border-top border-bottom py-3 mb-4">
                                            <span class="fs-5 fw-bold">Total</span>
                                            <span class="fs-5 fw-bold text-success">$99.00</span>
                                        </div>
                                        <button class="btn btn-primary btn-lg rounded-pill w-100 text-uppercase fw-bold d-flex align-items-center justify-content-center gap-2" type="button">
                                            <i class="fas fa-credit-card"></i> Proceed Checkout
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Cart End-->

                <!--FOOTER-->
                <jsp:include page="../layout/footer.jsp" />

                <!-- Back to Top -->
                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                        class="fa fa-arrow-up"></i></a>

                <!-- JavaScript Libraries -->
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/lib/easing/easing.min.js"></script>
                <script src="/client/lib/waypoints/waypoints.min.js"></script>
                <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script>
            </body>