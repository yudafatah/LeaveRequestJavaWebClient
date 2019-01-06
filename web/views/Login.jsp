<%-- 
    Document   : Login
    Created on : Dec 13, 2018, 11:38:46 AM
    Author     : yudafatah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../assets/container/header.jsp"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            .modal-header, h4, .close {
                background-color: #5cb85c;
                color:white !important;
                text-align: center;
                font-size: 30px;
            }
            .modal-footer {
                background-color: #f9f9f9;
            }
        </style>
        <title>Login Page</title>
    </head>
    <body>

        <%  String message = "";
            if (session.getAttribute("message") != null) {
                message = session.getAttribute("message").toString();
            }
        %>

        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">

                    <div class="login-panel panel panel-default">

                        <div class="panel panel-primary">
                            <div class="panel-primary">
                                <div class="row"> <br>
                                    <div class="col-xs-12 text-center">
                                        <img src="../assets/profile/MII.png" width="50%">
                                    </div>
                                </div>
                            </div> <br> <br>
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-12 text-right">
                                        <div class="huge" align="center">Welcome To<br> Leave Request System</div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <a class="btn btn-success col-xs-12" data-toggle="modal" data-target="#myModal">Sign</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--
            <h2>Login Page</h2>
             Trigger the modal with a button 
            <button type="button" class="btn btn-default btn-lg" id="myBtn">Login</button>
            -->
            <!-- Modal -->
            <div class="modal" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content fade in">
                        <div class="modal-header" style="padding:10px 10px;">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <!--<h4><span><img class="col-xs-12" align="center" src="../assets/profile/MII.png" width="30%"></span></h4>-->
                        </div>
                        <div class="modal-body" style="padding:40px 50px;">
                            <form action="../validationLoginn" method="POST">
                                <div class="form-group">
                                    <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
                                    <input type="text" class="form-control" id="uname" name="email" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
                                    <input type="password" class="form-control" id="pass" name="pass" placeholder="Enter password">
                                </div>
                                <div class="checkbox">
                                    <!--<label><input type="checkbox" value="" >Remember me</label>-->
                                </div>
                                <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off" id="sbtn"></span> Login</button>
                                <div class="alert alert-danger fade" id="alert">
                                    <%= message%>
                                </div>
                            </form>
                        </div>
                        <!--                        <div class="modal-footer">
                                                     <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                                                    
                                                </div>-->
                    </div>

                </div>
            </div> 

            <script>
                //
                //$(window).on('load',function(){
                //        $('#myModal').modal('show');
                //    });
                $(document).ready(function () {
                    $("#sbtn").click(function () {
                        $("#alert").show();
                    });
                });
            </script>
    </body>
</html>
