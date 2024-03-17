/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models.Inherited;

/**
 *
 * @author Kelum
 */
public class PatientViewModel extends PatientModel{

    private String password_status;

    public PatientViewModel(int patient_id, String first_name, String last_name, String gender, int age, String address, String email, String phone_number, String password_status) {
        super(patient_id,first_name,last_name,gender,age,address,email,phone_number);
        this.password_status = password_status;
    }

    public String getPassword_status() {
        return password_status;
    }
}
