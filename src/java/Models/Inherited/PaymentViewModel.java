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
public class PaymentViewModel extends PaymentBaseModel{

    private String Payment_status;

    public PaymentViewModel(int payment_id, int appointment_id, String test_name, BigDecimal charges, String payment_method, String payment_status) {
        super(payment_id,appointment_id,test_name,charges,payment_method);
        this.Payment_status = payment_status;
    }

    public String getPayment_status() {
        return Payment_status;
    }

}
