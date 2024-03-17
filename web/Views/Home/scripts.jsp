<%-- 
    Document   : scripts
    Created on : Mar 17, 2024, 6:11:32 PM
    Author     : Kelum
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script src="js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>

<script src="data_tables/datatables.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>


<script>
    // Appointments Section Start---------------------------------------------------
    $(document).on('click', '#modal-add-appointments', function () {
        var title = "Confirm Insertion", buttonText = "Save", buttonClass = "btn btn-primary", url = "Appointments?page=Add";
        openModal(title, buttonText, buttonClass, url);

        var actionURL = "Appointments", formMethod = "POST", actionType = "Insert";
        changeForm(actionURL, formMethod, actionType);
    });

    $(document).on('click', '#modal-edit-appointments', function () {
        var title = "Confirm Modification", buttonText = "Update", buttonClass = "btn btn-warning", url = 'Appointments?page=Edit&appointmentId=' + $(this).data('test-id');
        openModal(title, buttonText, buttonClass, url);

        var actionURL = "Appointments", formMethod = "POST", actionType = "Update";
        changeForm(actionURL, formMethod, actionType);
    });

    $(document).on('click', '#modal-delete-appointments', function () {
        var title = "Confirm Deletion", buttonText = "Delete", buttonClass = "btn btn-danger", url = 'Appointments?page=Delete&appointmentId=' + $(this).data('test-id');
        openModal(title, buttonText, buttonClass, url);

        var actionURL = "Appointments", formMethod = "GET", actionType = "Delete";
        changeForm(actionURL, formMethod, actionType);
    });
//Appointments Section End------------------------------------------------------

// Payments Section Start-------------------------------------------------------
    $(document).on('click', '#modal-edit-payments', function () {
        var title = "Confirm Modification", buttonText = "Update", buttonClass = "btn btn-warning", url = 'Payments?page=Edit&paymentId=' + $(this).data('test-id');
        openModal(title, buttonText, buttonClass, url);

        var actionURL = "Payments", formMethod = "POST", actionType = "Update";
        changeForm(actionURL, formMethod, actionType);
    });
// Payments Section End---------------------------------------------------------

// Tests Section Start----------------------------------------------------------
    $(document).on('click', '#modal-add-tests', function () {
        var title = "Confirm Insertion", buttonText = "Save", buttonClass = "btn btn-primary", url = "Tests?page=Add";
        openModal(title, buttonText, buttonClass, url);

        var actionURL = "Tests", formMethod = "POST", actionType = "Insert";
        changeForm(actionURL, formMethod, actionType);
    });

    $(document).on('click', '#modal-edit-tests', function () {
        var title = "Confirm Modification", buttonText = "Update", buttonClass = "btn btn-warning", url = 'Tests?page=Edit&testId=' + $(this).data('test-id');
        openModal(title, buttonText, buttonClass, url);

        var actionURL = "Tests", formMethod = "POST", actionType = "Update";
        changeForm(actionURL, formMethod, actionType);
    });

    $(document).on('click', '#modal-delete-tests', function () {
        var title = "Confirm Deletion", buttonText = "Delete", buttonClass = "btn btn-danger", url = 'Tests?page=Delete&testId=' + $(this).data('test-id');
        openModal(title, buttonText, buttonClass, url);

        var actionURL = "Tests", formMethod = "GET", actionType = "Delete";
        changeForm(actionURL, formMethod, actionType);
    });
// Tests Section End------------------------------------------------------------

// Patients Section Start-------------------------------------------------------
    $(document).on('click', '#modal-add-patients', function () {
        var title = "Confirm Insertion", buttonText = "Save", buttonClass = "btn btn-primary", url = "Patients?page=Add";
        openModal(title, buttonText, buttonClass, url);

        var actionURL = "Patients", formMethod = "POST", actionType = "Insert";
        changeForm(actionURL, formMethod, actionType);
    });

    $(document).on('click', '#modal-edit-patients', function () {
        var title = "Confirm Modification", buttonText = "Update", buttonClass = "btn btn-warning", url = 'Patients?page=Edit&patientId=' + $(this).data('test-id');
        openModal(title, buttonText, buttonClass, url);

        var actionURL = "Patients", formMethod = "POST", actionType = "Update";
        changeForm(actionURL, formMethod, actionType);
    });

    $(document).on('click', '#modal-delete-patients', function () {
        var title = "Confirm Deletion", buttonText = "Delete", buttonClass = "btn btn-danger", url = 'Patients?page=Delete&patientId=' + $(this).data('test-id');
        openModal(title, buttonText, buttonClass, url);

        var actionURL = "Patients", formMethod = "GET", actionType = "Delete";
        changeForm(actionURL, formMethod, actionType);
    });
// Patients Section End--------------------------------------------------------- 

// Users Section Start----------------------------------------------------------
    $(document).on('click', '#modal-add-users', function () {
        var title = "Confirm Insertion", buttonText = "Save", buttonClass = "btn btn-primary", url = "Users?page=Add";
        openModal(title, buttonText, buttonClass, url);

        var actionURL = "Users", formMethod = "POST", actionType = "Insert";
        changeForm(actionURL, formMethod, actionType);
    });

    $(document).on('click', '#modal-edit-users', function () {
        var title = "Confirm Modification", buttonText = "Update", buttonClass = "btn btn-warning", url = 'Users?page=Edit&userId=' + $(this).data('test-id');
        openModal(title, buttonText, buttonClass, url);

        var actionURL = "Users", formMethod = "POST", actionType = "Update";
        changeForm(actionURL, formMethod, actionType);
    });

    $(document).on('click', '#modal-delete-users', function () {
        var title = "Confirm Deletion", buttonText = "Delete", buttonClass = "btn btn-danger", url = 'Users?page=Delete&userId=' + $(this).data('test-id');
        openModal(title, buttonText, buttonClass, url);

        var actionURL = "Users", formMethod = "GET", actionType = "Delete";
        changeForm(actionURL, formMethod, actionType);
    });
