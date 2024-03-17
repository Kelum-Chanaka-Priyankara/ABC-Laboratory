<%-- 
    Document   : edit_payment
    Created on : Mar 17, 2024, 6:15:11 PM
    Author     : Kelum
--%>


<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container">

    <input type="hidden" id="payment_id" name="payment_id" value='${payment.payment_id}'/>
    <input type="hidden" id="appointment_id" name="appointment_id" value='${payment.appointment_id}'/>
    <input type="hidden" id="test_name" name="test_name" value='${payment.test_name}'/>
    <input type="hidden" id="charges" name="charges" value='${payment.charges}'/>
    <input type="hidden" id="payment_date" name="payment_date" value='${payment.payment_date}'/>
    <input type="hidden" id="first_name" name="first_name" value='${payment.first_name}'/>
    <input type="hidden" id="last_name" name="last_name" value='${payment.last_name}'/>
    <input type="hidden" id="gender" name="gender" value='${payment.gender}'/>
    <input type="hidden" id="address" name="address" value='${payment.address}'/>
    <input type="hidden" id="email" name="email" value='${payment.email}'/>
    <input type="hidden" id="phone_number" name="phone_number" value='${payment.phone_number}'/>

    <div class="mb-3">
        <label for="payment_method" class="form-label">Payment Method</label>
        <select class="form-select" id="payment_method" name="payment_method" required>
            <option value="" selected disabled>Select Payment Method</option>
            <option value="Cash" ${payment.payment_method == 'Cash' ? 'selected' : ''}>Cash</option>
            <option value="Card" ${payment.payment_method == 'Card' ? 'selected' : ''}>Card</option>
            <option value="Cheque" ${payment.payment_method == 'Cheque' ? 'selected' : ''}>Cheque</option>
            <option value="Other" ${payment.payment_method == 'Other' ? 'selected' : ''}>Other</option>
        </select>
    </div>
    <div class="mb-3">
        <label class="form-label">Payment Status</label>
        <div class="form-check form-switch">
            <input class="form-check-input" type="checkbox" id="payment_status" name="payment_status" ${paymentStatus ? 'checked' : ''}/>
            <label class="form-check-label" for="payment_status">Paid</label>
        </div>
    </div>

</div>
