<%-- 
    Document   : edit_appointment
    Created on : Mar 17, 2024, 6:06:35 PM
    Author     : Kelum
--%>

<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container">
    <input type="hidden" class="form-control" id="appointment_id" name="appointment_id" value='${appointment.appointment_id}' required/>

    <div class="mb-3">
        <label for="appointment_date" class="form-label">Appointment Date:</label>
        <input type="date" class="form-control" id="appointment_date" name="appointment_date" value='${appointment.appointment_date}' required/>
    </div>

    <div class="mb-3">
        <label for="appointment_date" class="form-label">Appointment Time:</label>
        <input type="time" class="form-control" id="appointment_time" name="appointment_time" value='${appointment.appointment_time}' required/>
    </div>

    <div class="mb-3">
        <label for="patient_id" class="form-label">Patient:</label>
        <select id="patient_id" name="patient_id" class="form-control" required>
            <jstl:forEach var="items" items="${patientsList}" >
                <option value='${items.patient_id}' <jstl:if test="${items.patient_id eq appointment.patient_id}">selected</jstl:if>>${items.patient_id} ${items.first_name} - ${items.last_name}</option>
            </jstl:forEach>
        </select>
    </div>
    <div class="mb-3">
        <label for="technician_id" class="form-label">Technician:</label>
        <select id="technician_id" name="technician_id" class="form-control" required>
            <jstl:forEach var="items" items="${techniciansList}" >
                <option value='${items.user_id}' <jstl:if test="${items.user_id eq appointment.user_id}">selected</jstl:if> >${items.user_id} ${items.first_name} - ${items.last_name}</option>
            </jstl:forEach>
        </select>
    </div>

    <div class="mb-3">
        <label for="test_id" class="form-label">Test:</label>
        <select id="test_id" name="test_id" class="form-control" required>
            <jstl:forEach var="items" items="${testsList}" >
                <option value='${items.test_id}' <jstl:if test="${items.test_id eq appointment.test_id}">selected</jstl:if> >${items.test_name}</option>
            </jstl:forEach>
        </select>
    </div>

    <div class="mb-3 form-check">
        <input type="checkbox" class="form-check-input" id="is_cancelled" name="is_cancelled" ${appointment.is_cancelled? "checked":""} />
        <label class="form-check-label" for="is_cancelled">Cancel</label>
    </div>
    <div class="mb-3">
        <label for="prescribed_by" class="form-label">Referred by:</label>
        <input type="text" class="form-control" id="prescribed_by" name="prescribed_by" value='${appointment.prescribed_by}' required/>
    </div>
</div>

