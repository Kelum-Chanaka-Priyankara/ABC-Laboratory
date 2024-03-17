<%-- 
    Document   : delete_test
    Created on : Mar 17, 2024, 6:17:26 PM
    Author     : Kelum
--%>

<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<p>Deleting the record! <p class="text-danger"> Test ID :  ${testId} </p> This action will remove it permanently. Proceed with caution. </p>

<input type="hidden" class="form-control" id="test_id" name="test_id" value='${testId}'/>
