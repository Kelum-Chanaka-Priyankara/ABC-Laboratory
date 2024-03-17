/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models.Inherited;

import Models.Base.PatientBaseModel;

/**
 *
 * @author Kelum
 */
public class PatientModel extends PatientBaseModel{

    private String gender;
    private int age;
    private String address;
    private String email;
    private String phone_number;

    public PatientModel(int patient_id, String first_name, String last_name, String gender, int age, String address, String email, String phone_number) {
        super(patient_id,first_name,last_name);
        this.gender = gender;
        this.age = age;
        this.address = address;
        this.email = email;
        this.phone_number = phone_number;
    }

 
    public String getGender() {
        return gender;
    }

    public int getAge() {
        return age;
    }

    public String getAddress() {
        return address;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone_number() {
        return phone_number;
    }

}