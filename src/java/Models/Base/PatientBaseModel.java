/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models.Base;

/**
 *
 * @author Kelum
 */
public class PatientBaseModel {
    public PatientBaseModel(int patient_id, String first_name, String last_name) {
        this.patient_id = patient_id;
        this.first_name = first_name;
        this.last_name = last_name;
    }
    private int patient_id;
    private String first_name;
    private String last_name;

    public int getPatient_id() {
        return patient_id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public String getLast_name() {
        return last_name;
    }
}
