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
public class AppointmentModel extends AppointmentBaseModel {

    private int patient_id;
    private int test_id;
    private int user_id;
    private boolean is_cancelled;
    private String prescribed_by;

    public AppointmentModel(int appointment_id, int patient_id, int test_id, int user_id, String appointment_date, String appointment_time, boolean is_cancelled, String prescribed_by) {
        super(appointment_id, appointment_date, appointment_time);
        this.patient_id = patient_id;
        this.test_id = test_id;
        this.user_id = user_id;
        this.is_cancelled = is_cancelled;
        this.prescribed_by = prescribed_by;
    }

   

    public int getPatient_id() {
        return patient_id;
    }

    public int getTest_id() {
        return test_id;
    }

    public int getUser_id() {
        return user_id;
    }


    public boolean isIs_cancelled() {
        return is_cancelled;
    }

    public String getPrescribed_by() {
        return prescribed_by;
    }

}