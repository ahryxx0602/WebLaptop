<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form" %> <%@ taglib
prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ page
isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="Ahryxx - Dự án laptopshop" />
    <meta name="author" content="Ahryxx" />
    <title>Update Order</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
  </head>

  <body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />
    <div id="layoutSidenav">
      <jsp:include page="../layout/sidebar.jsp" />
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Update a Order</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item active">
                <a href="/admin">Dashboard</a>
              </li>
              <li class="breadcrumb-item active">
                <a href="/admin/order">order</a>
              </li>
              <li class="breadcrumb-item active">update</li>
            </ol>
            <hr />
            <form:form
              method="post"
              action="/admin/order/update"
              modelAttribute="newOrder"
              class="row"
              enctype="multipart/form-data"
            >
              <div class="mb-3 col-12 col-md-6">
                <label class="form-label">ID :</label>
                <form:input type="hidden" path="id" />
                <form:input
                  type="text"
                  class="form-control"
                  path="id"
                  disabled="true"
                />
              </div>

              <div class="mb-3 col-12 col-md-6">
                <label class="form-label">Total Price :</label>
                <div class="form-control" disabled style="background: #e9ecef">
                  <fmt:formatNumber
                    type="number"
                    value="${newOrder.totalPrice}"
                  />
                  đ
                </div>
              </div>

              <div class="mb-3 col-12 col-md-6">
                <label class="form-label">User :</label>
                <form:input
                  type="text"
                  class="form-control"
                  disabled="true"
                  path="user"
                />
              </div>
              <div class="mb-3 col-12 col-md-6">
                <label class="form-label">Status:</label>
                <form:select class="form-select" path="status">
                  <form:option value="PENDING">PENDING</form:option>
                  <form:option value="COMPLETED">COMPLETED</form:option>
                  <form:option value="SHIPPING">SHIPPING</form:option>
                  <form:option value="CANCELED">CANCELED</form:option>
                  <form:option value="RETURNED">RETURNED</form:option>
                </form:select>
              </div>
              <div class="d-flex gap-2">
                <button type="submit" class="btn btn-warning w-50">
                  Update
                </button>
                <a href="/admin/order" class="btn btn-success w-50">Back</a>
              </div>
            </form:form>
          </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/scripts.js"></script>
  </body>
</html>
