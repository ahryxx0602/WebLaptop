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
                <title>Login - Laptopshop</title>
                <link href="css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="bg-primary">
                <div id="layoutAuthentication">
                    <div id="layoutAuthentication_content">
                        <main>
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-md-6 col-lg-5">
                                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                                            <div class="card-header text-center mb-4">
                                                <i class="fas fa-user-circle fa-3x text-primary mb-2"></i>
                                                <h3 class="mb-0">Đăng nhập</h3>
                                                <p class="text-muted small">Chào mừng bạn quay lại!</p>
                                            </div>
                                            <div class="card-body">
                                                <form method="post" action="/login">
                                                    <c:if test="${param.error != null}">
                                                        <div class="my-2" style="color: red;">Invalid email or password.</div>
                                                    </c:if>
                                                    <c:if test="${param.logout != null}">
                                                        <div class="my-2" style="color: green;">Logout success.</div>
                                                    </c:if>                                               
                                                    <div class="form-floating mb-3">
                                                        <input class="form-control" type="email"
                                                            placeholder="name@example.com"
                                                            name="username"/>
                                                        <label>Email address</label>
                                                    </div>
                                                        <div class="form-floating mb-3 mb-md-0">
                                                            <input class="form-control" type="password"
                                                                placeholder="Create a password"
                                                                name="password"/>
                                                            <label>Password</label>
                                                        </div>
                                                        <div>
                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                        </div>
                                                        <!-- Remember Me checkbox -->
                                                        <div class="form-check mb-3">
                                                            <input class="form-check-input" type="checkbox" name="remember-me" id="rememberMe"/>
                                                            <label class="form-check-label" for="rememberMe">
                                                                Remember Me
                                                            </label>
                                                        </div>
                                                    <div class="mt-4 mb-0">
                                                        <div class="d-grid"><button
                                                                class="btn btn-primary btn-block">Login
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="card-footer text-center py-3">
                                                <div class="small"><a href="/register">Don't have an account? Go to
                                                        register</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>