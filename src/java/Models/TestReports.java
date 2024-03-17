/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Kelum
 */
public class TestReports {
    int test_report_id;
    int technician_id;
    String test_time;
    int appointment_id;
    int test_id;
    String report;
    boolean report_status;
    boolean is_cancelled;

    public TestReports(int test_report_id, int technician_id, String test_time, int appointment_id, int test_id, String report, boolean report_status, boolean is_cancelled) {
        this.test_report_id = test_report_id;
        this.technician_id = technician_id;
        this.test_time = test_time;
        this.appointment_id = appointment_id;
        this.test_id = test_id;
        this.report = report;
        this.report_status = report_status;
        this.is_cancelled = is_cancelled;
    }

    public int getTest_report_id() {
        return test_report_id;
    }

    public void setTest_report_id(int test_report_id) {
        this.test_report_id = test_report_id;
    }

    public int getTechnician_id() {
        return technician_id;
    }

    public void setTechnician_id(int technician_id) {
        this.technician_id = technician_id;
    }

    public String getTest_time() {
        return test_time;
    }

    public void setTest_time(String test_time) {
        this.test_time = test_time;
    }

    public int getAppointment_id() {
        return appointment_id;
    }

    public void setAppointment_id(int appointment_id) {
        this.appointment_id = appointment_id;
    }

    public int getTest_id() {
        return test_id;
    }

    public void setTest_id(int test_id) {
        this.test_id = test_id;
    }

    public String getReport() {
        return report;
    }

    public void setReport(String report) {
        this.report = report;
    }

    public boolean isReport_status() {
        return report_status;
    }

    public void setReport_status(boolean report_status) {
        this.report_status = report_status;
    }

    public boolean isIs_cancelled() {
        return is_cancelled;
    }

    public void setIs_cancelled(boolean is_cancelled) {
        this.is_cancelled = is_cancelled;
    }

}
