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

    //Appointments Section -----------------------------------------------------
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
    //Appointments Section -----------------------------------------------------

    //Dashboard Section---------------------------------------------------------
    public static DailyProgressViewModel getDailyProgress() {
        DailyProgressViewModel progress = null;
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL get_report_daily_progress() }");
            var resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                progress = new DailyProgressViewModel(resultSet.getInt("completed_appointments"), resultSet.getBigDecimal("income"));
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return progress;
    }

    public static DailyIncomeViewModel getDailyIncome() {
        DailyIncomeViewModel incomeByMethod = null;
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL get_report_daily_income_by_payment_method() }");
            var resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                incomeByMethod = new DailyIncomeViewModel(resultSet.getString("payment_method"), resultSet.getBigDecimal("income"));
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return incomeByMethod;
    }

    public static int getDailyTests() {
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL get_report_daily_tests() }");
            var resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                return resultSet.getInt("tests_today");
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return 0;
    }

    public static int getDailyCustomers() {
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL get_report_daily_customers() }");
            var resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                return resultSet.getInt("customers_today");
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return 0;
    }

    public static int getDailyAppointments() {
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL get_report_daily_appointments() }");
            var resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                return resultSet.getInt("appointments_today");
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return 0;
    }

    public static List<LatestAppointmentsViewModel> getLatestAppointmentsList() {
        ArrayList<LatestAppointmentsViewModel> latestAppointmentsList = new ArrayList<>();
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL get_report_latest_appointments() }");
            var resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                var latestAppointment = new LatestAppointmentsViewModel(resultSet.getString("appointment_date"), resultSet.getString("appointment_time"), resultSet.getString("technician_name"), resultSet.getString("test_name"));
                latestAppointmentsList.add(latestAppointment);
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return latestAppointmentsList;
    }

    public static List<LatestPaymentsViewModel> getLatestPaymentsList() {
        ArrayList<LatestPaymentsViewModel> latestPaymentsList = new ArrayList<>();
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL get_report_latest_payments() }");
            var resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                var latestPayment = new LatestPaymentsViewModel(resultSet.getString("payment_date"), resultSet.getBigDecimal("charges"), resultSet.getString("payment_method"));
                latestPaymentsList.add(latestPayment);
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return latestPaymentsList;
    }

    public static List<TestPopularityViewModel> getPopularTestsList() {
        ArrayList<TestPopularityViewModel> testPopularityList = new ArrayList<>();
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL get_report_daily_popular_tests() }");
            var resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                var test = new TestPopularityViewModel(resultSet.getString("test_name"), resultSet.getInt("count"));
                testPopularityList.add(test);
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return testPopularityList;
    }

    public static List<ProgressModel> getLastWeekProgress() {
        ArrayList<ProgressModel> lastWeekPregress = new ArrayList<>();
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL get_report_last_week_progress()}");
            var resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                var dailyProgress = new ProgressModel(resultSet.getString("payment_date"), resultSet.getBigDecimal("income"));
                lastWeekPregress.add(dailyProgress);
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return lastWeekPregress;
    }

    public static List<ProgressModel> getThisWeekProgress() {

        ArrayList<ProgressModel> lastWeekPregress = new ArrayList<>();
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL get_report_weekly_progress()}");
            var resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {
                var dailyProgress = new ProgressModel(resultSet.getString("payment_date"), resultSet.getBigDecimal("income"));
                lastWeekPregress.add(dailyProgress);

            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return lastWeekPregress;
    }
    //Dashboard Section---------------------------------------------------------

    // Payment Section ---------------------------------------------------------
    //Payments
    public static List<PaymentViewModel> getPaymentsList() {
        ArrayList<PaymentViewModel> paymentsList = new ArrayList<>();
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL get_payments()}");
            var resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                var payment = new PaymentViewModel(resultSet.getInt("payment_id"), resultSet.getInt("appointment_id"), resultSet.getString("test_name"), resultSet.getBigDecimal("charges"), resultSet.getString("payment_method"), resultSet.getString("payment_status"));
                paymentsList.add(payment);
            }

        } catch (Exception e) {
        }
        return paymentsList;
    }

    public static PaymentModel getPayment(int paymentId) {
        PaymentModel payment = null;
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL get_payment(?)}");
            callableStatement.setInt(1, paymentId);
            var resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                payment = new PaymentModel(resultSet.getInt("payment_id"), resultSet.getInt("appointment_id"), resultSet.getString("test_name"), resultSet.getBigDecimal("charges"), resultSet.getString("payment_method"), resultSet.getBoolean("payment_status"), resultSet.getString("payment_date"), resultSet.getString("first_name"), resultSet.getString("last_name"), resultSet.getString("gender"), resultSet.getString("address"), resultSet.getString("email"), resultSet.getString("phone_number"));
            }
        } catch (Exception e) {
            System.err.println(e);
        }

        return payment;
    }

    public static boolean updatePayment(PaymentModel payment) {
        EmailSender mailsender = new EmailSender();
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL update_payment(?,?,?) }");
            callableStatement.setInt(1, payment.getPayment_id());
            callableStatement.setString(2, payment.getPayment_method());
            callableStatement.setBoolean(3, payment.isPayment_status());

            var rowsAffected = callableStatement.executeUpdate();
            if (rowsAffected > 0 && payment.isPayment_status()) {
                return mailsender.sendBill(
                        payment.getEmail(),
                        payment.getFirst_name(),
                        payment.getLast_name(),
                        payment.getGender(),
                        payment.getAddress(),
                        payment.getPhone_number(),
                        payment.getPayment_id(),
                        payment.getAppointment_id(),
                        payment.getPayment_date(),
                        payment.getTest_name(),
                        payment.getCharges().toString());
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return false;
    }
    //Payment Section ----------------------------------------------------------

    // Report Section ----------------------------------------------------------
    public static List<ProgressModel> getTotalProgress() {
        ArrayList<ProgressModel> totalProgress = new ArrayList<>();
        try (var connection = DatabaseConnector.getConnection()) {
            var callableStatement = connection.prepareCall("{ CALL get_report_total_progress()}");
            var resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                var dailyIncome = new ProgressModel(resultSet.getString("payment_date"), resultSet.getBigDecimal("income"));
                totalProgress.add(dailyIncome);
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return totalProgress;
    }
    // Report Section ----------------------------------------------------------
}
