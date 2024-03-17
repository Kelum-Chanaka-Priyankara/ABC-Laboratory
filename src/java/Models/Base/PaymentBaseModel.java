/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models.Base;

import java.math.BigDecimal;

/**
 *
 * @author Kelum
 */
public class PaymentBaseModel {
    public PaymentBaseModel(int payment_id, int appointment_id, String test_name, BigDecimal charges, String payment_method) {
        this.payment_id = payment_id;
        this.appointment_id = appointment_id;
        this.test_name = test_name;
        this.charges = charges;
        this.payment_method = payment_method;
    }
    
    private int payment_id;
    private int appointment_id;
    private String test_name;
    private BigDecimal charges;
    private String payment_method;

    public int getPayment_id() {
        return payment_id;
    }

    public int getAppointment_id() {
        return appointment_id;
    }

    public String getTest_name() {
        return test_name;
    }

    public BigDecimal getCharges() {
        return charges;
    }

    public String getPayment_method() {
        return payment_method;
    }
}
