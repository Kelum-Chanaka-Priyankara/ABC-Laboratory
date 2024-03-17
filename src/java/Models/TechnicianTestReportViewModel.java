/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Kelum
 */
public class TechnicianTestReportViewModel {
    
    private int appointment_id;
    private String patient_name;
    private String gender;
    private int age;
    private String appointment_date;
    private String appointment_time;
    private String test_name;
    private String reference_levels;
    private String unit;
    private String report;
    private int test_report_id;

    public TechnicianTestReportViewModel(int appointment_id, String patient_name, String gender, int age, String appointment_date, String appointment_time, String test_name, String reference_levels, String unit, String report, int test_report_id) {
        this.appointment_id = appointment_id;
        this.patient_name = patient_name;
        this.gender = gender;
        this.age = age;
        this.appointment_date = appointment_date;
        this.appointment_time = appointment_time;
        this.test_name = test_name;
        this.reference_levels = reference_levels;
        this.unit = unit;
        this.report = report;
        this.test_report_id = test_report_id;
    }

    public int getAppointment_id() {
        return appointment_id;
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

    public String getAppointment_date() {
        return appointment_date;
    }

    public String getAppointment_time() {
        return appointment_time;
    }

    public String getTest_name() {
        return test_name;
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

    public int getTest_report_id() {
        return test_report_id;
    }
}
