<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form" %> <%@ taglib
prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>Detail Order</title>
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
            <h1 class="mt-4">Detail Order</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item active">
                <a href="/admin">Dashboard</a>
              </li>
              <li class="breadcrumb-item active">
                <a href="/admin/order">order</a>
              </li>
              <li class="breadcrumb-item active">detail</li>
            </ol>
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <th>Sản phẩm</th>
                  <th>Tên</th>
                  <th>Giá cả</th>
                  <th>Số lượng</th>
                  <th>Thành tiền</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="orderDetail" items="${orderDetail}">
                  <tr>
                    <td>
                      <img
                        src="/images/product/${orderDetail.product.image}"
                        alt="${orderDetail.product.name}"
                        style="
                          width: 100px;
                          height: 100px;
                          border-radius: 50%;
                          object-fit: cover;
                        "
                      />
                    </td>
                    <td>${orderDetail.product.name}</td>
                    <td>
                      <fmt:formatNumber
                        type="number"
                        value="${orderDetail.price}"
                      />
                      đ
                    </td>
                    <td>${orderDetail.quantity}</td>
                    <td>
                      <fmt:formatNumber
                        type="number"
                        value="${orderDetail.price * orderDetail.quantity}"
                      />
                      đ
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
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
