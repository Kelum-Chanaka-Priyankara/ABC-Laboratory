<%-- 
    Document   : index
    Created on : Mar 17, 2024, 12:32:43 PM
    Author     : Kelum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Medical Laboratory Website</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #e9eeff;
                padding-top: 90px; 
            }

            .navbar {
                min-height: 90px; 
            }

            .navbar-brand {
                font-size: 1.5rem; 
            }

            .navbar-nav .nav-link {
                padding-top: 20px; 
                padding-bottom: 20px;
            }

            .custom-navbar {
                background-color: #063970;
            }
            .jumbotron {
                background-image: url('./images/Lab.jpg');
                background-size: cover;
                color: #fff;
                text-align: center;
                padding: 100px 20px;
                margin-bottom: 0;
            }

            .section {
                padding: 50px 20px;
            }

            .section-header {
                text-align: center;
                margin-bottom: 40px;
            }

            .card {
                margin-bottom: 20px;
            }

            .btn-custom{
                background-color: #063970;
                color: #b5c4d4; 
            }

            .btn-custom:hover {
                background-color: #063970; 
                color:#fff;
            }
            
            .bg-custom{
                background-color: #e9eeff;
            }
            .bg-card-custom
            {
                 background-color: #d4e9ff;
            }
        </style>
    </head>
    <body>
        <!-- Navigation bar -->
        <nav class="navbar navbar-expand-lg navbar-dark custom-navbar fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#">ABC Laboratory</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#introduction">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#about">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#tests">Tests</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#contact">Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Sign In</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main content -->
        <div class="jumbotron">
            <h1 class="display-4">ABC Medical Laboratory</h1>
            <p class="lead">Providing accurate and reliable diagnostic services for over a decade.</p>
            <a class="btn btn-custom" href="#services">Learn More</a>
        </div>

        <!-- Sections -->

        <div id="introduction" class="section">
            <div class="container">
                <h2 class="section-header">Welcome to ABC Laboratory</h2>
                <p> At ABC Laboratory, we are dedicated to providing high-quality diagnostic services to our patients. With a commitment to accuracy, efficiency, and patient care, we strive to be a trusted partner in healthcare.</p>

                <h2 class="section-header">Our Vision</h2>
                <p> To be the leading provider of diagnostic services, known for our excellence in quality, innovation, and patient-centered care. </p>

                <h2 class="section-header">Our Mission</h2>
                <p>Our mission is to deliver accurate and reliable diagnostic results in a timely manner, using state-of-the-art technology and a team of experienced professionals. We aim to improve patient outcomes and enhance the quality of healthcare in our community.</p>

            </div>
        </div>

        <div id="about" class="section">
            <div class="container">
                <h2 class="section-header">About the Laboratory</h2>
                <p>Our medical laboratory is dedicated to providing high-quality diagnostic services to our patients. With state-of-the-art equipment and a team of experienced professionals, we ensure accurate and reliable test results.</p>
                <p>Established in 2003, we have been serving the community for over 20 years, continuously improving our services and expanding our test offerings to meet the evolving healthcare needs of our patients.</p>
                <p>At our laboratory, we prioritize patient care and safety, ensuring a comfortable and efficient testing experience for all our patients. Our commitment to quality and excellence drives us to constantly strive for improvement and innovation in our services.</p>
            </div>
        </div>

        <div id="services" class="section">
            <div class="container">
                <h2 class="section-header">Our Services</h2>
                <div class="card bg-card-custom">
                    <div class="card-body">
                        <h3 class="card-title">We offer a wide range of diagnostic tests to meet your healthcare needs.</h3>
                        <p class="card-text ">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item bg-custom">Blood Tests</li>
                            <li class="list-group-item">Urinalysis</li>
                            <li class="list-group-item bg-custom">Imaging Tests</li>
                            <li class="list-group-item">Cardiac Tests</li>
                            <li class="list-group-item bg-custom">Cancer Screening</li>
                            <li class="list-group-item">Diagnostic Procedures</li>
                            <li class="list-group-item bg-custom">Allergy Testing</li>
                            <li class="list-group-item">Genetic Testing</li>
                            <!-- Add more services here -->
                        </ul>
                        </p>
                    </div>
                </div>
            </div>
        </div>



        <div id="why-choose-us" class="section">
            <div class="container">
                <h2 class="section-header">Why Choose Us?</h2>
                <div class="row">
                    <div class="col-md-6">
                        <div class="card mb-4 bg-card-custom">
                            <div class="card-body">
                                <h3 class="card-title">Accurate and Reliable Results</h3>
                                <p class="card-text">We prioritize accuracy and reliability in all our diagnostic tests, ensuring that you receive the most precise results.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card mb-4 bg-card-custom">
                            <div class="card-body">
                                <h3 class="card-title">State-of-the-Art Technology</h3>
                                <p class="card-text">Our laboratory is equipped with the latest technology and equipment, allowing us to perform tests with precision and efficiency.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card mb-4 bg-card-custom">
                            <div class="card-body">
                                <h3 class="card-title">Experienced and Caring Staff</h3>
                                <p class="card-text">Our team of experienced professionals is dedicated to providing compassionate care and personalized service to all our patients.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card mb-4 bg-card-custom">
                            <div class="card-body">
                                <h3 class="card-title">Quick Turnaround Time</h3>
                                <p class="card-text">We understand the importance of timely results. Our streamlined processes ensure that you receive your test results as quickly as possible.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card mb-4 bg-card-custom">
                            <div class="card-body">
                                <h3 class="card-title">Commitment to Excellence</h3>
                                <p class="card-text">We are committed to upholding the highest standards of quality and excellence in everything we do, providing you with the best possible care.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card mb-4 bg-card-custom">
                            <div class="card-body">
                                <h3 class="card-title">Convenient Locations</h3>
                                <p class="card-text">With multiple locations, we strive to make accessing our services convenient for our patients.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card mb-4 bg-card-custom">
                            <div class="card-body">
                                <h3 class="card-title">Comprehensive Test Offerings</h3>
                                <p class="card-text">We offer a wide range of diagnostic tests, ensuring that you can get all your testing done in one place.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card mb-4 bg-card-custom">
                            <div class="card-body">
                                <h3 class="card-title">Patient-Focused Care</h3>
                                <p class="card-text">Your health and well-being are our top priorities. We are dedicated to providing you with the best possible care and support throughout your testing process.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <div id="tests" class="section">
            <div class="container">
                <h2 class="section-header">Tests Offered</h2>

                <div class="row row-cols-1 row-cols-md-2 g-4">
                    <div class="col">
                        <div class="card h-100 bg-card-custom">
                            <div class="card-body">
                                <h5 class="card-title">Blood Tests</h5>
                                <p class="card-text">
                                <ul>
                                    <li>Complete Blood Count (CBC)</li>
                                    <li>Blood Chemistry Panel (Basic Metabolic Panel, Comprehensive Metabolic Panel)</li>
                                    <li>Lipid Panel (Cholesterol, Triglycerides)</li>
                                    <li>Blood Glucose Test (Fasting Blood Sugar, Hemoglobin A1c)</li>
                                </ul>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card h-100 bg-card-custom">
                            <div class="card-body">
                                <h5 class="card-title">Urinalysis</h5>
                                <p class="card-text">
                                <ul>
                                    <li>Routine Urinalysis</li>
                                    <li>Urine Culture and Sensitivity</li>
                                </ul>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card h-100 bg-card-custom">
                            <div class="card-body">
                                <h5 class="card-title">Imaging Tests</h5>
                                <p class="card-text">
                                <ul>
                                    <li>X-rays</li>
                                    <li>Ultrasound</li>
                                    <li>MRI (Magnetic Resonance Imaging)</li>
                                    <li>CT (Computed Tomography) Scan</li>
                                </ul>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card h-100 bg-card-custom">
                            <div class="card-body">
                                <h5 class="card-title">Cardiac Tests</h5>
                                <p class="card-text">
                                <ul>
                                    <li>Electrocardiogram (ECG or EKG)</li>
                                    <li>Stress Test (Treadmill Test)</li>
                                    <li>Echocardiogram</li>
                                </ul>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card h-100 bg-card-custom">
                            <div class="card-body">
                                <h5 class="card-title">Cancer Screening</h5>
                                <p class="card-text">
                                <ul>
                                    <li>Pap Smear (for cervical cancer)</li>
                                    <li>Mammogram (for breast cancer)</li>
                                    <li>Prostate-Specific Antigen (PSA) Test (for prostate cancer)</li>
                                </ul>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card h-100 bg-card-custom">
                            <div class="card-body">
                                <h5 class="card-title">Diagnostic Procedures</h5>
                                <p class="card-text">
                                <ul>
                                    <li>Biopsy</li>
                                    <li>Endoscopy</li>
                                    <li>Colonoscopy</li>
                                </ul>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card h-100 bg-card-custom">
                            <div class="card-body">
                                <h5 class="card-title">Allergy Testing</h5>
                                <p class="card-text">
                                <ul>
                                    <li>Skin Prick Test</li>
                                    <li>Blood Test (Allergen-Specific Immunoglobulin E)</li>
                                </ul>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card h-100 bg-card-custom">
                            <div class="card-body">
                                <h5 class="card-title">Genetic Testing</h5>
                                <p class="card-text">
                                <ul>
                                    <li>Carrier Screening</li>
                                    <li>Genetic Predisposition Testing</li>
                                </ul>
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>



        <div id="contact" class="section">
            <div class="container">
                <h2 class="section-header">Contact Us</h2>

                <div class="row">
                    <div class="col-md-6">
                        <div class="card mb-3">
                            <div class="card-body">
                                <h3 class="card-title">Visit Us</h3>
                                <p>Kurunegala Road,<br>Puttalam, PX 61300</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card mb-3">
                            <div class="card-body">
                                <h3 class="card-title">Contact Information</h3>
                                <p>Email: info.abc.laboratories@gmail.com<br>Phone: 123-456-7890</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h3 class="card-title">Send Us a Message</h3>
                        <form method="post">
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="message" class="form-label">Message</label>
                                <textarea class="form-control" id="message" rows="3" required></textarea>
                            </div>
                            <div class="text-end">
                                <button type="submit" class="btn btn-custom">Send Message</button>
                            </div>
                            
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
    </body>
</html>


