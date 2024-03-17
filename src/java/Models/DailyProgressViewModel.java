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
public class DailyProgressViewModel {
    private int completed_appointments;
    private BigDecimal income;

    public DailyProgressViewModel(int completed_appointments, BigDecimal income) {
        this.completed_appointments = completed_appointments;
        this.income = income;
    }

    public int getCompleted_appointments() {
        return completed_appointments;
    }

    public BigDecimal getIncome() {
        return income;
    }
}
