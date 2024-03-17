<%-- 
    Document   : appointments
    Created on : Mar 17, 2024, 6:06:11 PM
    Author     : Kelum
--%>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="wrapper" style="width:100%;margin:0 auto;">

    &nbsp;  &nbsp;<button type="button" id="modal-add-appointments" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-popup-window" data-test-id=""><i class="fa-solid fa-calendar-plus"></i>&nbsp; New</button>

    <div class="container">   
        <table border="1" id="abc_table" class="display" style="width:100%">
            <thead>
                <tr> 
                    <th>No</th>  
                    <th>Patient</th> 
                    <th>Test</th> 
                    <th>Technician</th> 
                    <th>Date</th> 
                    <th>Time</th> 
                    <th>Status</th> 
                    <th>Edit</th>
                        <jstl:if test="${'admn' eq sessionScope.authType}">
                        <th>Delete</th>
                        </jstl:if>
                </tr>
            </thead>

            <tbody>
                <jstl:forEach var="items" items="${appointmentList}" >
                    <tr>
                        <td> ${items.appointment_id} </td>
                        <td> ${items.patient_name} </td>
                        <td> ${items.test_name} </td>
                        <td> ${items.technician_name} </td>
                        <td> ${items.appointment_date} </td>
                        <td> ${items.appointment_time} </td>
                        <td> ${items.cancelled_status} </td>
                        <td>
                            <button type="button" id="modal-edit-appointments" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#modal-popup-window" data-test-id="${items.appointment_id}"> <i class="fa-solid fa-calendar-day"></i>&nbsp;</button>
                        </td>
                        
                        <jstl:if test="${'admn' eq sessionScope.authType}">
                            <td>
                                <button type="button" id="modal-delete-appointments" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modal-popup-window" data-test-id="${items.appointment_id}"><i class="fa-solid fa-calendar-minus"></i> &nbsp;</button>
                            </td>
                        </jstl:if>

                    </tr>
                </jstl:forEach>
            </tbody>
        </table>
    </div>

</div> 