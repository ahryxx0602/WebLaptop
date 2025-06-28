<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="vi">

            <head>
                <meta charset="utf-8">
                <title>Cảm ơn bạn đã mua hàng - Laptopshop</title>
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
                <style>
                    .thankyou-section {
                        min-height: 60vh;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        background: #f5f7fa;
                    }
                    .thankyou-card {
                        background: #fff;
                        border-radius: 18px;
                        box-shadow: 0 2px 12px rgba(26,115,232,0.07);
                        border: 1.5px solid #e3f0fc;
                        padding: 28px 18px;
                        text-align: center;
                        max-width: 340px;
                        margin: auto;
                    }
                    .thankyou-icon {
                        font-size: 3.2rem;
                        color: #38b000;
                        margin-bottom: 16px;
                        animation: pop 0.7s cubic-bezier(.68,-0.55,.27,1.55);
                    }
                    @keyframes pop {
                        0% { transform: scale(0.5); opacity: 0; }
                        80% { transform: scale(1.1); opacity: 1; }
                        100% { transform: scale(1); }
                    }
                    .thankyou-title {
                        font-size: 1.6rem;
                        font-weight: 700;
                        color: #1a237e;
                        margin-bottom: 10px;
                    }
                    .thankyou-message {
                        font-size: 1rem;
                        color: #444;
                        margin-bottom: 22px;
                    }
                    .btn-thankyou {
                        font-size: 1rem;
                        padding: 10px 18px;
                        border-radius: 22px;
                        font-weight: 600;
                        margin: 0 6px 8px 6px;
                        min-width: 120px;
                        box-shadow: 0 2px 8px rgba(26,115,232,0.07);
                        transition: background 0.2s, color 0.2s, transform 0.2s;
                    }
                    .btn-home {
                        background: linear-gradient(90deg, #4fc3f7 0%, #38b000 100%);
                        color: #fff;
                        border: none;
                    }
                    .btn-home:hover {
                        background: linear-gradient(90deg, #38b000 0%, #4fc3f7 100%);
                        color: #fff;
                        transform: translateY(-1px) scale(1.03);
                    }
                    .btn-cart {
                        background: #fff;
                        color: #4fc3f7;
                        border: 1.5px solid #4fc3f7;
                    }
                    .btn-cart:hover {
                        background: #4fc3f7;
                        color: #fff;
                        transform: translateY(-1px) scale(1.03);
                    }
                    @media (max-width: 600px) {
                        .thankyou-card { padding: 18px 4px; max-width: 98vw; }
                        .thankyou-title { font-size: 1.2rem; }
                        .btn-thankyou { min-width: 90px; padding: 8px 6px; font-size: 0.95rem; }
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

                <div class="thankyou-section">
                    <div class="thankyou-card">
                        <div class="thankyou-icon">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <div class="thankyou-title">Cảm ơn bạn đã mua hàng!</div>
                        <div class="thankyou-message">
                            Đơn hàng của bạn đã được tiếp nhận và đang được xử lý.<br>
                            Chúng tôi sẽ liên hệ với bạn sớm nhất để xác nhận và giao hàng.<br>
                            <span style="color:#1a73e8;font-weight:600;">Chúc bạn một ngày tốt lành!</span>
                        </div>
                        <div>
                            <a href="/cart" class="btn btn-thankyou btn-cart"><i class="fas fa-shopping-cart me-2"></i>Quay về giỏ hàng</a>
                            <a href="/" class="btn btn-thankyou btn-home"><i class="fas fa-home me-2"></i>Quay về trang chủ</a>
                        </div>
                    </div>
                </div>


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
                <script>
                    window.addEventListener('load', function() {
                        var spinner = document.getElementById('spinner');
                        if (spinner) spinner.style.display = 'none';
                    });
                </script>
            </body>