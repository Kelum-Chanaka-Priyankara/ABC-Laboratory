/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import AppServices.DatabaseUtilizer;
import AppServices.EmailSender;
import Models.Inherited.PatientModel;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequestWrapper;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Kelum
 */
@WebServlet(name = "PatientsController", urlPatterns = {"/Patients"})
public class PatientsController extends HttpServlet {

//Get Methods
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
                    getEditPatient(request, response);
                } else if ("Add".equals(page)) {
                    getAddPatient(request, response);
                } else if ("Delete".equals(page)) {
                    getDeletePatient(request, response);
                } else {
                    getPatientsList(request, response);
                }
            }
        } else {
            response.sendRedirect("/ABCLaboratory");
        }
        
    }

    // Loading Patient Edit Page [Slected Patient Retrieved]
    private void getEditPatient(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var patientId = Integer.parseInt(request.getParameter("patientId"));
        var patient = DatabaseUtilizer.getPatient(patientId);
        request.setAttribute("patient", patient);
        request.getRequestDispatcher("/Views/Patients/edit_patient.jsp").forward(request, response);
    }

    //Loading Patient Add Page [No Data Retrieved]
    private void getAddPatient(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/Views/Patients/add_patient.jsp").forward(request, response);
    }

    //Loading Patient Delete Page [Selected Patient Retrieved]
    private void getDeletePatient(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var patientId = request.getParameter("patientId");
        request.setAttribute("patientId", patientId);
        request.getRequestDispatcher("/Views/Patients/delete_patient.jsp").forward(request, response);
    }

    // Loading Patients Page [Patients List Retrieved]
    protected void getPatientsList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var patientsList = DatabaseUtilizer.getPatientsList();
        request.setAttribute("patientsList", patientsList);
        request.getRequestDispatcher("/Views/Patients/patients.jsp").forward(request, response);
    }

//Post Methods
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var action = request.getParameter("action");

        if ("Delete".equals(action)) {
            deletePatient(request, response);
        } else if ("Update".equals(action)) {
            updatePatient(request, response);
        } else {
            addPatient(request, response);
             
        }
    }

    private void deletePatient(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var patientId = Integer.parseInt(request.getParameter("patient_id"));
        var isSuccess = DatabaseUtilizer.deletePatient(patientId);
    }

    private void updatePatient(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var patient = new PatientModel(Integer.parseInt(request.getParameter("patient_id")), request.getParameter("first_name"), request.getParameter("last_name"), request.getParameter("gender"), Integer.parseInt(request.getParameter("age")), request.getParameter("address"), request.getParameter("email"), request.getParameter("phone_number"));
        var isSuccess = DatabaseUtilizer.updatePatient(patient);
    }

    private void addPatient(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                       
        var patient = new PatientModel(0, request.getParameter("first_name"), request.getParameter("last_name"), request.getParameter("gender"), Integer.parseInt(request.getParameter("age")), request.getParameter("address"), request.getParameter("email"), request.getParameter("phone_number"));
        var isSuccess = DatabaseUtilizer.addPatient(patient);
    }

}
