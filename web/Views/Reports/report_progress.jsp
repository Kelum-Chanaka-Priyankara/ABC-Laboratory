<%-- 
    Document   : report_progress
    Created on : Mar 17, 2024, 6:15:48 PM
    Author     : Kelum
--%>


<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>

    .card {
        margin-bottom: 1rem;
    }
    .card-header {
        background-color: #063970;
        color: #fff;
        font-size: 1.5rem;
        font-weight: bold;
    }
    .card-body {
        text-align: center;
        font-size: 2rem;
        color: #063970;
    }
    .chart {
        height: 300px;
        margin-top: 2rem;
    }
    .icon {
        float: right;
        font-size: 3rem;
        color: #063970;
    }
    .table {
        margin-top: 2rem;
        font-size: 1rem;
    }
</style>


<div class="wrapper" style="width:100%;margin:0 auto;">

    <div class="container">   

        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">Business Growth Chart</div>
                    <div class="card-body">
                        <canvas id="businessChart" class="chart"></canvas>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div> 
<script>
    $(document).ready(function () {

        var chartCanvas = $('#businessChart');
        var ctx = chartCanvas[0].getContext('2d');
        var chartBottom = chartCanvas.offset().top + chartCanvas.height();
        var chartTop = chartCanvas.offset().top;

        var gradient = chartCanvas[0].getContext('2d').createLinearGradient(0, chartBottom, 0, chartTop);
        gradient.addColorStop(0, 'rgba(255, 0, 0, 1)');   // Red at the bottom
        gradient.addColorStop(0.33, 'rgba(255, 255, 0, 1)');   // Yellow in the middle
        gradient.addColorStop(0.66, 'rgba(0, 255, 0, 1)');   // Green at the top



        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ${progressDates},
                datasets: [{
                        label: 'Business Growth',
                        data: ${progressIncome},
                        borderColor: gradient,
                        backgroundColor: 'rgba(6, 57, 112, 0.1)',
                        borderWidth: 5,
                        fill: false
                    }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    });

</script>