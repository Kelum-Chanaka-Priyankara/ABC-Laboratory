<%-- 
    Document   : report
    Created on : Mar 17, 2024, 6:19:07 PM
    Author     : Kelum
--%>


<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css">
        <title>Medical Report</title>
    </head>

    <body style="font-family: Arial, sans-serif; margin: 0; padding: 0;">

    <page size="A4" class="Print-Area">
        <div style="background-color: #063970; color: #fff; padding: 10px; text-align: center; border-radius: 5px 5px 0 0;">
            <h1>ABC Laboratories</h1>
        </div>
        <div style="max-width: 800px; margin: 20px auto 0; padding: 20px; font-size: 14px;">
            <div style="display: flex; justify-content: space-between;">
                <div style="width: 30%;">
                    <h3>Patient Details</h3>
                    <p>Name: ${testReport.patient_name}</p>
                    <p>Age: ${testReport.age}</p>
                    <p>Gender: ${testReport.gender}</p>
                    <p>Phone: ${testReport.phone_number}</p>
                </div>
                <div style="width: 30%;">
                    <h3>Appointment</h3>
                     <p>ID ${testReport.appointment_id}</p>
                    <p>Date: ${testReport.appointment_date}</p>
                    <p>Time: ${testReport.appointment_time}</p>
                    <p>Test: ${testReport.test_name}</p>
                    <p>Referred by: ${testReport.prescribed_by}</p>
                </div>
                <div style="width: 30%;">
                    <h3>Test</h3>
                    <p>Date: ${testReport.test_date}</p>
                    <p>Time: ${testReport.test_time}</p>
                    <p>Technician: ${testReport.technician_name}</p>
                </div>
            </div>

            <div>

                <table style="width: 100%; border-collapse: collapse; margin-top: 20px;">
                    <thead>
                        <tr>
                            <th colspan="3" style="border: 1px solid #ddd; padding: 8px; text-align: center; font-size: 16px;">Medical Test Report</th>
                        </tr>
                        <tr>
                            <th style="border: 1px solid #ddd; padding: 8px;">Reference Levels</th>
                            <th style="border: 1px solid #ddd; padding: 8px;">Units</th>
                            <th style="border: 1px solid #ddd; padding: 8px;">Test Result</th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="border: 1px solid #ddd; padding: 8px;">${testReport.reference_levels}</td>
                            <td style="border: 1px solid #ddd; padding: 8px;">${testReport.unit}</td>
                            <td style="border: 1px solid #ddd; padding: 8px;">${testReport.report}</td>

                        </tr>
                    </tbody>
                </table>

            </div>
        </div>
        <div style="background-color: #063970; color: #fff; padding: 10px; text-align: center; border-radius: 0 0 5px 5px; position: absolute; bottom: 0; left: 0; width: 100%;">
            <p>For more information, contact ABC Medical Center at:</p>
            <p>123 Main Street, Cityville | Phone: (555) 123-4567 | Email: info@abcmedical.com</p>
        </div>
    </page>


    <button type="button" class="btn btn-success" style="width:100px; height:40px; float:right; position:fixed; top:2.5%; left:90%; border-radius:10px;"><i class="fa-solid fa-print"></i> Print </span></button>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).on('click', '.btn-success', function () {

        var PrintArea = $('page').html();

        report = window.open();

        report.document.write(PrintArea);

        report.document.close();
        report.focus();

        report.print();
        report.close();
    });
</script>
</body>

</html>
