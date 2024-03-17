<%-- 
    Document   : update_test_report
    Created on : Mar 17, 2024, 6:16:21 PM
    Author     : Kelum
--%>

<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container">

    <input type="hidden" class="form-control" id="test_report_id" name="test_report_id" value='${testReportId}'/>
    <div class="mb-3">
        <label for="appointment_date" class="form-label">Test Date:</label>
        <input type="date" class="form-control" id="test_date" name="test_date" required/>
    </div>

    <div class="mb-3">
        <label for="appointment_date" class="form-label">Test Time:</label>
        <input type="time" class="form-control" id="test_time" name="test_time" required/>
    </div>

    
    <div class="mb-3">
        <label for="report" class="form-label">Report</label>
        <textarea  type="text" class="form-control" id="test_report" name="test_report" required></textarea>
    </div>
</div>
