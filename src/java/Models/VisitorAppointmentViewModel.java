/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Kelum
 */
public class VisitorAppointmentViewModel {
    public VisitorAppointmentViewModel(int appointment_id, String appointment_date, String appointment_time, String test_name, String report) {
        this.appointment_id = appointment_id;
        this.appointment_date = appointment_date;
        this.appointment_time = appointment_time;
        this.test_name = test_name;
        this.report = report;
    }
    private int appointment_id;
    private String appointment_date;
    private String appointment_time;
    private String test_name;
    private String report;

    public int getAppointment_id() {
        return appointment_id;
    }

    public String getAppointment_date() {
        return appointment_date;
    }

    public String getAppointment_time() {
        return appointment_time;
    }

    public String getTest_name() {
        return test_name;
    }

    public String getReport() {
        return report;
    }
}
