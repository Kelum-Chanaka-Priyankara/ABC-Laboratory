/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models.Inherited;

import Models.Base.TestBaseModel;
import java.math.BigDecimal;

/**
 *
 * @author Kelum
 */
public class TestViewModel extends TestBaseModel {

    private String technician_name;

    public TestViewModel(int test_id, String test_name, String reference_levels, String unit, BigDecimal charges, String technician_name) {
        super(test_id, test_name, reference_levels, unit, charges);
        this.technician_name = technician_name;
    }

    public String getTechnician_name() {
        return technician_name;
    }
}