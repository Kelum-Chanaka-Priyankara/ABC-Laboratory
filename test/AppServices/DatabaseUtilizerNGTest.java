/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/EmptyTestNGTest.java to edit this template
 */
package AppServices;

import Models.DailyIncomeViewModel;
import Models.DailyProgressViewModel;
import Models.Inherited.AppointmentModel;
import Models.Inherited.PatientModel;
import Models.Inherited.PaymentModel;
import Models.Inherited.TestModel;
import Models.Inherited.UserModel;
import Models.LoginUserModel;
import Models.TestReportPrintModel;
import java.math.BigDecimal;
import java.util.List;
import static org.testng.Assert.*;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

/**
 *
 * @author Kelum
 */
public class DatabaseUtilizerNGTest {

    public DatabaseUtilizerNGTest() {
    }

    @BeforeClass
    public static void setUpClass() throws Exception {
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
    }

    @BeforeMethod
    public void setUpMethod() throws Exception {
    }

    @AfterMethod
    public void tearDownMethod() throws Exception {
    }

    @Test
    public void testGetAppointmentsList() {
        System.out.println("getAppointmentsList");
        assertNotNull(DatabaseUtilizer.getAppointmentsList());
    }

    @Test
    public void testGetAppointment() {
        System.out.println("getAppointment");
        assertNotNull(DatabaseUtilizer.getAppointment(1));
    }

    @Test
    public void testAddAppointment() {
        System.out.println("addAppointment");
        assertTrue(DatabaseUtilizer.addAppointment("2024-03-25", "13:30:00", 1, 5, 1, "Dr. Manula"));
    }

    @Test
    public void testUpdateAppointment() {
        System.out.println("updateAppointment");
        assertTrue(DatabaseUtilizer.updateAppointment(new AppointmentModel(6, 0, 0, 0, "2024-03-23", "14:00:00", false, "Dr. Manula Subasinghe")));
    }

    @Test
    public void testDeleteAppointment() {
        System.out.println("deleteAppointment");
        assertTrue(DatabaseUtilizer.deleteAppointment(6));
    }

    @Test
    public void testGetTechniciansSelectionList() {
        System.out.println("getTechniciansSelectionList");
        assertNotNull(DatabaseUtilizer.getTechniciansSelectionList());
    }

    @Test
    public void testGetPatientsSelectionList() {
        System.out.println("getPatientsSelectionList");
        assertNotNull(DatabaseUtilizer.getPatientsSelectionList());
    }

    @Test
    public void testGetTestsSelectionList() {
        System.out.println("getTestsSelectionList");
        assertNotNull(DatabaseUtilizer.getTestsSelectionList(1));
    }

    @Test
    public void testGetPaymentsList() {
        System.out.println("getPaymentsList");
        assertNotNull(DatabaseUtilizer.getPaymentsList());
    }

    @Test
    public void testGetPayment() {
        System.out.println("getPayment");
        assertNotNull(DatabaseUtilizer.getPayment(5));
    }

    @Test
    public void testUpdatePayment() {
        System.out.println("updatePayment");
        assertTrue(DatabaseUtilizer.updatePayment(new PaymentModel(6, 0, "", new BigDecimal(0.00), "", true, "", "", "", "", "", "kelum.chanaka@gmail.com", "")));
    }

    @Test
    public void testGetTestsList() {
        System.out.println("getTestsList");
        assertNotNull(DatabaseUtilizer.getTestsList());
    }

    @Test
    public void testGetTest() {
        System.out.println("getTest");
        assertNotNull(DatabaseUtilizer.getTest(5));
    }

    @Test
    public void testAddTest() {
        System.out.println("addTest");
        assertTrue(DatabaseUtilizer.addTest(new TestModel(0, "new Test", "", "No Reference levels are expected", new BigDecimal(100.00), 5)));
    }

    @Test
    public void testUpdateTest() {
        System.out.println("updateTest");
        assertFalse(DatabaseUtilizer.updateTest(null));
    }

    @Test
    public void testDeleteTest() {
        System.out.println("deleteTest");
        assertTrue(DatabaseUtilizer.deleteTest(7));
    }

    @Test
    public void testGetUsersList() {
        System.out.println("getUsersList");
        assertNotNull(DatabaseUtilizer.getUsersList());
    }

    @Test
    public void testGetUser() {
        System.out.println("getUser");
        assertNotNull(DatabaseUtilizer.getUser(2));
    }

    @Test
    public void testAddUser() {
        System.out.println("addUser");
        assertFalse(DatabaseUtilizer.addUser(null));
    }

    @Test
    public void testUpdateUser() {
        System.out.println("updateUser");
        assertFalse(DatabaseUtilizer.updateUser(null));
    }

    @Test
    public void testDeleteUser() {
        System.out.println("deleteUser");
        assertTrue(DatabaseUtilizer.deleteUser(5));
    }

    @Test
    public void testGetTechnicianTestsList() {
        System.out.println("getTechnicianTestsList");
        assertNotNull(DatabaseUtilizer.getTechnicianTestsList(1));
    }

    @Test
    public void testUpdateTechnicianTestReport() {
        System.out.println("updateTechnicianTestReport");
        assertTrue(DatabaseUtilizer.updateTechnicianTestReport(1, "2024-03-22", "10:00:00", "Test Passed"));
    }

    @Test
    public void testGetVisitorAppointmentsList() {
        System.out.println("getVisitorAppointmentsList");
        assertNotNull(DatabaseUtilizer.getVisitorAppointmentsList(1));
    }

    @Test
    public void testGetPrintableTestReport() {
        System.out.println("getPrintableTestReport");
        assertNotNull(DatabaseUtilizer.getPrintableTestReport(1));
    }

    @Test
    public void testSignIn() {
        System.out.println("signIn");
        assertNotNull(DatabaseUtilizer.signIn( "jemmarobinson@mail.com", "Abc@123"));
    }

    @Test
    public void testSignInPrivilege() {
        System.out.println("signIn");
        LoginUserModel result = DatabaseUtilizer.signIn( "jemmarobinson@mail.com", "Abc@123");
        assertEquals(result.getPrivilege(), "tcnc");
    }

    @Test
    public void testSignInIsPasswordChanged() {
        System.out.println("signIn");
        LoginUserModel result = DatabaseUtilizer.signIn( "jemmarobinson@mail.com", "Abc@123");
        assertFalse(result.isPassword_changed());
    }

    @Test
    public void testChangePassword() {
        System.out.println("changePassword");
        assertTrue(DatabaseUtilizer.changePassword("patients", "patient_id", 1, "Abc@123", "Asd@123"));
    }
}
