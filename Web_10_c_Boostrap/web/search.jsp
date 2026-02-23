<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Đại học - Tra cứu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
</head>
<body class="bg-light">

    <jsp:include page="welcome.jsp" />

    <%-- Bảo vệ trang --%>
    <c:if test="${empty user}">
        <c:redirect url="login.jsp"/>
    </c:if>

    <div class="container my-5">
        <div class="card shadow-sm border-0">
            <div class="card-body p-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="card-title fw-bold text-primary mb-0">Danh sách các trường Đại học</h2>
                    <a href="university-form.jsp" class="btn btn-success shadow-sm">
                        <i class="bi bi-plus-circle me-1"></i> Thêm mới
                    </a>
                </div>

                <form action="MainController" method="post" class="row g-2 mb-4">
                    <input type="hidden" name="action" value="searchUniversity"/>
                    <div class="col-md-6 col-lg-4">
                        <div class="input-group">
                            <span class="input-group-text bg-white"><i class="bi bi-search"></i></span>
                            <input type="text" name="keywords" class="form-control" 
                                   placeholder="Nhập tên trường..." value="${keywords}" />
                            <button class="btn btn-primary px-4" type="submit">Tìm kiếm</button>
                        </div>
                    </div>
                </form>

                <hr class="text-secondary opacity-25">

                <%-- Kết quả tìm kiếm --%>
                <c:choose>
                    <c:when test="${empty list}">
                        <div class="alert alert-warning border-0 shadow-sm mt-3" role="alert">
                            <i class="bi bi-exclamation-triangle me-2"></i>
                            Không tìm thấy dữ liệu phù hợp với tiêu chí tìm kiếm!
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="table-responsive">
                            <table class="table table-hover align-middle border">
                                <thead class="table-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên trường</th>
                                        <th>Viết tắt</th>
                                        <th>Thành phố</th>
                                        <th>Vùng</th>
                                        <th>Loại hình</th>
                                        <th>Năm TL</th>
                                        <th class="text-center">SV/GV</th>
                                        <th class="text-center" colspan="2">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${list}" var="u">
                                        <tr>
                                            <td class="fw-bold text-secondary">${u.id}</td>
                                            <td class="fw-medium">${u.name}</td>
                                            <td><span class="badge bg-light text-dark border">${u.shortName}</span></td>
                                            <td>${u.city}</td>
                                            <td>${u.region}</td>
                                            <td>${u.type}</td>
                                            <td>${u.foundedYear}</td>
                                            <td class="text-center small">
                                                <span class="d-block">SV: ${u.totalStudents}</span>
                                                <span class="d-block text-muted">GV: ${u.totalFaculties}</span>
                                            </td>
                                            <td class="text-center">
                                                <c:if test="${u.isDraft}">
                                                    <a href="MainController?action=updateUniversity&id=${u.id}" 
                                                       class="btn btn-sm btn-outline-warning" title="Chỉnh sửa">
                                                        <i class="bi bi-pencil-square"></i> Sửa
                                                    </a>
                                                </c:if>
                                            </td>
                                            <td class="text-center">
                                                <form action="MainController" method="POST"
                                                      onsubmit="return confirm('Bạn có chắc chắn muốn xóa trường ${u.name}?');">
                                                    <input type="hidden" name="action" value="deleteUniversity"/>
                                                    <input type="hidden" name="id" value="${u.id}"/>
                                                    <input type="hidden" name="keywords" value="${keywords}"/>
                                                    <button type="submit" class="btn btn-sm btn-outline-danger">
                                                        <i class="bi bi-trash"></i> Xóa
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>