/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Kelum
 */
public class LatestAppointmentsViewModel {
    private String appointment_date;
    private String appointment_time;
    private String technician_name;
    private String test_name;
    
    public LatestAppointmentsViewModel(String appointment_date, String appointment_time, String technician_name, String test_name) {
        this.appointment_date = appointment_date;
        this.appointment_time = appointment_time;
        this.technician_name = technician_name;
        this.test_name = test_name;
    }

    public String getAppointment_date() {
        return appointment_date;
    }

    public String getAppointment_time() {
        return appointment_time;
    }

    public String getTechnician_name() {
        return technician_name;
    }

    public String getTest_name() {
        return test_name;
    }
}
