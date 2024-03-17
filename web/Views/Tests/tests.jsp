<%-- 
    Document   : tests
    Created on : Mar 17, 2024, 6:17:51 PM
    Author     : Kelum
--%>

<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="wrapper" style="width:100%;margin:0 auto;">
    &nbsp;  &nbsp;<button type="button" id="modal-add-tests" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-popup-window" data-test-id=id="modal-add-tests"""><i class="fa-solid fa-heart-circle-plus"></i>&nbsp; New</button>
    <div class="container">   
        <table border="1" id="abc_table" class="display" style="width:100%">
            <thead>
                <tr> 
                    <th>ID</th>  
                    <th>Test</th> 
                    <th>Reference Levels</th> 
                    <th>Unit</th> 
                    <th>Charges</th>
                    <th>Technician</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>

            <tbody>
                <jstl:forEach var="test" items="${testsList}" >
                    <tr>
                        <td> ${test.test_id} </td>
                        <td> ${test.test_name} </td>
                        <td> ${test.reference_levels} </td>
                        <td> ${test.unit} </td>
                        <td> ${test.charges} </td>
                        <td> ${test.technician_name} </td>
                        <td><button type="button" id="modal-edit-tests" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#modal-popup-window" data-test-id="${test.test_id}"><i class="fa-solid fa-heart-circle-check"></i></button></td>
                        <td><button type="button" id="modal-delete-tests" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modal-popup-window" data-test-id="${test.test_id}"><i class="fa-solid fa-heart-circle-minus"></i></button></td>
                    </tr>
                </jstl:forEach>
            </tbody>
        </table>
    </div>

</div> 