/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import AppServices.DatabaseUtilizer;
import com.mysql.cj.conf.DatabaseUrlContainer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kelum
 */
@WebServlet(name = "DashboardController", urlPatterns = {"/Dashboard"})
public class DashboardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        var session = request.getSession(false);
        if (session != null) {
            String authType = (String) session.getAttribute("authType");
            if (authType == null) {
                response.sendRedirect("/ABCLaboratory/Login?page=signin");
            } else {
                getDashboard(request,response);
            }
        } else {
            response.sendRedirect("/ABCLaboratory");
        }

    }

    private void getDashboard(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var progress = DatabaseUtilizer.getDailyProgress();
        request.setAttribute("progress", progress);

        var income = DatabaseUtilizer.getDailyIncome();
        request.setAttribute("income", income);

        var testsCount = DatabaseUtilizer.getDailyTests();
        request.setAttribute("testsCount", testsCount);

        var customersCount = DatabaseUtilizer.getDailyCustomers();
        request.setAttribute("customersCount", customersCount);

        var appointmentsCount = DatabaseUtilizer.getDailyAppointments();
        request.setAttribute("appointmentsCount", appointmentsCount);

        var latestAppointmentsList = DatabaseUtilizer.getLatestAppointmentsList();
        request.setAttribute("latestAppointmentsList", latestAppointmentsList);

        var latestPaymentsList = DatabaseUtilizer.getLatestPaymentsList();
        request.setAttribute("latestPaymentsList", latestPaymentsList);

        //Chart 1
        var popularTests = DatabaseUtilizer.getPopularTestsList();
        List<String> popularTestNames = new ArrayList<>();
        List<Integer> popularTestCounts = new ArrayList<>();

        for (var item : popularTests) {
            popularTestNames.add("'" + item.getTest_name() + "'");
            popularTestCounts.add(item.getCount());
        }
        request.setAttribute("popularTestNames", popularTestNames);
        request.setAttribute("popularTestCounts", popularTestCounts);

        //Chart 2
        var lastWeekProgress = DatabaseUtilizer.getLastWeekProgress();
        List<String> lastWeekDates = new ArrayList<>();
        List<BigDecimal> lastWeekIncome = new ArrayList<>();

        for (var item : lastWeekProgress) {
            lastWeekDates.add("'" + item.getPayment_date() + "'");
            lastWeekIncome.add(item.getIncome());
        }
        request.setAttribute("lastWeekDates", lastWeekDates);
        request.setAttribute("lastWeekIncome", lastWeekIncome);

        //Chart 3
        var thisWeekProgress = DatabaseUtilizer.getThisWeekProgress();
        List<String> thisWeekDates = new ArrayList<>();
        List<BigDecimal> thisWeekIncome = new ArrayList<>();

        for (var item : thisWeekProgress) {
            thisWeekDates.add("'" + item.getPayment_date() + "'");
            thisWeekIncome.add(item.getIncome());
        }
        request.setAttribute("thisWeekDates", thisWeekDates);
        request.setAttribute("thisWeekIncome", thisWeekIncome);

        request.getRequestDispatcher("/Views/Dashboard/dashboard.jsp").forward(request, response);
    }

}
