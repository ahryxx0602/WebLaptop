<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Ahryxx - Dự án laptopshop" />
                <meta name="author" content="Ahryxx" />
                <title>Delete</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">
                                    <h1 class="mt-4">Delete User</h1>
                                </h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active"><a href="/admin/user">user</a></li>
                                    <li class="breadcrumb-item active">delete</li>
                                </ol>
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Delete User with id = ${id}</h3>
                                            <hr />

                                            <div class="alert alert-danger">
                                                Are you sure to delete this user ?
                                            </div>
                                            <form:form method="post" action="/admin/user/delete"
                                                modelAttribute="newUser">
                                                <div class="mb-3" style="display: none;">
                                                    <label class="form-label">ID :</label>
                                                    <form:input value="${id}" type="text" class="form-control"
                                                        path="id" />
                                                </div>
                                                <div class="d-flex gap-2">
                                                    <button class="btn btn-danger w-50">Confirm</button>
                                                    <a href="/admin/user" class="btn btn-success w-50">Back</a>
                                                </div>
                                            </form:form>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>

            </body>

            </html>