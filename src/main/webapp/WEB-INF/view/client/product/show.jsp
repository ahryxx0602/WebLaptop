<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Trang chủ - LaptopShop</title>
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
                <style>
                    ul.pagination.justify-content-center.flex-row {
                    display: flex;
                    flex-direction: row;
                    .page-link.disabled {
                            color: var(--bs-pagination-disabled-color);
                            pointer-events: none;
                            background-color: var(--bs-pagination-disabled-bg);
                        }
                }
                </style>
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

                <!-- Fruits Shop Start-->
                <div class="container-fluid fruite py-5">
                    <div class="container py-5">
                        <div class="tab-class text-center">
                            <div class="row g-4">
                                <div>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                                            <li class="breadcrumb-item active" aria-current="">Sản phẩm</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>

                            <div class="row g-4 fruite px-4">
                                <!--Filter-->
                                <div class="col-12 col-md-3">
                                    <div class="card mb-3 p-3" style="background: #f8f9fa; border-radius: 10px; border: 1px solid #e0e0e0;">
                                        <div class="mb-3" id="factoryFilter">
                                            <div class="mb-2 fw-bold">Hãng sản xuất</div>
                                            <div class="row g-2">
                                                <div class="col-6">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="factory-1" value="APPLE">
                                                        <label class="form-check-label" for="factory-1">Apple</label>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="factory-2" value="ASUS">
                                                        <label class="form-check-label" for="factory-2">Asus</label>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="factory-3" value="LENOVO">
                                                        <label class="form-check-label" for="factory-3">Lenovo</label>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="factory-4" value="DELL">
                                                        <label class="form-check-label" for="factory-4">Dell</label>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="factory-5" value="LG">
                                                        <label class="form-check-label" for="factory-5">LG</label>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="factory-6" value="ACER">
                                                        <label class="form-check-label" for="factory-6">Acer</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr/>
                                        <div class="mb-3" id="targetFilter">
                                            <div class="mb-2 fw-bold">Mục đích sử dụng</div>
                                            <div class="row g-2">
                                                <div class="col-12">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="target-1" value="GAMING">
                                                        <label class="form-check-label" for="target-1">Gaming</label>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="target-2" value="SINHVIEN-VANPHONG">
                                                        <label class="form-check-label" for="target-2">Sinh viên - văn phòng</label>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="target-3" value="THIET-KE-DO-HOA">
                                                        <label class="form-check-label" for="target-3">Thiết kế đồ họa</label>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="target-4" value="MONG-NHE">
                                                        <label class="form-check-label" for="target-4">Mỏng nhẹ</label>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="target-5" value="DOANH-NHAN">
                                                        <label class="form-check-label" for="target-5">Doanh nhân</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr/>
                                        <div class="mb-3" id="priceFilter">
                                            <div class="mb-2 fw-bold">Mức giá</div>
                                            <div class="row g-2">
                                                <div class="col-12">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="price-2" value="duoi-10-trieu">
                                                        <label class="form-check-label" for="price-2">Dưới 10 triệu</label>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="price-3" value="10-toi-15-trieu">
                                                        <label class="form-check-label" for="price-3">Từ 10 - 15 triệu</label>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="price-4" value="15-toi-20-trieu">
                                                        <label class="form-check-label" for="price-4">Từ 15 - 20 triệu</label>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="price-5" value="tren-20-trieu">
                                                        <label class="form-check-label" for="price-5">Trên 20 triệu</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr/>
                                        <div class="mb-3">
                                            <div class="mb-2 fw-bold">Sắp xếp</div>
                                            <div class="row g-2">
                                                <div class="col-12">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" id="sort-1" value="gia-tang-dan" name="radio-sort">
                                                        <label class="form-check-label" for="sort-1">Giá tăng dần</label>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" id="sort-2" value="gia-giam-dan" name="radio-sort">
                                                        <label class="form-check-label" for="sort-2">Giá giảm dần</label>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" id="sort-3" checked value="gia-nothing" name="radio-sort">
                                                        <label class="form-check-label" for="sort-3">Không sắp xếp</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button class="btn btn-success w-100 mt-2 fw-bold py-2" id="btnFilter" style="font-size: 1.1rem; letter-spacing: 1px;">
                                            <i class="fa fa-filter me-2"></i>Lọc sản phẩm
                                        </button>
                                    </div>
                                </div>
                                <!--Product-->
                                <div class="col-12 col-md-9">
                                    <div class="tab-content">
                                        <div id="tab-1" class="tab-pane fade show p-0 flex-column active">
                                            <div class="row g-4">
                                                <div class="col-lg-12">
                                                    <div class="row g-4">
                                                        <c:choose>
                                                            <c:when test="${empty products}">
                                                                <div class="col-12">
                                                                    <div class="alert alert-warning text-center fw-bold py-4" style="font-size:1.2rem;">
                                                                        <i class="fa fa-exclamation-circle me-2"></i>Không tìm thấy sản phẩm phù hợp!
                                                                    </div>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:forEach var="product" items="${products}">
                                                                    <div class="col-12 col-sm-6 col-lg-4 col-xl-3 d-flex align-items-stretch">
                                                                        <div class="rounded position-relative fruite-item w-100 h-100 d-flex flex-column">
                                                                            <div class="fruite-img">
                                                                                <img src="/images/product/${product.image}"
                                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                                            </div>
                                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                                style="top: 10px; left: 10px;">Laptop</div>
                                                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom flex-grow-1 d-flex flex-column justify-content-between">
                                                                                <h4 style="font-size: 15px;">
                                                                                    <a href="/product/${product.id}">${product.name}</a>
                                                                                </h4>
                                                                                <p style="font-size: 13px;">${product.shortDesc}</p>
                                                                                <div class="d-flex flex-lg-wrap justify-content-center flex-column mt-auto">
                                                                                    <p style="font-size: 15px; text-align: center; width: 100%;"
                                                                                        class="text-dark fw-bold mb-3">
                                                                                        <fmt:formatNumber type="number"
                                                                                            value="${product.price}" /> đ
                                                                                    </p>
                                                                                    <form action="/add-product-to-cart/${product.id}" 
                                                                                            method="post">
                                                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                                                        <button
                                                                                        class="mx-auto btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                                        Add to cart
                                                                                    </button>
                                                                                    </form>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                            <nav aria-label="Page navigation example" class="mt-4">
                                                <c:if test="${totalPages > 0}">
                                                    <ul class="pagination justify-content-center flex-row">
                                                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                                            <a class="page-link" 
                                                            href="/products?page=${currentPage - 1}${qs}" 
                                                            aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                            </a>
                                                        </li>
                                                        <c:forEach begin="1" end="${totalPages}" var="i">
                                                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                                <a class="page-link" href="/products?page=${i}${qs}">
                                                                    ${i}
                                                                </a>
                                                            </li>
                                                        </c:forEach>
                                                        <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                                            <a class="page-link" href="/products?page=${currentPage + 1}${qs}" aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </c:if>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Fruits Shop End-->

                <!--FEATURE-->
                <jsp:include page="../layout/feature.jsp" />

                <!--Footer-->
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

            </html>