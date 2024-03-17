/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Kelum
 */
public class TestPopularityViewModel {
    private String test_name;
    private int count;

    public TestPopularityViewModel(String test_name, int count) {
        this.test_name = test_name;
        this.count = count;
    }

    public String getTest_name() {
        return test_name;
    }

    public int getCount() {
        return count;
    }
}