// Users Section End------------------------------------------------------------

// Technician Section Start-----------------------------------------------------
    $(document).on('click', '#modal-update-test-reports', function () {
        var title = "Confirm Modification", buttonText = "Save", buttonClass = "btn btn-primary", url = '/ABCLaboratory/Technician?page=UpdateTestReport&testReportId=' + $(this).data('test-id');
        openModal(title, buttonText, buttonClass, url);

        var actionURL = "Technician", formMethod = "POST", actionType = "Update";
        changeForm(actionURL, formMethod, actionType);
    });
// Technician Section End-------------------------------------------------------

// Visitor Section Start--------------------------------------------------------
    $(document).on('click', '#modal-download-visitor', function () {
        var url = 'Visitor?page=Download&appointmentId=' + $(this).data('test-id');
        window.open(url);
    });
// Visitor Section End----------------------------------------------------------

// Functions Start--------------------------------------------------------------
    function openModal(title, buttonText, newButtonClass, pageURL) {
        var currentButtonClass = $('#modal-button').attr('class');
        $('#modal-body').empty();
        $('#modal-title-label').text(title);
        $('#modal-button').text(buttonText).removeClass(currentButtonClass).addClass(newButtonClass);
        $('#modal-body').load(pageURL);
    }
    function changeForm(actionURL, formMethod, actionType) {
        $('#modal-form').attr('action', actionURL).attr('method', formMethod);
        $('#modal-hidden').attr('value', actionType);
    }
// Functions End----------------------------------------------------------------


// List Populatin Section
    $(document).on('change', '#technician_id', function () {
        var selectedTechnicianId = $(this).val();
        $.ajax({
            type: "GET",
            url: "Appointments",
            data: {"page": "TestsList", "technicianId": selectedTechnicianId},
            dataType: "json",
            success: function (data) {
                $('#test_id').empty();
                $.each(data, function (key, value) {
                    $('#test_id').append('<option value="' + value.test_id + '">' + value.test_name + '</option>');
                });
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Error: " + errorThrown);
            }
        });
    });
// List Populatin Section 

// ----------------------------------------------------------------------------------------------------------------------
    $(document).ready(function () {

        new DataTable('#abc_table');
        clockUpdate();
        setInterval(clockUpdate, 1000);
        if ($(window).width() > 768) {
            $('.side-nav').css('left', '0px');
        }

        $(window).resize(function () {
            if ($(window).width() > 768) {
                $('.side-nav').css('left', '0px');
            } else {
                $('.side-nav').css('left', '-250px');
            }
        });

        $('.toggle-btn').click(function () {
            $('.side-nav').css('left', function (index, value) {
                return value === '0px' ? '-250px' : '0px';
            });
        });

        $('.side-nav a').click(function (event) {
            event.preventDefault();
            $('.side-nav a').removeClass('active');
            $(this).addClass('active');

            var url = $(this).attr('href');
            $.ajax({
                url: url,
                type: 'GET',
                success: function (response) {
                    $('#content').html(response);
                    $('#abc_table').DataTable();
                }
            });
        });

        // Send a GET request
        $('#modal-form').submit(function (event) {
            event.preventDefault();
            var form = $(this);
            var url = form.attr('action');
            $.get(url, form.serialize(), function (response) {
                if (response != null) {
                    //refreshing the page
                    $.get(url, form.serialize(), function (response) {
                        $('#content').html(response);
                        $('#abc_table').DataTable();
                    });
                }
            });
        });

        // Send a POST request
        $('#modal-form').submit(function (event) {
            event.preventDefault();
            var form = $(this);
            var url = form.attr('action');
            $.post(url, form.serialize(), function (response) {
                if (response !== null) {
                    //refreshing the page
                    $.get(url, form.serialize(), function (response) {
                        $('#content').html(response);
                        $('#abc_table').DataTable();
                    });
                }
            });
        });

        $('#default').trigger('click');

    });


    function clockUpdate() {
        var date = new Date();

        function addZero(x) {
            return (x < 10) ? '0' + x : x;
        }

        function twelveHour(x) {
            return (x > 12) ? x - 12 : (x == 0) ? 12 : x;
        }

        var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
        var day = days[date.getDay()];
        var month = date.toLocaleString('default', {month: 'long'});
        var year = date.getFullYear();

        var h = addZero(twelveHour(date.getHours()));
        var m = addZero(date.getMinutes());
        var s = addZero(date.getSeconds());

        $('#clock').html(day + ', ' + month + ' ' + date.getDate() + ', ' + year + ' ' + h + ':' + m + ':' + s);
    }

    (function () {
        'use strict';

        var forms = document.querySelectorAll('.needs-validation');

        Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault();
                            event.stopPropagation();
                        }

                        form.classList.add('was-validated');
                    }, false);
                });
    });
</script>