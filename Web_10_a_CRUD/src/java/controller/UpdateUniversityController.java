/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
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
public class UpdateUniversityController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UniversityDAO udao = new UniversityDAO();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        UniversityDTO u = udao.searchByID(id);
        String url = "";
        if (action.equals("updateUniversity")) {
            // Lay University va hien thi ra form
            request.setAttribute("u", u);
            request.setAttribute("mode", "update");
            url = "university-form.jsp";
        } else if (action.equals("saveUpdateUniversity")) {
            // Sau khi chinh sua va nhan nut
            // Lay cac gia tri moi va luu lai
            String error = "";
            String msg = "";
            try {
                String name = request.getParameter("name");
                String shortName = request.getParameter("shortName");
                String description = request.getParameter("description");
                String s_foundedYear = request.getParameter("foundedYear");
                String address = request.getParameter("address");
                String city = request.getParameter("city");
                String region = request.getParameter("region");
                String type = request.getParameter("type");
                String s_totalStudents = request.getParameter("totalStudents");
                String s_totalFaculties = request.getParameter("totalFaculties");
                String s_isDraft = request.getParameter("isDraft");

                id = id.trim();
                if (id.isEmpty()) {
                    error += ("Chua nhap Id <br/>");
                }
                name = name.trim();
                if (name.isEmpty()) {
                    error += ("Chua nhap Name <br/>");
                }

                int foundedYear = 0;
                try {
                    foundedYear = Integer.parseInt(s_foundedYear);
                    if (foundedYear < 0) {
                        error += ("Nam thanh lap phai la so nguyen duong!<br/>");
                    }
                } catch (Exception e) {
                    error += ("Nam thanh lap phai la so nguyen!<br/>");
                }

                int totalStudents = 0;
                try {
                    totalStudents = Integer.parseInt(s_totalStudents);
                    if (totalStudents < 0) {
                        error += ("Tong so sinh vien phai la so nguyen duong!<br/>");
                    }
                } catch (Exception e) {
                    error += ("Tong so sinh vien phai la so nguyen!<br/>");
                }

                int totalFaculties = 0;
                try {
                    totalFaculties = Integer.parseInt(s_totalFaculties);
                    if (totalFaculties < 0) {
                        error += ("So nhan vien phai la so nguyen duong!<br/>");
                    }
                } catch (Exception e) {
                    error += ("So nguyen duong phai la so nguyen!<br/>");
                }

                System.out.println("isDraft: " + s_isDraft);
                boolean isDraft = (s_isDraft.equals("on")) ? true : false;

                u = new UniversityDTO(id, name, shortName, description, foundedYear, address, city, region, type, totalStudents, totalFaculties, isDraft);
                if (error.isEmpty()) {
                    // Khong co loi
                    if (udao.update(u)) {
                        msg = "Da cap nhat University thanh cong!";
                    } else {
                        error += "Gap loi, khong the cap nhat University!";
                        request.setAttribute("u", u);
                    }
                    request.setAttribute("msg", msg);
                } else {
                    request.setAttribute("u", u);
                }
                request.setAttribute("mode", "update");
                request.setAttribute("error", error);
                url = "university-form.jsp";

            } catch (Exception e) {
                e.printStackTrace();
            }
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);

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
