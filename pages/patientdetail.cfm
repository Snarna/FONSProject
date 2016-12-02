<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="EMR User Home Page">
        <meta name="author" content="Snarna">

        <title>Patient Detail Page</title>
        <!-- My Css -->
        <link href="../css/mycss.css" rel="stylesheet">

        <!-- Bootstrap core CSS -->
        <link href="../css/bootstrap-cerulean.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="../css/dashboard.css" rel="stylesheet">

        <!-- Animate CSS -->
        <link href="../css/animate.css" rel="stylesheet">

        <!-- Bootstrap core JavaScript -->
        <script src="../js/jquery-3.1.1.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>

        <!-- My Script -->
        <script src="../js/miscScript.js"></script>
        <script>
            var pid = <cfoutput>#url.pid#</cfoutput>

            function viewPatientSurveyDetail(surveyId){
                window.location.href = "../pages/surveydetail.cfm?pid=" + pid + "&surveyid=" + surveyId;
            }

            function enterCD4(){
              window.location.href = "../pages/entercd4.cfm?pid=" + pid;
            }

            function enterViral(){
              window.location.href = "../pages/enterviralload.cfm?pid=" + pid;
            }

            function getPatientDetail() {
                $.ajax({
                    url: "../classes/patient/getPatientDetail.cfc",
                    data: {
                        method: "getPatientDetail",
                        pid: pid
                    },
                    dataType: "json",
                    success: function (data) {
                        $("#name").html(data.fname + " " + data.lname);
                        $("#dob").html(data.dob);
                    },
                    error: function (error) {
                        console.log("Error!:" + error);
                    }
                });
            }

            function getSurveyNum() {
                $.ajax({
                    url: "../classes/patient/getPatientDetail.cfc",
                    data: {
                        method: "getPatientSurveyNum",
                        pid: pid
                    },
                    dataType: "json",
                    success: function (data) {
                        $("#surveynum").html(data);
                    },
                    error: function (error) {
                        console.log("Error!:" + error);
                    }
                });
            }

            function getPatientSurveys(){
              $.ajax({
                  url: "../classes/patient/getPatientSurveys.cfc",
                  data: {
                      method: "getPatientSurveys",
                      pid: pid
                  },
                  dataType: "json",
                  success: function (data) {
                      $("#surveystablebody").html(data);
                  },
                  error: function (error) {
                      console.log("Error!:" + error);
                  }
              });
            }

            $(document).ready(function () {
                getPatientDetail();
                getSurveyNum();
                getPatientSurveys();
            });
        </script>
    </head>

    <body>

        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">EMR</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#">Profile</a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Welcome,
                                <cfoutput>#Session.userFname#</cfoutput>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#">
                                        <i class="icon-envelope"></i>Support</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="signin.cfm?logout">
                                        <i class="icon-off"></i>Logout</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <br>
        <div class="container-fluid">
            <div class="row">
                <ol class="breadcrumb fixedUnderNav">
                    <li>
                        <a href="patients.cfm">Patients</a>
                    </li>
                    <li class="active">Details</li>
                </ol>
            </div>
            <div class="main">
                <div class="row">
                    <div class="col-sm-12">
                        <h1 class="page-header">Patient Details</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-2">
                        <strong>Name:</strong>
                    </div>
                    <div class="col-sm-10">
                        <span id="name"></span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-2">
                        <strong>Date of Birth:</strong>
                    </div>
                    <div class="col-sm-10">
                        <span id="dob"></span>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-sm-2">
                        <strong>Surveys Taken:</strong>
                    </div>
                    <div class="col-sm-10">
                        <span id="surveynum"></span>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-sm-2">
                        <strong>Surveys:</strong>
                    </div>
                    <div class="col-sm-10">
                        <table class="table table-condensed">
                            <thead>
                                <tr>
                                    <th>
                                        Survey ID
                                    </th>
                                    <th>
                                        Date Taken
                                    </th>
                                    <th>
                                        Details
                                    </th>
                                </tr>
                            </thead>
                            <tbody id="surveystablebody"></tbody>
                        </table>
                    </div>
                </div>

                <hr>
                <div class="row">
                    <div class="col-sm-6">
                        <button class="btn btn-primary btn-block" onclick="enterCD4()">View & Edit CD4</button>
                    </div>
                    <div class="col-sm-6">
                        <button class="btn btn-primary btn-block" onclick="enterViral()">View & Edit Viral Load</button>
                    </div>
                </div>
            </div>
        </body>

    </html>
