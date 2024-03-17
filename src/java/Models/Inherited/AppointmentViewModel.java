/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models.Inherited;

import Models.Base.AppointmentBaseModel;

/**
 *
 * @author Kelum
 */
public class AppointmentViewModel extends AppointmentBaseModel {

    private String patient_name;
    private String test_name;
    private String technician_name;
    private String cancelled_status;

    public AppointmentViewModel(int appointment_id, String patient_name, String test_name, String technician_name, String appointment_date, String appointment_time, String cancelled_status) {
        super(appointment_id, appointment_date, appointment_time);

        this.patient_name = patient_name;
        this.test_name = test_name;
        this.technician_name = technician_name;
        this.cancelled_status = cancelled_status;
    }

    public String getPatient_name() {
        return patient_name;
    }

    public String getTest_name() {
        return test_name;
    }

    public String getTechnician_name() {
        return technician_name;
    }

    public String getCancelled_status() {
        return cancelled_status;
    }

}