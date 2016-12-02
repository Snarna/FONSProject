<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="EMR User Home Page">
        <meta name="author" content="Snarna">

        <title>Survey Details Page</title>
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
            var surveyId = <cfoutput>#url.surveyid#</cfoutput>

            function getSurveyDetail() {
              $("#surveyid").html(surveyId);
              $.ajax({
                  url: "../classes/patient/getSurvey.cfc",
                  data: {
                      method: "getSurvey",
                      pid: pid,
                      surveyid: surveyId
                  },
                  dataType: "json",
                  success: function (data) {
                      $("#q1a").html(data.q1a);
                      $("#q2a").html(data.q2a);
                      $("#q3a").html(data.q3a);
                  },
                  error: function (error) {
                      console.log("Error!:" + error);
                  }
              });
            }

            function backToPatientDetail(){
              window.location.href = "../pages/patientdetail.cfm?pid=" + pid;
            }
            $(document).ready(function () {
                getSurveyDetail();
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
                    <li><a href="patientdetail.cfm?pid=<cfoutput>#url.pid#</cfoutput>">Details</a></li>
                    <li class="active">
                      Survey Details
                    </li>
                </ol>
            </div>
            <div class="main">
                <div class="row">
                    <div class="col-sm-12">
                        <h1 class="page-header">Survey Details</h1>
                    </div>
                </div>
                <div class="row">
                  <div class="col-sm-2">
                    <strong>Survey ID:</strong>
                  </div>
                  <div class="col-sm-10" id="surveyid">

                  </div>
                </div>
                <hr>

                <div class="row">
                  <div class="col-sm-2">
                    Question 1:
                  </div>
                  <div class="col-sm-10" id="q1">
                     How confident are you that you can control and manage most of your health problems?
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="col-sm-2">
                    Answer 1:
                  </div>
                  <div class="col-sm-10" id="q1a">

                  </div>
                </div>
                <hr>

                <div class="row">
                  <div class="col-sm-2">
                    Question 2:
                  </div>
                  <div class="col-sm-10" id="q2">
                     How confident are you that you can control and manage most of your health problems?
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="col-sm-2">
                    Answer 2:
                  </div>
                  <div class="col-sm-10" id="q2a">

                  </div>
                </div>
                <hr>
                <div class="row">
                  <div class="col-sm-2">
                    Question 3:
                  </div>
                  <div class="col-sm-10" id="q3">
                     How confident are you that you can control and manage most of your health problems?
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="col-sm-2">
                    Answer 3:
                  </div>
                  <div class="col-sm-10" id="q3a">

                  </div>
                </div>
                <hr>
                <div class="row">
                  <button class="btn btn-primary" onclick="backToPatientDetail();">Back</button>
                </div>
            </div>
        </div>
    </body>

</html>
