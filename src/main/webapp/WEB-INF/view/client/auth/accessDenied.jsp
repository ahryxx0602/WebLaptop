<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">
            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>403 - Access Denied</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <link href="/css/accessDenied.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body>
                <div class="access-denied-container">
                    <div class="icon mb-3">
                        <i class="fa-solid fa-triangle-exclamation"></i>
                    </div>
                    <h1 class="display-4 mb-2">403</h1>
                    <h2 class="mb-3" style="color:#4e73df;">Access Denied</h2>
                    <p class="lead mb-4">Bạn không có quyền truy cập vào trang này.</p>
                    <a href="/" class="btn btn-home btn-lg">
                        <i class="fa-solid fa-house me-2"></i>Go Home
                    </a>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>
        </html>