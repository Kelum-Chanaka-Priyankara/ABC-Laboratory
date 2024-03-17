<%-- 
    Document   : add_test
    Created on : Mar 17, 2024, 6:17:10 PM
    Author     : Kelum
--%>


<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container"> 
    <div class="mb-3">
        <label for="test_name" class="form-label">Test Name</label>
        <input type="text" class="form-control" id="test_name" name="test_name" required/>
    </div>
    <div class="mb-3">
        <label for="reference_levels" class="form-label">Reference Levels</label>
        <textarea  type="text" class="form-control" id="reference_levels" name="reference_levels" required></textarea>
    </div>
    <div class="mb-3">
        <label for="unit" class="form-label">Unit</label>
        <input type="text" class="form-control" id="unit" name="unit" required/>
    </div>
    <div class="mb-3">
        <label for="charges" class="form-label">Charges</label>
        <input type="text" class="form-control" id="charges" name="charges" required/>
    </div>
<div class="mb-3">
        <label for="technician_id" class="form-label">Technician:</label>
        <select id="technician_id" name="technician_id" class="form-control" required>
            <jstl:forEach var="items" items="${techniciansList}" >
                <option value='${items.user_id}'>${items.user_id} ${items.first_name} - ${items.last_name}</option>
            </jstl:forEach>
        </select>
    </div>
</div>