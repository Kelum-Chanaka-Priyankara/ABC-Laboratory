/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models.Inherited;

import Models.Base.PaymentBaseModel;
import java.math.BigDecimal;

/**
 *
 * @author Kelum
 */
public class PaymentModel extends PaymentBaseModel {

    private boolean payment_status;
    private String payment_date;
    private String first_name;
    private String last_name;
    private String gender;
    private String address;
    private String email;
    private String phone_number;

    public PaymentModel(int payment_id,
            int appointment_id,
            String test_name,
            BigDecimal charges,
            String payment_method,
            boolean payment_status,
            String payment_date,
            String first_name,
            String last_name,
            String gender,
            String address,
            String email,
            String phone_number
    ) {
        super(payment_id, appointment_id, test_name, charges, payment_method);
        this.payment_status = payment_status;
        this.payment_date = payment_date;
        this.first_name = first_name;
        this.last_name = last_name;
        this.gender = gender;
        this.address = address;
        this.email = email;
        this.phone_number = phone_number;
    }

    public boolean isPayment_status() {
        return payment_status;
    }

    public String getPayment_date() {
        return payment_date;
    }

    public String getFirst_name() {
        return first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public String getGender() {
        return gender;
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