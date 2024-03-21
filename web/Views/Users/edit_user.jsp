<%-- 
    Document   : edit_user
    Created on : Mar 17, 2024, 6:18:36 PM
    Author     : Kelum
--%>

<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<input type="hidden" class="form-control" id="user_id" name="user_id" value='${user.user_id}'/>
<div class="container">


    <div class="mb-3">
        <label for="first_name" class="form-label">First Name:</label>
        <input type="text" class="form-control" id="first_name" name="first_name" value='${user.first_name}' required/>
    </div>
    <div class="mb-3">
        <label for="last_name" class="form-label">Last Name:</label>
        <input type="text" class="form-control" id="last_name" name="last_name" value='${user.last_name}' required/>
    </div>
    <div class="mb-3">
        <label for="gender" class="form-label">Gender:</label>
        <div class="btn-group" role="group" aria-label="Gender">
            <input type="radio" class="btn-check" name="gender" id="male" autocomplete="off" value="Male" <jstl:if test="${user.gender == 'Male'}">checked</jstl:if> required/>
                <label class="btn btn-outline-primary" for="male">Male</label>

                <input type="radio" class="btn-check" name="gender" id="female" autocomplete="off" value="Female"<jstl:if test="${user.gender == 'Female'}">checked</jstl:if> required/>
                <label class="btn btn-outline-primary" for="female">Female</label>
            </div>
        </div>

        <div class="mb-3">
            <label for="address" class="form-label">Address:</label>
            <input type="text" class="form-control" id="address" name="address" value='${user.address}' required/>
    </div>
    <div class="mb-3">
        <label for="email" class="form-label">Email:</label>
        <input type="email" class="form-control" id="email" name="email" value='${user.email}' required/>
    </div>
    <div class="mb-3">
        <label for="phone_number" class="form-label">Phone Number:</label>
        <input type="text" class="form-control" id="phone_number" name="phone_number" value='${user.phone_number}' maxlength="12" required/>
    </div>

    <div class="mb-3">
        <label for="privilege" class="form-label">Role:</label>
        <select id="privilege" name="privilege" class="form-control" required>

            <option value="tcnc" <jstl:if test="${user.privilege eq 'tcnc'}">selected</jstl:if>>Medical Technician</option>

                <option value="fdsk" <jstl:if test="${user.privilege eq 'fdsk'}">selected</jstl:if>>Front-Desk Officer</option>

                <option value="admn" <jstl:if test="${user.privilege eq 'admn'}">selected</jstl:if>>Administrator</option>

        </select>
    </div>

</div>