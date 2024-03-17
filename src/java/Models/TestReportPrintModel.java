/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Kelum
 */
public class TestReportPrintModel {
    private String patient_name;
    private String gender;
    private int age;
    private String phone_number;
    private int appointment_id;
    private String appointment_date;
    private String appointment_time;
    private String test_name;
    private String prescribed_by;
    private String test_date;
    private String test_time;
    private String technician_name;
    private String reference_levels;
    private String unit;
    private String report;

    public TestReportPrintModel(String patient_name, String gender, int age, String phone_number, int appointment_id, String appointment_date, String appointment_time, String test_name, String prescribed_by, String test_date, String test_time, String technician_name, String reference_levels, String unit, String report) {
        this.patient_name = patient_name;
        this.gender = gender;
        this.age = age;
        this.phone_number = phone_number;
        this.appointment_id = appointment_id;
        this.appointment_date = appointment_date;
        this.appointment_time = appointment_time;
        this.test_name = test_name;
        this.prescribed_by = prescribed_by;
        this.test_date = test_date;
        this.test_time = test_time;
        this.technician_name = technician_name;
        this.reference_levels = reference_levels;
        this.unit = unit;
        this.report = report;
    }

    public String getPatient_name() {
        return patient_name;
    }

    public String getGender() {
        return gender;
    }

    public int getAge() {
        return age;
    }

    public String getPhone_number() {
        return phone_number;
    }

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

    public String getPrescribed_by() {
        return prescribed_by;
    }

    public String getTest_date() {
        return test_date;
    }

    public String getTest_time() {
        return test_time;
    }

    public String getTechnician_name() {
        return technician_name;
    }

    public String getReference_levels() {
        return reference_levels;
    }

    public String getUnit() {
        return unit;
    }

    public String getReport() {
        return report;
    }
}
