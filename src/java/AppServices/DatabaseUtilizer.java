/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AppServices;

import Models.Inherited.AppointmentModel;
import Models.Inherited.AppointmentViewModel;
import Models.DailyIncomeViewModel;
import Models.DailyProgressViewModel;
import Models.LatestAppointmentsViewModel;
import Models.LatestPaymentsViewModel;
import Models.LoginUserModel;
import Models.Inherited.PatientModel;
import Models.Inherited.PatientsSelectionListModel;
import Models.Inherited.PatientViewModel;
import Models.Inherited.PaymentViewModel;
import Models.Inherited.PaymentModel;
import Models.TechnicianTestReportViewModel;
import Models.TechniciansSelectionListModel;
import Models.TestReports;
import Models.Inherited.TestViewModel;
import Models.Inherited.TestModel;
import Models.TestPopularityViewModel;
import Models.TestReportPrintModel;
import Models.TestsSelectionListModel;
import Models.Inherited.UserViewModel;
import Models.Inherited.UserModel;
import Models.VisitorAppointmentViewModel;
import Models.ProgressModel;
import com.mysql.cj.conf.PropertyKey;
import com.mysql.cj.jdbc.CallableStatement;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kelum
 */
public class DatabaseUtilizer {

   
    
    //Appointments
    public static List<AppointmentViewModel> getAppointmentsList() {
        var appointmentsList = new ArrayList<AppointmentViewModel>();
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL get_appointments() }");
            var resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                var appointment = new AppointmentViewModel(resultSet.getInt("appointment_id"), resultSet.getString("patient_name"), resultSet.getString("test_name"), resultSet.getString("technician_name"), resultSet.getString("appointment_date"), resultSet.getString("appointment_time"), resultSet.getString("cancelled_status"));
                appointmentsList.add(appointment);
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return appointmentsList;
    }

    public static AppointmentModel getAppointment(int appointmentId) {
        AppointmentModel appointment = null;
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL get_appointment(?) }");
            callableStatement.setInt(1, appointmentId);
            var resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                appointment = new AppointmentModel(resultSet.getInt("appointment_id"), resultSet.getInt("patient_id"), resultSet.getInt("test_id"), resultSet.getInt("user_id"), resultSet.getString("appointment_date"), resultSet.getString("appointment_time"), resultSet.getBoolean("is_cancelled"), resultSet.getString("prescribed_by"));
            }
        } catch (Exception e) {
        }
        return appointment;
    }

    public static boolean addAppointment(String appointmentDate, String appointmentTime, int patientId, int technicianId, int testId, String prescribedBy) {
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{call add_appointment(?,?,?,?,?,?)}");
            callableStatement.setString(1, appointmentDate);
            callableStatement.setString(2, appointmentTime);
            callableStatement.setInt(3, patientId);
            callableStatement.setInt(4, technicianId);
            callableStatement.setInt(5, testId);
            callableStatement.setString(6, prescribedBy);
            var rowsAffected = callableStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println(e);
        }
        return false;
    }

    public static boolean updateAppointment(AppointmentModel appointment) {
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL update_appointment(?,?,?,?,?,?,?,?) }");
            callableStatement.setInt(1, appointment.getAppointment_id());
            callableStatement.setInt(2, appointment.getPatient_id());
            callableStatement.setInt(3, appointment.getTest_id());
            callableStatement.setInt(4, appointment.getUser_id());
            callableStatement.setString(5, appointment.getAppointment_date());
            callableStatement.setString(6, appointment.getAppointment_time());
            callableStatement.setBoolean(7, appointment.isIs_cancelled());
            callableStatement.setString(8, appointment.getPrescribed_by());
            var rowsAffected = callableStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            System.err.println(e);
        }
        return false;
    }

    public static boolean deleteAppointment(int appointmentId) {
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL delete_appointment(?) }");
            callableStatement.setInt(1, appointmentId);
            var rowsAffected = callableStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
        }
        return false;
    }

    public static List<TechniciansSelectionListModel> getTechniciansSelectionList() {
        ArrayList<TechniciansSelectionListModel> techniciansSelectionList = new ArrayList<>();
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL get_technicians_selection_list() }");
            var resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                var selectionItem = new TechniciansSelectionListModel(resultSet.getInt("user_id"), resultSet.getString("first_name"), resultSet.getString("last_name"));
                techniciansSelectionList.add(selectionItem);
            }
        } catch (Exception e) {
        }
        return techniciansSelectionList;
    }

    public static List<PatientsSelectionListModel> getPatientsSelectionList() {
        ArrayList<PatientsSelectionListModel> patientsSelectionList = new ArrayList<>();
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL get_patients_selection_list() }");
            var resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                var selectionItem = new PatientsSelectionListModel(resultSet.getInt("patient_id"), resultSet.getString("first_name"), resultSet.getString("last_name"));
                patientsSelectionList.add(selectionItem);
            }
        } catch (Exception e) {
        }
        return patientsSelectionList;
    }

    public static List<TestsSelectionListModel> getTestsSelectionList(int Id) {
        ArrayList<TestsSelectionListModel> testsSelectionList = new ArrayList<>();
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL get_tests_selection_list(?) }");
            callableStatement.setInt(1, Id);
            var resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                var selectionItem = new TestsSelectionListModel(resultSet.getInt("test_id"), resultSet.getString("test_name"));
                testsSelectionList.add(selectionItem);
            }
        } catch (Exception e) {
        }
        return testsSelectionList;
    }

   
   

    

    

   

    

    

   
    

    
    
    

   
    
   
    

    
   
}


