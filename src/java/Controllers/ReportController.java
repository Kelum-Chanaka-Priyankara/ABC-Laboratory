/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import AppServices.DatabaseUtilizer;
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
@WebServlet(name = "ReportController", urlPatterns = {"/Report"})
public class ReportController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var totalProgress = DatabaseUtilizer.getTotalProgress();
        List<String> progressDates = new ArrayList<>();
        List<BigDecimal> progressIncome = new ArrayList<>();

        for (var item : totalProgress) {
            progressDates.add("'" + item.getPayment_date() + "'");
            progressIncome.add(item.getIncome());
        }
        request.setAttribute("progressDates", progressDates);
        request.setAttribute("progressIncome", progressIncome);
        request.getRequestDispatcher("/Views/Reports/report_progress.jsp").forward(request, response);
    }
 
}
