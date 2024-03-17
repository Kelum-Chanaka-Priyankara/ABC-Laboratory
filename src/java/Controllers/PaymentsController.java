/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import AppServices.DatabaseUtilizer;
import Models.Inherited.PaymentModel;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;

/**
 *
 * @author Kelum
 */
@WebServlet(name = "PaymentsController", urlPatterns = {"/Payments"})
public class PaymentsController extends HttpServlet {

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
                    getEditPayment(request, response);
                } else {
                    getPaymentsList(request, response);
                }
            }
        } else {
            response.sendRedirect("/ABCLaboratory");
        }
        
    }

    private void getEditPayment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var paymentId = Integer.parseInt(request.getParameter("paymentId"));
        var payment = DatabaseUtilizer.getPayment(paymentId);
        request.setAttribute("payment", payment);
        request.getRequestDispatcher("/Views/Payments/edit_payment.jsp").forward(request, response);
    }

    private void getPaymentsList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var paymentsList = DatabaseUtilizer.getPaymentsList();
        request.setAttribute("paymentsList", paymentsList);
        request.getRequestDispatcher("/Views/Payments/payments.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        updatePayment(request, response);
    }

    private void updatePayment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var payment = new PaymentModel(
                Integer.parseInt(request.getParameter("payment_id")),
                Integer.parseInt(request.getParameter("appointment_id")),
                request.getParameter("test_name"),
                new BigDecimal(request.getParameter("charges")), 
                request.getParameter("payment_method"), 
                (request.getParameter("payment_status") != null),
                request.getParameter("payment_date"),
                request.getParameter("first_name"),
                request.getParameter("last_name"),
                request.getParameter("gender"),
                request.getParameter("address"),
                request.getParameter("email"),
                request.getParameter("phone_number"));
        var isSucccess = DatabaseUtilizer.updatePayment(payment);
    }
}