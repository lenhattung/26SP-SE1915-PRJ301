<%-- 
    Document   : login
    Created on : 08-01-2026, 11:08:26
    Author     : tungi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập hệ thống</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #f0f2f5;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-card {
            width: 100%;
            max-width: 400px;
            padding: 2rem;
            border: none;
            border-radius: 1rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
        }
        .btn-login {
            padding: 0.8rem;
            font-weight: 600;
            border-radius: 0.5rem;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card login-card mx-auto">
        <div class="text-center mb-4">
            <i class="bi bi-person-circle text-primary" style="font-size: 3rem;"></i>
            <h2 class="fw-bold mt-2">Đăng Nhập</h2>
            <p class="text-muted">Vui lòng nhập tài khoản của bạn</p>
        </div>

        <form action="MainController" method="post">
            <input type="hidden" name="action" value="login"/>
            
            <div class="mb-3">
                <label class="form-label">Tên đăng nhập</label>
                <div class="input-group">
                    <span class="input-group-text bg-light"><i class="bi bi-person"></i></span>
                    <input type="text" name="txtUsername" class="form-control" 
                           placeholder="Nhập username" required>
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label">Mật khẩu</label>
                <div class="input-group">
                    <span class="input-group-text bg-light"><i class="bi bi-lock"></i></span>
                    <input type="password" name="txtPassword" class="form-control" 
                           placeholder="Nhập password" required>
                </div>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-primary btn-login">
                    Đăng nhập
                </button>
            </div>
        </form>

        <c:if test="${not empty message}">
            <div class="alert alert-danger mt-3 py-2 text-center" role="alert">
                <i class="bi bi-exclamation-triangle-fill me-2"></i> ${message}
            </div>
        </c:if>

        <div class="text-center mt-4">
            <a href="index.jsp" class="text-decoration-none small text-secondary">
                <i class="bi bi-arrow-left"></i> Quay lại trang chủ
            </a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>