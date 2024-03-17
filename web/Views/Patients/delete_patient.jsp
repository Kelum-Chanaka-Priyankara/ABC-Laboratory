<%-- 
    Document   : delete_patient
    Created on : Mar 17, 2024, 6:13:03 PM
    Author     : Kelum
--%>

<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<p>Deleting the record! <p class="text-danger"> Patient ID :  ${patientId} </p> This action will remove it permanently. Proceed with caution. </p>

<input type="hidden" class="form-control" id="patient_id" name="patient_id" value='${patientId}'/>
