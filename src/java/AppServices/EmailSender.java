/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AppServices;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Properties;
import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

/**
 *
 * @author Kelum
 */
public class EmailSender {
    private final String username = "info.abc.laboratories@gmail.com";
    private final String appPassword = "cgffywmsicblgvlk";
    private final Properties props;
    private final Session session;

    public EmailSender() {
        this.props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.starttls.enable", "true");

        this.session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, appPassword);
            }
        });
    }

    public boolean sendPassword(String recipientEmail, String firstName, String lastName, String gender, String password) {

        var userName = getFormattedUserName(firstName, lastName, gender);
        var htmlMailBody = getPasswordMailBody(userName, password);
        var mailSubject = "Welcome to ABC Laboratories";
        try {
            return sendMail(recipientEmail, mailSubject, htmlMailBody);
        } catch (KeyManagementException | NoSuchAlgorithmException e) {
            System.err.println(e);
        }
        return false;
    }

    public boolean sendBill(String recipientEmail, String firstName, String lastName, String gender, String address, String phoneNumber, int billNumber, int appointmentNumber, String paymentDate, String testName, String charges) {

        var userName = getFormattedUserName(firstName, lastName, gender);
        var htmlMailBody = getInvoiceMailBody(userName, address, phoneNumber, billNumber, appointmentNumber, paymentDate, testName, charges);
        var mailSubject = "ABC Laboratories - Payment Confirmation ";
        try {
            return sendMail(recipientEmail, mailSubject, htmlMailBody);
        } catch (KeyManagementException | NoSuchAlgorithmException e) {
            System.err.println(e);
        }
        return false;
    }

    private String getFormattedUserName(String firstName, String lastName, String gender) {
        var title = ("Male".equals(gender)) ? "Mr. " : "Ms. ";
        var patientName = title + firstName + " " + lastName;
        return patientName;
    }

    private String getPasswordMailBody(String userName, String password) {
        String passwordMailBody
                = "<div style=\"font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #fff;\">"
                + "<div style=\"max-width: 600px; margin: 0 auto; padding: 20px; background-color: #fff; border-radius: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);\">"
                + "<div style=\"background-color: #063970; color: #fff; padding: 20px; text-align: center; border-radius: 10px 10px 0 0;\">"
                + "<h1>Welcome to the ABC Laboratories</h1>"
                + "</div>"
                + "<div style=\"max-width: 600px; margin: 0 auto; padding: 20px;\">"
                + "<p style=\"color: #333;\"> Dear " + userName + ",</p>"
                + "<p style=\"color: #333;\">Your account has been successfully created. Below is your system-generated password. </p>"
                + "<div style=\"padding: 20px; text-align: center;\">"
                + "<p>Please use this password to log in to our system:</p>"
                + "<p style=\"font-size: 24px; font-weight: bold; color: #333; padding: 10px; border: 1px solid #ddd; border-radius: 5px; margin-bottom: 20px;\">" + password + "</p>"
                + "<a href=\"http://localhost:8080/ABCLab/Login?page=signin\" style=\"display: inline-block; padding: 10px 20px; background-color: #063970; color: #fff; text-decoration: none; border-radius: 5px;\">Log In Now</a>"
                + "</div>"
                + "<p style=\"color: #333;\">For security reasons, we recommend that you change your password after logging in for the first time. You can do this by visiting the 'Change Password' section in our application.</p>"
                + "<p style=\"color: #333;\">If you have any questions or need further assistance, please feel free to contact us at [Company Contact Information].</p>"
                + "<p style=\"color: #333;\">Thank you for choosing ABC Laboratories.</p>"
                + "</div>"
                + "</div>"
                + "</div>";

        return passwordMailBody;
    }

    private String getInvoiceMailBody(String userName, String address, String phoneNumber, int billNumber, int appointmentNumber, String paymentDate, String testName, String charges) {
        String invoiceMailBody = "<div style=\"max-width: 600px; margin: 0 auto; padding: 20px; background-color: #fff; border-radius: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);\"> "
                + "<div style=\"background-color: #063970; color: #fff; padding: 20px; text-align: center; border-radius: 10px 10px 0 0;\">"
                + "<h1>ABC Laboratories</h1></div>"
                + "<div style=\"padding: 20px;\">"
                + "<div style=\"display: flex; justify-content: space-between; border-bottom: 1px solid #ddd; padding-bottom: 10px; margin-bottom: 20px;\">"
                + "<div style=\"width: 50%;flex:1;\">"
                + "<h4>To</h4>"
                + "<p>" + userName + "</p>"
                + "<p>" + address + "</p>"
                + "<p>" + phoneNumber + "</p>"
                + "</div>"
                + "<div style=\"width: 50%; flex:1;\"> "
                + "<h4>Bill Info</h4> "
                + "<p>Bill No:" + billNumber + "</p> "
                + "<p>Appointment No:" + appointmentNumber + "</p> "
                + "<p>Date:" + paymentDate + "</p> "
                + "</div> "
                + "</div>"
                + "<table style=\"width: 100%; border-collapse: collapse;\">"
                + "<thead> "
                + "<tr style=\"background-color: #063970; color: #fff;\">"
                + "<th style=\"padding: 8px; width:80%;\">Test Description</th>"
                + "<th style=\"padding: 8px; width:20%;\">Amount</th>"
                + "</tr>"
                + "</thead>"
                + "<tbody>"
                + "<tr>"
                + "<td style=\"border-bottom: 1px solid #ddd; padding: 8px;\">" + testName + "</td>"
                + "<td style=\"border-bottom: 1px solid #ddd; padding: 8px;\">$" + charges + "</td>"
                + "</tr>"
                + "</tbody>"
                + "<tfoot>"
                + "<tr> "
                + "<td style=\"padding: 8px; font-weight: bold;\">Total</td>"
                + "<td style=\"padding: 8px; font-weight: bold;\">$" + charges + "</td>"
                + "</tr>"
                + "<tr> "
                + "<td style=\"padding: 8px;\"> </td>"
                + "<td style=\"padding: 8px; font-size:24px;font-weight: bold;color:#43ac6a;\">Paid</td>"
                + "</tr>"
                + "</tfoot>"
                + "</table>"
                + "<div style=\"margin-top: 20px;\">"
                + "</div>"
                + "<br/>"
                + "<p style=\"color: #333;\">Thank you for choosing ABC Laboratories.</p>"
                + "</div>"
                + "</div>";

        return invoiceMailBody;
    }

    private boolean sendMail(String mailRecipient, String mailSubject, String mailBody)
            throws NoSuchAlgorithmException, KeyManagementException {
        SSLContext ctx = SSLContext.getInstance("TLS");
        ctx.init(new KeyManager[0], new TrustManager[]{new DefaultTrustManager()}, new SecureRandom());
        SSLContext.setDefault(ctx);
        try {

            var message = new MimeMessage(session);

            message.setFrom(new InternetAddress("stylist.confirmation@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailRecipient));
            message.setSubject(mailSubject);
//              message.setText("This is the message body");
            message.setContent(mailBody, "text/html");
            Transport.send(message);
//            System.out.println("Email sent successfully");
            return true;
        } catch (MessagingException e) {
            System.err.println(e);
        }
        return false;
    }

    private static class DefaultTrustManager implements X509TrustManager {

        @Override
        public void checkClientTrusted(X509Certificate[] arg0, String arg1) throws CertificateException {
        }

        @Override
        public void checkServerTrusted(X509Certificate[] arg0, String arg1) throws CertificateException {
        }

        @Override
        public X509Certificate[] getAcceptedIssuers() {
            return null;
        }
    }
}

