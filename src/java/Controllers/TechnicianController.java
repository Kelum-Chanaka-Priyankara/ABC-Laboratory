/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import AppServices.DatabaseUtilizer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Kelum
 */
@WebServlet(name = "TechnicianController", urlPatterns = {"/Technician"})
public class TechnicianController extends HttpServlet {

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
                if ("Tests".equals(page)) {
                    getTestsPage(request, response);
                } else if ("UpdateTestReport".equals(page)) {
                    getUpdateTestReport(request, response);
                } else {
                    getTestRepotsPage(request, response);
                }
            }
        } else {
            response.sendRedirect("/ABCLaboratory");
        }
        
    }

    private void getTestsPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private void getUpdateTestReport(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var testReportId = request.getParameter("testReportId");
        request.setAttribute("testReportId", testReportId);
        request.getRequestDispatcher("/Views/Technician/update_test_report.jsp").forward(request, response);
    }

    private void getTestRepotsPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var session = request.getSession(false);
        if (session != null) {
            var userId = (int) session.getAttribute("userId");
            if (userId > 0) {
                var appointmentsList = DatabaseUtilizer.getTechnicianTestsList(userId);
                request.setAttribute("appointmentsList", appointmentsList);
                request.getRequestDispatcher("/Views/Technician/technician.jsp").forward(request, response);
            } else {
                response.sendRedirect("/ABCLaboratory/Login");
            }
        } else {
            response.sendRedirect("/ABCLaboratory/Login");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var action = request.getParameter("action");

        if ("Update".equals(action)) {
            updateTestReports(request, response);
        } else {

        }
    }

    private void updateTests(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private void updateTestReports(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var testReportId = Integer.parseInt(request.getParameter("test_report_id"));
        var testDate = request.getParameter("test_date");
        var testTime = request.getParameter("test_time");
        var testReport = request.getParameter("test_report");

        var isSuccess = DatabaseUtilizer.updateTechnicianTestReport(testReportId, testDate, testTime, testReport);
    }

}
