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
     public TestBaseModel(int test_id, String test_name, String reference_levels, String unit, BigDecimal charges) {
        this.test_id = test_id;
        this.test_name = test_name;
        this.reference_levels = reference_levels;
        this.unit = unit;
        this.charges = charges;
    }

    private int test_id;
    private String test_name;
    private String reference_levels;
    private String unit;
    private BigDecimal charges;

    public int getTest_id() {
        return test_id;
    }

    public String getTest_name() {
        return test_name;
    }

    public String getReference_levels() {
        return reference_levels;
    }

    public BigDecimal getCharges() {
        return charges;
    }

    public String getUnit() {
        return unit;
    }
}
