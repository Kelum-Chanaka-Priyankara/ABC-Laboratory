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
 $(document).ready(function () {


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