<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta HTMLCodeFormat(string [, version ])p-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="EMR User Home Page">
        <meta name="author" content="Snarna">

        <title>Sign In Page</title>

        <!-- Bootstrap core CSS -->
        <link href="../css/bootstrap-cerulean.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="../css/dashboard.css" rel="stylesheet">

        <!-- Sign In Page CSS -->
        <link href="../css/signin.css" rel="stylesheet">

        <!-- Animate CSS -->
        <link href="../css/animate.css" rel="stylesheet">

        <!-- Bootstrap core JavaScript -->
        <script src="../js/jquery-3.1.1.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>

        <!-- My Script -->
        <script src="../js/miscScript.js"></script>
        <script>
            $(document).ready(function () {
                //Hide Msg Div
                $("#responsediv").hide();

                //On Form Submit
                $("form").submit(function (event) {
                    //Hide Msg Div
                    $("#responsediv").hide();

                    //Prevent Submit
                    event.preventDefault();
                    //Get Information From Form
                    var email = $("#username").val();
                    var password = $("#password").val();
                    if (email && password) {
                        $.ajax({
                            url: "../classes/auth/loginService.cfc",
                            type: "POST",
                            data: {
                                method: "doLogin",
                                proEmail: email,
                                proPassword: password
                            },
                            dataType: "json",
                            success: function (data) {
                              console.log("data:"+data);
                                if (data == true) {
                                    //Success
                                    window.location.href = "../pages/patients.cfm";
                                } else {
                                    responseErrMsg("Login failed! Please check your username and password");
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
        <nav class="navbar navbar-default navbar-fixed-top mytransparent">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">EMR Home</a>
                </div>
            </div>
        </nav>

        <!-- main container -->
        <div class="container-fluid">
            <div class="modal-dialog animated fadeIn">
                <div class="modal-content mytransparent">
                    <div class="modal-header">
                        <h1 class="text-center">Welcome EMR System</h1>
                    </div>
                    <div class="modal-body">
                        <form id="loginform">
                            <div class="alert alert-danger" id="responsediv" style="display:none;"></div>
                            <div class="form-group">
                                <input type="text" class="form-control input-lg" name="username" id="username" placeholder="Username"required>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control input-lg" name="password" id="password" placeholder="Password" required>
                            </div>
                            <div class="form-group">
                              <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
                            </div>
                            <span>
                                <a href="#">Forgot Password</a>
                            </span>
                            <span class="pull-right">
                                <a href="../pages/signup.cfm">Sign Up</a>
                            </span>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>
