<%-- 
    Document   : index
    Created on : 08-01-2026, 11:07:24
    Author     : tungi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>University Management System</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
            }
            .welcome-card {
                background: rgba(255, 255, 255, 0.1);
                backdrop-filter: blur(10px);
                padding: 3rem;
                border-radius: 20px;
                border: 1px solid rgba(255, 255, 255, 0.2);
                text-align: center;
                box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            }
            .btn-login {
                padding: 12px 40px;
                font-size: 1.2rem;
                border-radius: 50px;
                transition: all 0.3s ease;
            }
            .btn-login:hover {
                transform: translateY(-3px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="welcome-card mx-auto" style="max-width: 500px;">
                <h1 class="display-4 fw-bold mb-3">Welcome</h1>
                <p class="lead mb-5">Hệ thống quản lý thông tin các trường Đại học chuyên nghiệp.</p>
                
                <div class="d-grid gap-2">
                    <a href="login.jsp" class="btn btn-light btn-login text-primary fw-bold">
                        Đăng nhập ngay
                    </a>
                </div>
                
                <div class="mt-4 small opacity-75">
                    © 2026 - Developed by Tungi
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>