/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Kelum
 */
public class TestsSelectionListModel {
    private int test_id; 
    private String test_name;
    
    public TestsSelectionListModel(int test_id, String test_name) {
        this.test_id = test_id;
        this.test_name = test_name;
    }

    public int getTest_id() {
        return test_id;
    }

    public String getTest_name() {
        return test_name;
    }
}
