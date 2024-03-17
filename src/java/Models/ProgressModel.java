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
public class ProgressModel {
    private String payment_date;
    private BigDecimal income;

    public ProgressModel(String payment_date, BigDecimal income) {
        this.payment_date = payment_date;
        this.income = income;
    }
    
   public String getPayment_date() {
        return payment_date;
    }

    public BigDecimal getIncome() {
        return income;
    }
}
