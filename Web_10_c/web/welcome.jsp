<%-- 
    Document   : a.jsp (Sáp nhập từ Welcome và Dashboard cũ)
    Created on : 08-01-2026
    Author     : tungi
--%>

<%@page import="model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ thống Quản lý Đại học | Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <style>
        :root { --primary-color: #4e73df; --bg-color: #f8f9fc; }
        body { background-color: var(--bg-color); font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .navbar { box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .welcome-banner { 
            background: linear-gradient(135deg, #4e73df 0%, #224abe 100%); 
            color: white; 
            padding: 40px 0; 
            border-radius: 0 0 1.5rem 1.5rem; 
        }
        .feature-card {
            border: none;
            border-radius: 1rem;
            transition: all 0.3s ease;
            height: 100%;
        }
        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 1rem 3rem rgba(0,0,0,0.175) !important;
        }
        .icon-circle {
            width: 60px; height: 60px;
            background-color: rgba(78, 115, 223, 0.1);
            color: #4e73df;
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <c:if test="${empty user}">
        <c:redirect url="login.jsp"/>
    </c:if>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
        <div class="container">
            <a class="navbar-brand fw-bold" href="a.jsp">
                <i class="bi bi-mortarboard-fill text-info me-2"></i>UniAdmin
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="a.jsp">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="MainController?action=searchUniversity">Tra cứu</a>
                    </li>
                </ul>
                
                <div class="dropdown">
                    <button class="btn btn-outline-info dropdown-toggle rounded-pill" type="button" data-bs-toggle="dropdown">
                        <i class="bi bi-person-circle me-1"></i> Chào, ${user.fullName}
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end shadow border-0 mt-2">
                        <li><h6 class="dropdown-header small">Role: ${user.roleID}</h6></li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item text-danger" href="MainController?action=logout">
                                <i class="bi bi-box-arrow-right me-2"></i>Đăng xuất
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <header class="welcome-banner mb-5 shadow-sm">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 class="display-5 fw-bold">Bảng điều khiển quản trị</h1>
                    <p class="lead mb-0">Hệ thống quản lý thông tin các cơ sở giáo dục đại học.</p>
                </div>
                <div class="col-md-4 text-md-end mt-3 mt-md-0">
                    <span class="badge bg-light text-dark p-2 rounded-pill shadow-sm">
                        <i class="bi bi-calendar3 me-1"></i> Hôm nay: 08-01-2026
                    </span>
                </div>
            </div>
        </div>
    </header>

    <div class="container mb-5">
        <div class="row g-4 justify-content-center">
            
            <div class="col-md-6 col-lg-5">
                <div class="card feature-card shadow-sm p-4">
                    <div class="icon-circle">
                        <i class="bi bi-search fs-2"></i>
                    </div>
                    <h3 class="fw-bold">Tra cứu Đại học</h3>
                    <p class="text-muted">Tìm kiếm, xem danh sách chi tiết, chỉnh sửa thông tin hoặc xóa các trường đại học khỏi hệ thống.</p>
                    <div class="mt-auto">
                        <a href="MainController?action=searchUniversity" class="btn btn-primary w-100 rounded-pill py-2 fw-bold">
                            Truy cập danh sách
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-5">
                <div class="card feature-card shadow-sm p-4">
                    <div class="icon-circle" style="color: #1cc88a; background-color: rgba(28, 200, 138, 0.1);">
                        <i class="bi bi-plus-circle fs-2"></i>
                    </div>
                    <h3 class="fw-bold">Thêm Trường Mới</h3>
                    <p class="text-muted">Đăng ký thông tin các trường đại học mới vào cơ sở dữ liệu để bắt đầu quản lý và lưu trữ.</p>
                    <div class="mt-auto">
                        <a href="university-form.jsp" class="btn btn-success w-100 rounded-pill py-2 fw-bold">
                            Tạo bản ghi mới
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>