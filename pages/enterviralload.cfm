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

            function edit(btn){
              var tr = $(btn).closest("tr");
              var tds = $(tr).find("td");
              var oldNum = $(tds[1]).html();
              var oldDate = $(tds[2]).html();
              var oldNotes = $(tds[3]).html();
              $(tds[1]).html("<div class='form-group form-group-sm'><input class='form-control input-sm input-slim' type='number'  min='0' value='"+oldNum+"' required></div>");
              $(tds[2]).html("<div class='form-group form-group-sm'><input class='form-control input-sm' type='text' value='"+oldDate+"' required></div>");
              $(tds[3]).html("<div class='form-group form-group-sm'><input class='form-control input-sm' type='text' ></div>");
              $($(tds[3]).find("input")[0]).val(oldNotes);
              $($(tds[2]).find("input")[0]).datepicker({
                changeMonth: true,
                changeYear: true
              });
              $(btn).replaceWith("<button class='btn btn-xs btn-primary' onclick='save(this);'>Save</button>");
            }

            function save(btn){
              var tr = $(btn).closest("tr");
              var tds = $(tr).find("td");
              var viralLoadId = $($(tds[0])).html();
              var newNum = $($(tds[1]).find("input")[0]).val();
              var newDate = $($(tds[2]).find("input")[0]).val();
              var newNotes = $($(tds[3]).find("input")[0]).val();
              //Remove has-error
              $($(tds[1]).find("div").removeClass("has-error"));
              $($(tds[2]).find("div").removeClass("has-error"));
              if(newNum && newDate){
                $.ajax({
                    url: "../classes/patient/viralLoadService.cfc",
                    data: {
                        method: "editViralLoad",
                        newNum: newNum,
                        newDate: newDate,
                        newNotes: newNotes,
                        viralLoadId: viralLoadId
                    },
                    success: function (data) {
                      tr.html(data);
                      greenBackgroundElm(tr);
                    },
                    error: function (error) {
                        console.log("Error!:" + JSON.stringify(error));
                    }
                });
              }
              else{
                if(newNum == ""){
                  $($(tds[1]).find("div").addClass("has-error"));
                  redBackgroundElm($(tds[1]).find("input"));
                }
                if(newDate == ""){
                  $($(tds[2]).find("div").addClass("has-error"));
                  redBackgroundElm($(tds[2]).find("input"));
                }
              }
            }

            $(document).ready(function () {
              $( function() {
                $( "#vldate" ).datepicker({
                  changeMonth: true,
                  changeYear: true
                });
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
                                $("#vltable tr:last").after(data);
                                fadeInElement($("#vltable tr:last"));
                                $(':input', '#vlform').not(':button, :submit, :reset, :hidden').removeAttr('checked').removeAttr('selected').not('‌​:checkbox, :radio, select').val('');
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
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Welcome,
                                <cfoutput>#Session.userFname#</cfoutput>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
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
            <div class="main animated fadeIn">
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
                        <th>Creation Date</th>
                        <th>Last Edit Date</th>
                        <th>Edit</th>
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
                              <input type="number" class="form-control"  min='0' id="vlnum" required>
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
