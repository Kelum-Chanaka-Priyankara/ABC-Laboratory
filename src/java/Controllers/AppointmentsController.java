/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import AppServices.DatabaseUtilizer;
import Models.Inherited.AppointmentModel;
import com.google.gson.Gson;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Kelum
 */
@WebServlet(name = "AppointmentsController", urlPatterns = {"/Appointments"})
public class AppointmentsController extends HttpServlet {

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
                    getEditAppointment(request, response);
                } else if ("Add".equals(page)) {
                    getAddAppointment(request, response);
                } else if ("Delete".equals(page)) {
                    getDeleteAppointment(request, response);
                } else if ("TestsList".equals(page)) {
                    getTestsSelectionList(request, response);
                } else {
                    getAppointmentsList(request, response);
                }
            }
        } else {
            response.sendRedirect("/ABCLaboratory");
        }

    }

    protected void getEditAppointment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var appointmentId = Integer.parseInt(request.getParameter("appointmentId"));

        var patientsList = DatabaseUtilizer.getPatientsSelectionList();
        request.setAttribute("patientsList", patientsList);

        var techniciansList = DatabaseUtilizer.getTechniciansSelectionList();
        request.setAttribute("techniciansList", techniciansList);

        var appointment = DatabaseUtilizer.getAppointment(appointmentId);
        request.setAttribute("appointment", appointment);

        var testsList = DatabaseUtilizer.getTestsSelectionList(appointment.getUser_id());
        request.setAttribute("testsList", testsList);
        request.getRequestDispatcher("/Views/Appointments/edit_appointment.jsp").forward(request, response);
    }

    protected void getAddAppointment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var patientsList = DatabaseUtilizer.getPatientsSelectionList();
        request.setAttribute("patientsList", patientsList);

        var techniciansList = DatabaseUtilizer.getTechniciansSelectionList();
        request.setAttribute("techniciansList", techniciansList);

        request.getRequestDispatcher("/Views/Appointments/add_appointment.jsp").forward(request, response);
    }

    protected void getDeleteAppointment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var appointmentId = request.getParameter("appointmentId");
        request.setAttribute("appointmentId", appointmentId);
        request.getRequestDispatcher("/Views/Appointments/delete_appointment.jsp").forward(request, response);
    }

    private void getTestsSelectionList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var id = request.getParameter("technicianId");
        if (id != null) {
            int technicianId = Integer.parseInt(id);
            var testsSelectionList = DatabaseUtilizer.getTestsSelectionList(technicianId);
            var testsJsonList = new Gson().toJson(testsSelectionList);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(testsJsonList);
        }
    }

    protected void getAppointmentsList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var appointmentList = DatabaseUtilizer.getAppointmentsList();
        request.setAttribute("appointmentList", appointmentList);
        request.getRequestDispatcher("/Views/Appointments/appointments.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var action = request.getParameter("action");
        if ("Delete".equals(action)) {
            deleteAppointment(request, response);
        } else if ("Update".equals(action)) {
            updateAppointment(request, response);
        } else {
            addAppointment(request, response);
        }
    }

    protected void deleteAppointment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var appointmentId = Integer.parseInt(request.getParameter("appointment_id"));
        var isSuccess = DatabaseUtilizer.deleteAppointment(appointmentId);
    }

    protected void updateAppointment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var appointment = new AppointmentModel(Integer.parseInt(request.getParameter("appointment_id")), Integer.parseInt(request.getParameter("patient_id")), Integer.parseInt(request.getParameter("test_id")), Integer.parseInt(request.getParameter("technician_id")), request.getParameter("appointment_date"), request.getParameter("appointment_time"), "on".equals(request.getParameter("is_cancelled")), request.getParameter("prescribed_by"));
        var isSuccess = DatabaseUtilizer.updateAppointment(appointment);

    }

    protected void addAppointment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var isSuccess = DatabaseUtilizer.addAppointment(request.getParameter("appointment_date"), request.getParameter("appointment_time"), Integer.parseInt(request.getParameter("patient_id")), Integer.parseInt(request.getParameter("technician_id")), Integer.parseInt(request.getParameter("test_id")), request.getParameter("prescribed_by"));
    }

}
