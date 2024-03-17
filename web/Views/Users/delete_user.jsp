<%-- 
    Document   : delete_user
    Created on : Mar 17, 2024, 6:18:26 PM
    Author     : Kelum
--%>

<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<p>Deleting the record! <p class="text-danger"> User ID :  ${userId} </p> This action will remove it permanently. Proceed with caution. </p>

<input type="hidden" class="form-control" id="user_id" name="user_id" value='${userId}'/>