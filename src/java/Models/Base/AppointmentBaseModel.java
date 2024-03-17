/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models.Base;

/**
 *
 * @author Kelum
 */
public class AppointmentBaseModel {

    public AppointmentBaseModel(int appointment_id, String appointment_date, String appointment_time) {
        this.appointment_id = appointment_id;
        this.appointment_date = appointment_date;
        this.appointment_time = appointment_time;
    }

    private int appointment_id;
    private String appointment_date;
    private String appointment_time;

    public int getAppointment_id() {
        return appointment_id;
    }

    public String getAppointment_date() {
        return appointment_date;
    }

    public String getAppointment_time() {
        return appointment_time;
    }
}
