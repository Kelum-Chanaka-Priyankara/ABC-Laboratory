/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.math.BigDecimal;

/**
 *
 * @author Kelum
 */
public class LatestPaymentsViewModel {
    private String payment_date;
    private BigDecimal charges;
    private String payment_method;
    
    public LatestPaymentsViewModel(String payment_date, BigDecimal charges, String payment_method) {
        this.payment_date = payment_date;
        this.charges = charges;
        this.payment_method = payment_method;
    }

    public String getPayment_date() {
        return payment_date;
    }

    public BigDecimal getCharges() {
        return charges;
    }

    public String getPayment_method() {
        return payment_method;
    }
}
