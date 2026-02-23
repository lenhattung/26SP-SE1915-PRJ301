<%-- 
    Document   : 403
    Created on : 22-01-2026, 09:45:36
    Author     : tungi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>403 - Access Denied</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #f8f9fa;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .error-container {
            text-align: center;
            max-width: 500px;
            padding: 40px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.05);
        }
        .error-icon {
            font-size: 5rem;
            color: #dc3545;
        }
        .error-code {
            font-size: 3rem;
            font-weight: 800;
            color: #343a40;
            margin-bottom: 0;
        }
    </style>
</head>
<body>

    <div class="error-container">
        <div class="error-icon">
            <i class="bi bi-shield-lock-fill"></i>
        </div>
        <h1 class="error-code">403</h1>
        <h2 class="mb-3">Truy cập bị từ chối!</h2>
        <p class="text-muted mb-4">
            Rất tiếc, bạn không có quyền truy cập vào trang này. 
            Vui lòng liên hệ quản trị viên hoặc quay lại trang chủ.
        </p>
        
        <div class="d-grid gap-2">
            <a href="MainController?action=searchUniversity" class="btn btn-primary btn-lg">
                <i class="bi bi-house-door"></i> Quay lại trang chủ
            </a>
            <a href="login.jsp" class="btn btn-outline-secondary">
                Đăng nhập với tài khoản khác
            </a>
        </div>
        
        <div class="mt-4">
            <small class="text-secondary">IP của bạn đã được ghi nhận cho mục đích bảo mật.</small>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>