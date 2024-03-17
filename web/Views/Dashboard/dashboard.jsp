<%-- 
    Document   : dashboard
    Created on : Mar 17, 2024, 6:10:52 PM
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
        color: #a5e3ff;
        font-size: 1.5rem;
        font-weight: bold;
    }
    .card-body {
        text-align: center;
        font-size: 2rem;
        color: #063970;

    }
    .chart {
        height: 200px;
        margin-top: 1rem;
    }
    .icon {
        float: right;
        font-size: 3rem;
        color: #063970;
    }
    .table {
        margin-top: 1rem;
        font-size: 1rem;

    }
</style>

<div class="container">
    <div class="row">
        <div class="col-md-3">
            <div class="card">
                <div class="card-header">Daily Income</div>
                <div class="card-body text-warning">${progress.income}<i class="fas fa-money-bill-alt icon text-warning"></i></div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <div class="card-header">Customers</div>
                <div class="card-body text-secondary">${customersCount} <i class="fas fa-users icon text-secondary"></i></div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <div class="card-header">Appointments</div>
                <div class="card-body text-primary">${appointmentsCount} <i class="far fa-calendar-alt icon text-primary"></i></div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <div class="card-header">Tests</div>
                <div class="card-body text-primary text-success">${testsCount} <i class="fas fa-vial icon text-success"></i></div>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">Latest Appointments</div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Time</th>
                                <th>Technician</th>
                                <th>Test</th>
                            </tr>
                        </thead>
                        <tbody>

                            <jstl:forEach var="item" items="${latestAppointmentsList}" >
                                <tr>
                                    <td>${item.appointment_date}</td>
                                    <td>${item.appointment_time}</td>
                                    <td>${item.technician_name}</td>
                                    <td>${item.test_name}</td>
                                </tr>
                            </jstl:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">Latest Payments</div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Amount</th>
                                <th>Method</th>
                            </tr>
                        </thead>
                        <tbody>
                            <jstl:forEach var="item" items="${latestPaymentsList}" >
                                <tr>
                                    <td>${item.payment_date}</td>
                                    <td>${item.charges}</td>
                                    <td>${item.payment_method}</td>
                                </tr>
                            </jstl:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>



    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">Popular Tests</div>
                <div class="card-body">
                    <canvas id="pieChart" class="chart"></canvas>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">This Week</div>
                <div class="card-body">
                    <canvas id="chart2" class="chart"></canvas>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">Last Week</div>
                <div class="card-body">
                    <canvas id="chart3" class="chart"></canvas>
                </div>
            </div>
        </div>
    </div>



</div>

<script>
    // Chart 1
//    var LabelArray = ;
//    var DataArray = ;
    var ctxPie = $('#pieChart');
    var pieChart = new Chart(ctxPie, {
        type: 'doughnut',
        data: {
            labels: ${popularTestNames},
            datasets: [{
                    label: 'Pie Chart Data',
                    data: ${popularTestCounts},
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.5)',
                        'rgba(54, 162, 235, 0.5)',
                        'rgba(255, 206, 86, 0.5)',
                        'rgba(75, 192, 192, 0.5)',
                        'rgba(153, 102, 255, 0.5)',
                        'rgba(255, 159, 64, 0.5)',
                        'rgba(255, 99, 132, 0.5)',
                        'rgba(54, 162, 235, 0.5)',
                        'rgba(255, 206, 86, 0.5)',
                        'rgba(75, 192, 192, 0.5)',
                        'rgba(153, 102, 255, 0.5)',
                        'rgba(255, 159, 64, 0.5)',
                        'rgba(255, 99, 132, 0.5)',
                        'rgba(54, 162, 235, 0.5)',
                        'rgba(255, 206, 86, 0.5)',
                        'rgba(75, 192, 192, 0.5)',
                        'rgba(153, 102, 255, 0.5)',
                        'rgba(255, 159, 64, 0.5)',
                        'rgba(255, 99, 132, 0.5)',
                        'rgba(54, 162, 235, 0.5)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)',
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)',
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)',
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)'
                    ],
                    borderWidth: 1
                }]
        },
        options: {
            scales: {
                y: {
                    display: false
                },
                x: {
                    display: false
                }
            }
        }
    });

    // Chart 2
    var ctx2 = $('#chart2');
    var chart2 = new Chart(ctx2, {
        type: 'line',
        data: {
            labels: ${thisWeekDates},
            datasets: [{
                    label: 'Chart 2 Data',
                    data: ${thisWeekIncome},
                    borderColor: 'rgba(0, 255, 0, 1)',
                    backgroundColor: 'rgba(0, 255, 0, 0.1)',
                    borderWidth: 2,
                    fill: true
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

    // Chart 3
    var ctx3 = $('#chart3');
    var chart3 = new Chart(ctx3, {
        type: 'line',
        data: {
            labels: ${lastWeekDates},
            datasets: [{
                    label: 'Chart 3 Data',
                    data: ${lastWeekIncome},
                    borderColor: 'rgba(0, 0, 255, 1)',
                    backgroundColor: 'rgba(0, 0, 255, 0.1)',
                    borderWidth: 2,
                    fill: true
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
</script>