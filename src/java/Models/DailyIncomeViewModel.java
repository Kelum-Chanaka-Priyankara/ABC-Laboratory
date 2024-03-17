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
public class DailyIncomeViewModel {
    private String payment_method;
    private BigDecimal income;

    public DailyIncomeViewModel(String payment_method, BigDecimal income) {
        this.payment_method = payment_method;
        this.income = income;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public BigDecimal getIncome() {
        return income;
    }
}
