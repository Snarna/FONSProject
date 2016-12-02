<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="EMR User Home Page">
        <meta name="author" content="Snarna">

        <title>Viral Load Page</title>
        <!-- My Css -->
        <link href="../css/mycss.css" rel="stylesheet">

        <!-- Bootstrap core CSS -->
        <link href="../css/bootstrap-cerulean.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="../css/dashboard.css" rel="stylesheet">

        <!-- Animate CSS -->
        <link href="../css/animate.css" rel="stylesheet">

        <!-- JQuery-UI CSS -->
        <link href="../css/jquery-ui.min.css" rel="stylesheet">

        <!-- Bootstrap core JavaScript -->
        <script src="../js/jquery-3.1.1.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/jquery-ui.min.js"></script>

        <!-- My Script -->
        <script src="../js/miscScript.js"></script>
        <script>
            var pid = <cfoutput>#url.pid#</cfoutput>;

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

            function getHistory(){
              $.ajax({
                  url: "../classes/patient/viralLoadService.cfc",
                  data: {
                      method: "getVL",
                      pid: pid
                  },
                  dataType: "json",
                  success: function (data) {
                      $("#vlhistory").html(data);
                  },
                  error: function (error) {
                      console.log("Error!:" + error);
                  }
              });
            }

            $(document).ready(function () {
              $( function() {
                $( "#vldate" ).datepicker();
              });
                getPatientDetail();
                getHistory();
                $("form").submit(function (event) {
                    //Prevent Submit
                    event.preventDefault();

                    //Get Information From Form
                    var vlNum = $("#vlnum").val();
                    var vlDate = $("#vldate").val();
                    var vlNotes = $("#vlnotes").val();

                    if (vlNum && vlDate) {
                        $.ajax({
                            url: "../classes/patient/viralLoadService.cfc",
                            type: "POST",
                            data: {
                                method: "insertVL",
                                pid: pid,
                                vlTest: vlNum,
                                vlDate: vlDate,
                                vlNotes: vlNotes
                            },
                            success: function (data) {
                              if(data != ""){
                                var newRow = "<tr><td>"+ data +"</td><td>" + vlNum + "</td><td>" + vlDate + "</td><td>" + vlNotes + "</td></tr>";
                                $("#vltable tr:last").after(newRow);
                              }
                            },
                            error: function (err) {
                                responseErrMsg("Error:" + err);
                            }
                        });
                    }
                });
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
                    Viral Load
                  </li>
              </ol>
          </div>
            <div class="main">
              <div class="row ">
                <div class="col-sm-12">
                  <h1 class="page-header">Viral Load Information</h1>
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
                <div class="col-sm-12">
                  <h3>History</h3>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <table class="table" id="vltable">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>Viral Load Number</th>
                        <th>Date</th>
                        <th>Notes</th>
                      </tr>
                    </thead>
                    <tbody id="vlhistory">

                    </tbody>
                  </table>
                </div>
              </div>
              <hr>
                <div class="row">
                  <div class="col-sm-12">
                    <h3>Enter New Record</h3>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-12">
                    <form id="vlform">
                        <div class="form-group">
                          <div class="row">
                            <div class="col-sm-6">
                              <label for="patientId">Viral Load Number*:</label>
                              <input type="number" class="form-control" id="vlnum" required>
                            </div>
                            <div class="col-sm-6">
                              <label for="patientId">Date*:</label>
                              <input type="text" class="form-control" id="vldate" required>
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                            <label for="notes">Viral Load Notes:</label>
                            <textarea class="form-control" id="vlnotes" rows="3"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Submit</button>
                    </form>
                  </div>
                </div>
            </div>
        </div>
    </body>

</html>
