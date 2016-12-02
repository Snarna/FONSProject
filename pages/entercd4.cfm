<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="EMR User Home Page">
        <meta name="author" content="Snarna">

        <title>CD4 Page</title>
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
                  url: "../classes/patient/cd4Service.cfc",
                  data: {
                      method: "getCD4",
                      pid: pid
                  },
                  dataType: "json",
                  success: function (data) {
                      $("#cd4history").html(data);
                  },
                  error: function (error) {
                      console.log("Error!:" + error);
                  }
              });
            }

            function edit(btn){
              var tr = $(btn).closest("tr").find("td");
              var oldNum = $(tr[1]).html();
              var oldNotes = $(tr[3]).html();
              $(tr[1]).html("<input class='input' type='number' value='"+oldNum+"'></input>");
              $(tr[3]).html("<input class='input' type='text' value='"+oldNotes+"'></input>");
              $(btn).replaceWith("<button class='btn btn-xs btn-primary' onclick='save(this);'>Save</button>");
            }

            function save(btn){
              var tr = $(btn).closest("tr").find("td");
              var cd4Id = $($(tr[0])).html();
              var newNum = $($(tr[1]).find("input")[0]).val();
              var newNotes = $($(tr[3]).find("input")[0]).val();
              $.ajax({
                  url: "../classes/patient/cd4Service.cfc",
                  data: {
                      method: "editCD4",
                      newNum: newNum,
                      newNotes: newNotes,
                      cd4Id: cd4Id
                  },
                  success: function (data) {
                    $(tr[1]).html(newNum);
                    $(tr[3]).html(newNotes);
                    $(btn).replaceWith("<button class='btn btn-xs' onclick='edit(this);'>Edit</button>");
                  },
                  error: function (error) {
                      console.log("Error!:" + JSON.stringify(error));
                  }
              });
            }

            $(document).ready(function () {
              $( function() {
                $( "#cd4date" ).datepicker();
              });
              getPatientDetail();
              getHistory();
              $("form").submit(function (event) {
                  //Prevent Submit
                  event.preventDefault();

                  //Get Information From Form
                  var cd4Num = $("#cd4num").val();
                  var cd4Date = $("#cd4date").val();
                  var cd4Notes = $("#cd4notes").val();

                  if (cd4Num && cd4Date) {
                      $.ajax({
                          url: "../classes/patient/cd4Service.cfc",
                          type: "POST",
                          data: {
                              method: "insertCD4",
                              pid: pid,
                              cd4Test: cd4Num,
                              cd4Date: cd4Date,
                              cd4Notes: cd4Notes
                          },
                          success: function (data) {
                            if(data != ""){
                              var newRow = "<tr><td>"+ data +"</td><td>" + cd4Num + "</td><td>" + cd4Date + "</td><td>" + cd4Notes + "</td><td><button class='btn btn-xs' onclick='edit(this);'>Edit</button></td></tr>";
                              $("#cd4table tr:last").after(newRow);
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
                    CD4
                  </li>
              </ol>
          </div>
            <div class="main">
              <div class="row ">
                <div class="col-sm-12">
                  <h1 class="page-header">CD4 Information</h1>
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
                  <table class="table" id="cd4table">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>CD4 Number</th>
                        <th>Date</th>
                        <th>Notes</th>
                        <th>Edit</th>
                      </tr>
                    </thead>
                    <tbody id="cd4history">

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
                    <form id="cd4form">
                        <div class="form-group">
                          <div class="row">
                            <div class="col-sm-6">
                              <label for="patientId">CD4 Number*:</label>
                              <input type="number" class="form-control" id="cd4num" required>
                            </div>
                            <div class="col-sm-6">
                              <label for="patientId">Date*:</label>
                              <input type="text" class="form-control" id="cd4date" required>
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                            <label for="notes">CD4 Notes:</label>
                            <textarea class="form-control" id="cd4notes" rows="3"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Submit</button>
                    </form>
                  </div>
                </div>
            </div>
        </div>
    </body>

</html>
