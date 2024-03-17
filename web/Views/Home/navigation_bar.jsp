<%-- 
    Document   : navigation_bar
    Created on : Mar 17, 2024, 6:11:18 PM
    Author     : Kelum
--%>

<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="top-bar bg-primary">
    <div></div>
    <span class="logout-btn" id="signout"> Sign Out </span>
</div>

<div class="side-nav bg-primary">
    <jstl:if test="${'admn' eq sessionScope.authType}">
        <a href="/ABCLaboratory/Dashboard" id="default">
            <i class="fa-solid fa-gauge-high"></i>
            <span class="ms-4">Dashboard</span> 
        </a>
        <a href="/ABCLaboratory/Patients">
            <i class="fa-solid fa-users"></i> 
            <span class="ms-4">Patients</span> 
        </a>
        <a href="/ABCLaboratory/Users">
            <i class="fa-solid fa-users-between-lines"></i> 
            <span class="ms-4">Users</span> 
        </a>
        <a href="/ABCLaboratory/Tests">
            <i class="fa-solid fa-vial"></i> 
            <span class="ms-4">Tests</span> 
        </a>
        <a href="/ABCLaboratory/Appointments">
            <i class="fa-solid fa-calendar-check"></i> 
            <span class="ms-4">Appointments</span> 
        </a>
        <a href="/ABCLaboratory/Payments">
            <i class="fa-solid fa-file-invoice-dollar"></i> 
            <span class="ms-4">Payments</span> 
        </a>
        <a href="/ABCLaboratory/Report">
            <i class="fa-solid fa-chart-line"></i> 
            <span class="ms-4">Reports</span> 
        </a>
    </jstl:if>

    <jstl:if test="${'fdsk' eq sessionScope.authType}">
        <a href="/ABCLaboratory/Patients" id="default">
            <i class="fa-solid fa-users"></i> 
            <span class="ms-4">Patients</span> 
        </a>
        <a href="/ABCLaboratory/Appointments">
            <i class="fa-solid fa-calendar-check"></i> 
            <span class="ms-4">Appointments</span> 
        </a>
        <a href="/ABCLaboratory/Payments">
            <i class="fa-solid fa-file-invoice-dollar"></i> 
            <span class="ms-4">Payments</span> 
        </a>
    </jstl:if>

    <jstl:if test="${'tcnc' eq sessionScope.authType}">
        <a href="/ABCLaboratory/Technician" id="default">
            <i class="fa-solid fa-calendar-check"></i> 
            <span class="ms-4">Appointments</span> 
        </a>
    </jstl:if>

    <jstl:if test="${'ptnt' eq sessionScope.authType}">
        <a href="/ABCLaboratory/Visitor" id="default">
            <i class="fa-solid fa-file-medical"></i> 
            <span class="ms-4">My Reports</span>
        </a>
    </jstl:if>

    <div class="side-nav-bottom">
        <p>
            ${sessionScope.privilege}
            <br/>
            ${sessionScope.userName}
        </p>
        <span id="clock" class="clock">00:00:00</span>
    </div>
</div>
<button class="toggle-btn btn btn-primary"><i class="fas fa-bars"></i></button>