<%-- 
    Document   : add_user
    Created on : Mar 17, 2024, 6:18:16 PM
    Author     : Kelum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container">

    <div class="mb-3">
        <label for="first_name" class="form-label">First Name:</label>
        <input type="text" class="form-control" id="first_name" name="first_name" required/>
    </div>
    <div class="mb-3">
        <label for="last_name" class="form-label">Last Name:</label>
        <input type="text" class="form-control" id="last_name" name="last_name" required/>
    </div>
    <div class="mb-3">
        <label for="gender" class="form-label">Gender:</label>
        <div class="btn-group" role="group" aria-label="Gender">
            <input type="radio" class="btn-check" name="gender" id="male" autocomplete="off" value="Male" checked required/>
            <label class="btn btn-outline-primary" for="male">Male</label>

            <input type="radio" class="btn-check" name="gender" id="female" autocomplete="off" value="Female" required/>
            <label class="btn btn-outline-primary" for="female">Female</label>
        </div>
    </div> 
    <div class="mb-3">
        <label for="address" class="form-label">Address:</label>
        <input type="text" class="form-control" id="address" name="address" required/>
    </div>
    <div class="mb-3">
        <label for="email" class="form-label">Email:</label>
        <input type="email" class="form-control" id="email" name="email" required/>
    </div>
    <div class="mb-3">
        <label for="phone_number" class="form-label">Phone Number:</label>
        <input type="text" class="form-control" id="phone_number" name="phone_number" required/>
    </div>

    <div class="mb-3">
        <label for="privilege" class="form-label">Role:</label>
        <select id="privilege" name="privilege" class="form-control" required>
            <option value="tcnc">Medical Technician</option>
            <option value="fdsk">Front-Desk Officer</option>
            <option value="admn">Administrator</option>
        </select>
    </div>
    
</div>