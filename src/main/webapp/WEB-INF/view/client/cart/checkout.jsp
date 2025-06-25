<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
                <!-- Cart Stylesheet -->
                <link href="/client/css/cart.css" rel="stylesheet">

                
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
                                    <th scope="col">Sản phẩm</th>
                                    <th scope="col">Tên</th>
                                    <th scope="col">Giá cả</th>
                                    <th scope="col">Số lượng</th>
                                    <th scope="col">Thành tiền</th>
                                    <th scope="col">Xử lí</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="cartDetail" items="${cartDetails}">
                                        <tr>
                                            <th scope="row">
                                                <div class="d-flex align-items-center">
                                                    <img src="/images/product/${cartDetail.product.image}"
                                                        class="img-fluid me-5 rounded-circle"
                                                        style="width: 80px; height: 80px;" alt="">
                                                </div>
                                            </th>
                                            <td>
                                                <p class="mb-0 mt-4">
                                                    <a href="/product/${cartDetail.product.id}" target="_blank">
                                                        ${cartDetail.product.name}
                                                    </a>
                                                </p>
                                            </td>
                                            <td>
                                                <p class="mb-0 mt-4">
                                                    <fmt:formatNumber type="number"
                                                        value="${cartDetail.product.price}"/>đ
                                                </p>
                                            </td>
                                            <td>
                                                <div class="input-group quantity mt-4" style="width: 100px;">
                                                    <input type="text"
                                                        class="form-control form-control-sm text-center border-0"
                                                        value="${cartDetail.quantity}"
                                                        data-cart-detail-id="${cartDetail.id}"
                                                        data-cart-detail-price="${cartDetail.price}"
                                                        data-cart-detail-index="${status.index}">
                                                </div>
                                            </td>
                                            <td>
                                                <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                    <fmt:formatNumber type="number"
                                                        value="${cartDetail.price * cartDetail.quantity}"/>đ
                                                </p>
                                            </td>
                                            <td>
                                                <form method="post" action="/delete-cart-product/${cartDetail.id}">
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                    <button class="btn btn-md rounded-circle bg-light border mt-4">
                                                        <i class="fa fa-times text-danger"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!--Thông tin người nhận-->
                        <div test="${not empty cartDetails}">
                            <form:form action="/place-order" method="post" modelAttribute="cart">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <div class="mt-5 row g-4 justify-content-start">
                                    <div class="col-12 mol-md-6">
                                        <div class="p-4">
                                            <h5>Thông tin người nhận</h5>
                                            <div class="row">
                                                <div class="col-12 form-group mb-3">
                                                    <label>Tên người nhận</label>
                                                    <input class="form-control" name="receiverName" required/>
                                                </div>
                                                <div class="col-12 form-group mb-3">
                                                    <label>Địa chỉ người nhận</label>
                                                    <input class="form-control" name="receiverAddress" required/>
                                                </div>
                                                <div class="col-12 form-group mb-3">
                                                    <label>Số điện thoại</label>
                                                    <input class="form-control" name="receiverPhone" required/>
                                                </div>
                                                <div class="mt-4">
                                                    <i class="fas fa-arrow-left"></i>
                                                    <a href="/cart">Quay lại giỏ hàng</a>
                                                </div>
                                            </div>
                                    <button class="btn btn-primary w-100 mt-3" type="submit">
                                        Đặt hàng
                                    </button>
                                </div>
                            </form:form>
                        </div>
                        
                        <!--Tổng tiền giỏ hàng-->
                        <div class="row justify-content-center mt-5">
                            <div class="col-12 col-md-8 col-lg-6">
                                <div class="order-info-card p-4 shadow-lg">
                                    <h1 class="order-info-title text-center mb-4">
                                        <i class="fas fa-file-invoice-dollar text-primary me-2"></i>
                                        Thông tin <span class="fw-normal">Đơn hàng</span>
                                    </h1>
                                    <ul class="list-group order-info-list mb-4">
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <span class="fw-medium">Tạm tính:</span>
                                            <span class="fw-bold text-primary" data-cart-total-price="${totalPrice}">
                                                <fmt:formatNumber type="number" value="${totalPrice}"/> đ
                                            </span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <span class="fw-medium">Phí vận chuyển</span>
                                            <span class="text-muted">0 đ</span>
                                        </li>
                                    </ul>
                                    <div class="d-flex justify-content-between align-items-center border-top border-bottom py-3 mb-4">
                                        <span class="order-info-total">Tổng số tiền</span>
                                        <span class="order-info-total" data-cart-total-price="${totalPrice}">
                                            <fmt:formatNumber type="number" value="${totalPrice}"/> đ
                                        </span>
                                    </div>
                                    <form:form action="/confirm-checkout" method="post" modelAttribute="cart">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <div style="display: none;">
                                            <c:forEach var="cartDetail" items="${cart.cartDetails}" varStatus="status">
                                                <div class="mb-3">
                                                    <div class="form-group">
                                                        <label>Id:</label>
                                                        <form:input class="form-control" type="text"
                                                            value="${cartDetail.id}"
                                                            path="cartDetails[${status.index}].id"/> 
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Quantity:</label>
                                                        <form:input class="form-control" type="text"
                                                            value="${cartDetail.quantity}"
                                                            path="cartDetails[${status.index}].quantity"/> 
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <button class="btn btn-order w-100 text-uppercase fw-bold d-flex align-items-center justify-content-center gap-2" type="submit">
                                            <i class="fas fa-credit-card"></i> Xác nhận đặt đơn hàng
                                        </button>
                                    </form:form>
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