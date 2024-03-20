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
public class TestModel extends TestBaseModel {

    private int technician_id;

    public TestModel(int test_id, String test_name, String unit, String reference_levels, BigDecimal charges, int technician_id) {
        super(test_id, test_name, unit, reference_levels, charges);
        this.technician_id = technician_id;
    }

    public int getTechnician_id() {
        return technician_id;
    }

}
