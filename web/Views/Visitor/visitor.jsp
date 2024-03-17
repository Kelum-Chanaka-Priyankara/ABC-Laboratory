<%-- 
    Document   : visitor
    Created on : Mar 17, 2024, 6:19:19 PM
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
                    <th>Date</th> 
                    <th>Time</th> 
                    <th>Test</th> 
                    <th>Report</th> 
                    <th>Download / Print </th>
                </tr>
            </thead>

            <tbody>
                <jstl:forEach var="item" items="${appointmentsList}" >
                    <tr>
                        <td> ${item.appointment_id} </td>
                        <td> ${item.appointment_date} </td>
                        <td> ${item.appointment_time} </td>
                        <td> ${item.test_name} </td>
                        <td> ${item.report} </td>
                        <td>
                            <button type="button" id="modal-download-visitor" class="btn btn-success" data-test-id="${item.appointment_id}"><i class="fa-solid fa-file-pdf"></i></button>
                        </td>
                    </tr>
                </jstl:forEach>
            </tbody>
        </table>
    </div>

</div> 