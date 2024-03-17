<%-- 
    Document   : technician
    Created on : Mar 17, 2024, 6:16:09 PM
    Author     : Kelum
--%>

<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="wrapper" style="width:100%;margin:0 auto;">

    <div class="container">   
        <table border="1" id="abc_table" class="display" style="width:100%">
            <thead>
                <tr>  
                    <th>Appointment ID</th> 
                    <th>Patient</th> 
                    <th>Gender</th> 
                    <th>Age</th> 
                    <th>Appointment Date</th> 
                    <th>Appointment Time</th> 
                    <th>Test</th> 
                    <th>Reference Levels</th> 
                    <th>Unit</th> 
                    <th>Report</th> 
                    <th>Update</th>
                </tr>
            </thead>

            <tbody>
                <jstl:forEach var="item" items="${appointmentsList}" >
                    <tr>
                        <td> ${item.appointment_id} </td>
                        <td> ${item.patient_name} </td>
                        <td> ${item.gender} </td>
                        <td> ${item.age} </td>
                        <td> ${item.appointment_date} </td>
                        <td> ${item.appointment_time} </td>
                        <td> ${item.test_name} </td>
                        <td> ${item.reference_levels} </td>
                        <td> ${item.unit} </td>


                        <td> ${item.report} </td>
                        <td>
                           <button type="button" id="modal-update-test-reports" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#modal-popup-window" data-test-id="${item.test_report_id}"> <i class="fa-solid fa-file-signature"></i></button>
                        </td>
                    </tr>
                </jstl:forEach>
            </tbody>
        </table>
    </div>

</div> 