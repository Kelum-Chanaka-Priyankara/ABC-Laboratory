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
public class TestBaseModel {

    public TestBaseModel(int test_id, String test_name, String unit, String reference_levels, BigDecimal charges) {
        this.test_id = test_id;
        this.test_name = test_name;
        this.unit = unit;
        this.reference_levels = reference_levels;
        this.charges = charges;
    }

    private int test_id;
    private String test_name;
    private String unit;
    private String reference_levels;
    private BigDecimal charges;

    public int getTest_id() {
        return test_id;
    }

    public String getTest_name() {
        return test_name;
    }
    
    public String getUnit() {
        return unit;
    }
    public String getReference_levels() {
        return reference_levels;
    }

    public BigDecimal getCharges() {
        return charges;
    }
}
