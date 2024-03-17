/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import AppServices.DatabaseUtilizer;
import com.mysql.cj.conf.DatabaseUrlContainer;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Kelum
 */
@WebServlet(name = "VisitorController", urlPatterns = {"/Visitor"})
public class VisitorController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var session = request.getSession(false);
        if (session != null) {
            String authType = (String) session.getAttribute("authType");
            if (authType == null) {
                response.sendRedirect("/ABCLaboratory/Login?page=signin");
            } else {
                var page = request.getParameter("page");
                if ("Download".equals(page)) {
                    getDownloadPage(request, response);
                } else {
                    getMyAppointmentsPage(request, response);
                }
            }
        } else {
            response.sendRedirect("/ABCLaboratory");
        }
        
    }

    private void getMyAppointmentsPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var session = request.getSession(false);
        if (session != null) {
            var userId = (int) session.getAttribute("userId");
            if (userId > 0) {
                var appointmentsList = DatabaseUtilizer.getVisitorAppointmentsList(userId);
                request.setAttribute("appointmentsList", appointmentsList);
                request.getRequestDispatcher("/Views/Visitor/visitor.jsp").forward(request, response);
            } else {
                response.sendRedirect("/ABCLaboratory/Login");
            }
        } else {
            response.sendRedirect("/ABCLaboratory/Login");
        }

    }

    private void getDownloadPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
        var testReport = DatabaseUtilizer.getPrintableTestReport(appointmentId);
        request.setAttribute("testReport", testReport);
        request.getRequestDispatcher("/Views/Visitor/report.jsp").forward(request, response);
    }

}
