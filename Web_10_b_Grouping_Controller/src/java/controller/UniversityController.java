/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UniversityDAO;
import model.UniversityDTO;

/**
 *
 * @author tungi
 */
public class UniversityController extends HttpServlet {

    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String keywords = request.getParameter("keywords");
        String id = request.getParameter("id");
        if (keywords == null) {
            keywords = "";
        }
        if (id == null) {
            id = "";
        }

        System.out.println(keywords);
        UniversityDAO udao = new UniversityDAO();
        // Xoa
        if (!id.isEmpty()) {
            boolean check = udao.softDelete(id);
            if (check) {
                request.setAttribute("msg", "Deleted!");
            } else {
                request.setAttribute("msg", "Error, can not delete: " + id);
            }
        }

        // Tim kiem
        ArrayList<UniversityDTO> list = new ArrayList<>();
        if (keywords.trim().length() > 0) {
            list = udao.filterByName(keywords);
        }
        request.setAttribute("list", list);
        request.setAttribute("keywords", keywords);
        String url = "search.jsp";
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    protected void doSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String keywords = request.getParameter("keywords");
        if (keywords == null) {
            keywords = "";
        }

        System.out.println(keywords);
        UniversityDAO udao = new UniversityDAO();
        ArrayList<UniversityDTO> list = new ArrayList<>();
        if (keywords.trim().length() > 0) {
            list = udao.filterByName(keywords);
        }
        request.setAttribute("list", list);
        request.setAttribute("keywords", keywords);
        String url = "search.jsp";
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    protected void doUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        UniversityDAO udao = new UniversityDAO();

        // Tìm kiếm thông tin cũ từ DB
        UniversityDTO u = udao.searchByID(id);

        if (u != null) {
            request.setAttribute("u", u);
            request.setAttribute("mode", "update");
            request.getRequestDispatcher("university-form.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Không tìm thấy University với ID này!");
            request.getRequestDispatcher("SearchUniversityController").forward(request, response);
        }
    }

    private UniversityDTO extractUniversityFromRequest(HttpServletRequest request) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String shortName = request.getParameter("shortName");
        String description = request.getParameter("description");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String region = request.getParameter("region");
        String type = request.getParameter("type");

        int foundedYear = parseOrDefault(request.getParameter("foundedYear"), 0);
        int totalStudents = parseOrDefault(request.getParameter("totalStudents"), 0);
        int totalFaculties = parseOrDefault(request.getParameter("totalFaculties"), 0);
        boolean isDraft = "on".equals(request.getParameter("isDraft"));

        return new UniversityDTO(id, name, shortName, description, foundedYear,
                address, city, region, type, totalStudents,
                totalFaculties, isDraft);
    }

    private String validateUniversity(UniversityDTO u, boolean isUpdate) {
        StringBuilder error = new StringBuilder();
        if (u.getId() == null || u.getId().trim().isEmpty()) {
            error.append("Chưa nhập Id <br/>");
        }
        if (u.getName() == null || u.getName().trim().isEmpty()) {
            error.append("Chưa nhập Name <br/>");
        }
        if (u.getFoundedYear() < 0) {
            error.append("Năm thành lập phải >= 0 <br/>");
        }

        // Nếu là thêm mới, cần check trùng ID (Update thì không cần check vì ID là readonly)
        if (!isUpdate) {
            UniversityDAO udao = new UniversityDAO();
            if (udao.searchByID(u.getId()) != null) {
                error.append("ID đã tồn tại, vui lòng chọn ID khác! <br/>");
            }
        }
        return error.toString();
    }

    protected void doAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UniversityDTO u = extractUniversityFromRequest(request);
        String error = validateUniversity(u, false);
        String msg = "";

        if (error.isEmpty()) {
            UniversityDAO udao = new UniversityDAO();
            if (udao.add(u)) {
                msg = "Đã thêm University thành công!";
            } else {
                error = "Lỗi hệ thống: Không thể thêm vào database!";
            }
        }

        request.setAttribute("u", u);
        request.setAttribute("msg", msg);
        request.setAttribute("error", error);
        request.getRequestDispatcher("university-form.jsp").forward(request, response);
    }

    protected void doSaveUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UniversityDTO u = extractUniversityFromRequest(request);
        String error = validateUniversity(u, true);
        String msg = "";

        if (error.isEmpty()) {
            UniversityDAO udao = new UniversityDAO();
            if (udao.update(u)) {
                msg = "Đã cập nhật thành công!";
            } else {
                error = "Lỗi hệ thống: Không thể cập nhật!";
            }
        }

        request.setAttribute("u", u);
        request.setAttribute("mode", "update");
        request.setAttribute("msg", msg);
        request.setAttribute("error", error);
        request.getRequestDispatcher("university-form.jsp").forward(request, response);
    }

    // Hàm hỗ trợ parse số để tránh lập lại code try-catch
    private int parseOrDefault(String value, int defaultValue) {
        try {
            return Integer.parseInt(value);
        } catch (Exception e) {
            return defaultValue;
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Thiết lập Encoding để tránh lỗi tiếng Việt
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        // Phòng trường hợp action bị null (người dùng truy cập trực tiếp URL)
        if (action == null || action.isEmpty()) {
            doSearch(request, response);
            return;
        }

        try {
            switch (action) {
                case "searchUniversity":
                    doSearch(request, response);
                    break;

                case "addUniversity":
                    doAdd(request, response);
                    break;

                case "deleteUniversity":
                    doDelete(request, response);
                    break;

                case "updateUniversity":
                    // Khi người dùng nhấn nút "Sửa" ở danh sách -> Đổ dữ liệu ra Form
                    doUpdate(request, response);
                    break;

                case "saveUpdateUniversity":
                    // Khi người dùng nhấn nút "Update" trong Form -> Lưu vào DB
                    doSaveUpdate(request, response);
                    break;

                default:
                    // Nếu action không khớp, mặc định quay về trang search hoặc báo lỗi
                    request.setAttribute("error", "Hành động không hợp lệ: " + action);
                    doSearch(request, response);
                    break;
            }
        } catch (Exception e) {
            log("Error at UniversityController: " + e.toString());
            request.setAttribute("error", "Hệ thống đang gặp sự cố, vui lòng thử lại sau.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
