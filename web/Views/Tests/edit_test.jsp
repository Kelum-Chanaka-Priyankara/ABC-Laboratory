<%-- 
    Document   : edit_test
    Created on : Mar 17, 2024, 6:17:41 PM
    Author     : Kelum
--%>

<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container"> 
    <input type="hidden" class="form-control" id="test_id" name="test_id" value='${test.test_id}' required/>
    
    <div class="mb-3">
        <label for="test_name" class="form-label">Test Name</label>
        <input type="text" class="form-control" id="test_name" name="test_name" required value="${test.test_name}" required/>
    </div>
    <div class="mb-3">
        <label for="reference_levels" class="form-label">Reference Levels</label>
        <textarea  type="text" class="form-control" id="reference_levels" name="reference_levels" required>${test.reference_levels}</textarea>
    </div>
     <div class="mb-3">
        <label for="unit" class="form-label">Unit</label>
        <input type="text" class="form-control" id="unit" name="unit" value="${test.unit}" required/>
    </div>
    <div class="mb-3">
        <label for="charges" class="form-label">Charges</label>
        <input type="text" class="form-control" id="charges" name="charges" value="${test.charges}" required/>
    </div>
<div class="mb-3">
        <label for="technician_id" class="form-label">Technician:</label>
        <select id="technician_id" name="technician_id" class="form-control" required>
            <jstl:forEach var="items" items="${techniciansList}" >
                <option value='${items.user_id}' <jstl:if test="${items.user_id eq test.technician_id}">selected</jstl:if> >${items.user_id} ${items.first_name} - ${items.last_name}</option>
            </jstl:forEach>
        </select>
    </div>
</div>

