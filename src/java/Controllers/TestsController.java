/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import AppServices.DatabaseUtilizer;
import Models.Inherited.TestModel;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author Kelum
 */
@WebServlet(name = "TestsController", urlPatterns = {"/Tests"})
public class TestsController extends HttpServlet {

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
                if ("Edit".equals(page)) {
                    getEditTest(request, response);
                } else if ("Add".equals(page)) {
                    getAddTest(request, response);
                } else if ("Delete".equals(page)) {
                    getDeleteTest(request, response);
                } else {
                    getTestsList(request, response);
                }
            }
        } else {
            response.sendRedirect("/ABCLaboratory");
        }
    }

    private void getTestsList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var testsList = DatabaseUtilizer.getTestsList();
        request.setAttribute("testsList", testsList);
        request.getRequestDispatcher("/Views/Tests/tests.jsp").forward(request, response);
    }

    private void getDeleteTest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var testId = Integer.parseInt(request.getParameter("testId"));
        request.setAttribute("testId", testId);
        request.getRequestDispatcher("/Views/Tests/delete_test.jsp").forward(request, response);
    }

    private void getAddTest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var techniciansList = DatabaseUtilizer.getTechniciansSelectionList();
        request.setAttribute("techniciansList", techniciansList);
        request.getRequestDispatcher("/Views/Tests/add_test.jsp").forward(request, response);
    }

    private void getEditTest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var testId = Integer.parseInt(request.getParameter("testId"));

        var techniciansList = DatabaseUtilizer.getTechniciansSelectionList();
        request.setAttribute("techniciansList", techniciansList);
        var test = DatabaseUtilizer.getTest(testId);

        request.setAttribute("test", test);
        request.getRequestDispatcher("/Views/Tests/edit_test.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var action = request.getParameter("action");
        if ("Delete".equals(action)) {
            deleteTest(request, response);
        } else if ("Update".equals(action)) {
            updateTest(request, response);
        } else {
            addTest(request, response);
        }
    }

    private void addTest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var test = new TestModel(0, request.getParameter("test_name"),  request.getParameter("unit"),request.getParameter("reference_levels"),new BigDecimal(request.getParameter("charges")), Integer.parseInt(request.getParameter("technician_id")));
        var isSuccess = DatabaseUtilizer.addTest(test);
    }

    private void updateTest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var test = new TestModel(Integer.parseInt(request.getParameter("test_id")), request.getParameter("test_name"), request.getParameter("unit"), request.getParameter("reference_levels"), new BigDecimal(request.getParameter("charges")), Integer.parseInt(request.getParameter("technician_id")));
        var isSuccess = DatabaseUtilizer.updateTest(test);
    }

    private void deleteTest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var testId = Integer.parseInt(request.getParameter("test_id"));
        var isSuccess = DatabaseUtilizer.deleteTest(testId);
    }

}
