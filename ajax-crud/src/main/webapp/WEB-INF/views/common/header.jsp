<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>AJAX CRUD</title>

    <!-- Bootstrap -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <!-- jQuery -->
    <script
        src="https://code.jquery.com/jquery-3.6.4.min.js">
    </script>

    <script>
        var contextPath =
            "${pageContext.request.contextPath}";
    </script>
</head>

<body class="d-flex flex-column min-vh-100">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

    <div class="container">

        <a class="navbar-brand"
           href="${pageContext.request.contextPath}/category">
            AJAX CRUD
        </a>

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse"
             id="navbarNav">

            <ul class="navbar-nav">

                <li class="nav-item">
                    <a class="nav-link"
                       href="${pageContext.request.contextPath}/category">
                        Category
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link"
                       href="${pageContext.request.contextPath}/product">
                        Product
                    </a>
                </li>

            </ul>

        </div>

    </div>

</nav>

<div class="container mt-4 flex-grow-1">