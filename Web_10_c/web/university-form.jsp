<%-- 
    Document   : university-form.jsp
    Created on : 02-02-2026, 09:58:31
    Author     : tungi
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${mode == 'update' ? 'Cập nhật' : 'Thêm mới'} Đại học</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
        <style>
            body { background-color: #f8f9fc; }
            .card-form { border-radius: 1rem; border: none; box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1); }
            .form-label { font-weight: 600; color: #4e73df; }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top shadow-sm mb-4">
            <div class="container">
                <a class="navbar-brand fw-bold" href="a.jsp">
                    <i class="bi bi-mortarboard-fill text-info me-2"></i>UniAdmin
                </a>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a class="nav-link" href="a.jsp">Trang chủ</a></li>
                        <li class="nav-item"><a class="nav-link" href="MainController?action=searchUniversity">Tra cứu</a></li>
                    </ul>
                    <span class="navbar-text text-light">
                        Chào, <strong>${user.fullName}</strong>
                    </span>
                </div>
            </div>
        </nav>

        <div class="container mb-5">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card card-form p-4 p-md-5 bg-white">
                        <h2 class="text-center fw-bold mb-4 text-primary">
                            <i class="bi ${mode == 'update' ? 'bi-pencil-square' : 'bi-plus-circle'}"></i>
                            ${mode == 'update' ? 'Cập Nhật Thông Tin' : 'Thêm Trường Đại Học'}
                        </h2>

                        <form action="MainController" method="POST" class="needs-validation">
                            <input type="hidden" name="action" value="${mode=='update'?'saveUpdateUniversity':'addUniversity'}"/>

                            <div class="row g-3">
                                <div class="col-md-4">
                                    <label class="form-label">Mã trường (ID)</label>
                                    <input type="text" name="id" class="form-control bg-light" value="${u.id}" 
                                           ${mode == 'update' ? 'readonly' : 'required placeholder="VD: FPT"'} />
                                </div>
                                
                                <div class="col-md-8">
                                    <label class="form-label">Tên đầy đủ</label>
                                    <input type="text" name="name" class="form-control" value="${u.name}" required />
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Tên viết tắt</label>
                                    <input type="text" name="shortName" class="form-control" value="${u.shortName}" />
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Năm thành lập</label>
                                    <input type="number" name="foundedYear" class="form-control" value="${u.foundedYear}" min="0" />
                                </div>

                                <div class="col-12">
                                    <label class="form-label">Mô tả</label>
                                    <textarea name="description" class="form-control" rows="3">${u.description}</textarea>
                                </div>

                                <div class="col-12">
                                    <label class="form-label">Địa chỉ</label>
                                    <input type="text" name="address" class="form-control" value="${u.address}" />
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Thành phố</label>
                                    <input type="text" name="city" class="form-control" value="${u.city}" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Vùng miền</label>
                                    <input type="text" name="region" class="form-control" value="${u.region}" />
                                </div>

                                <div class="col-md-4">
                                    <label class="form-label">Loại hình</label>
                                    <select name="type" class="form-select">
                                        <option value="Công lập" ${u.type == 'Công lập' ? 'selected' : ''}>Công lập</option>
                                        <option value="Tư thục" ${u.type == 'Tư thục' ? 'selected' : ''}>Tư thục</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Tổng sinh viên</label>
                                    <input type="number" name="totalStudents" class="form-control" value="${u.totalStudents}" min="0" />
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Tổng giảng viên</label>
                                    <input type="number" name="totalFaculties" class="form-control" value="${u.totalFaculties}" min="0" />
                                </div>

                                <div class="col-12">
                                    <div class="form-check form-switch mt-2">
                                        <input class="form-check-input" type="checkbox" id="isDraft" name="isDraft" ${u.isDraft ? 'checked' : ''}>
                                        <label class="form-check-label" for="isDraft">Lưu dưới dạng bản nháp (Draft)</label>
                                    </div>
                                </div>

                                <div class="col-12 d-flex gap-2 mt-4">
                                    <button type="submit" class="btn ${mode == 'update' ? 'btn-warning' : 'btn-primary'} px-5 fw-bold">
                                        ${mode == 'update' ? 'Cập Nhật' : 'Thêm Mới'}
                                    </button>
                                    <a href="MainController?action=searchUniversity" class="btn btn-outline-secondary px-4">Hủy bỏ</a>
                                </div>
                            </div>
                        </form>

                        <c:if test="${not empty msg}">
                            <div class="alert alert-success mt-4 mb-0"><i class="bi bi-check-circle me-2"></i>${msg}</div>
                        </c:if>
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger mt-4 mb-0"><i class="bi bi-exclamation-triangle me-2"></i>${error}</div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>