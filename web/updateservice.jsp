<%-- 
    Document   : addbankdetails
    Created on : Aug 19, 2017, 7:08:56 PM
    Author     : Ganusha
--%>

<!DOCTYPE html>

<%      
       String username = (String)session.getAttribute("user");
       String password = (String)session.getAttribute("pass");
   if(username == null || password == null){
   response.sendRedirect("./login.jsp");}
%>
<html>
    <head>
        <title>Bootstrap Admin Theme v3</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- jQuery UI -->
        <link href="https://code.jquery.com/ui/1.10.3/themes/redmond/jquery-ui.css" rel="stylesheet" media="screen">

        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- styles -->
        <link href="css/styles.css" rel="stylesheet">

        <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
        <link href="vendors/form-helpers/css/bootstrap-formhelpers.min.css" rel="stylesheet">
        <link href="vendors/select/bootstrap-select.min.css" rel="stylesheet">
        <link href="vendors/tags/css/bootstrap-tags.css" rel="stylesheet">

        <link href="css/forms.css" rel="stylesheet">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body >


        <div id="content" class="page-content" style="position: absolute; z-index: 12; margin-left: 28%; margin-top: 5%; width: 100%;">
            <div class="row">

                <div class="col-md-10">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="content-box-large">
                                <div class="panel-heading">
                                    <div class="panel-title">Service Details Form</div>

                                    <div class="panel-options">
                                        <button class="btn btn-sm btn-danger" onclick="closeForm();"><i class="glyphicon glyphicon-remove" ></i> </button>
                                    </div>
                                </div>


                                <div class="panel-body">
                                    <form name="form2" class="form-horizontal" role="form" method="POST" action="UpdateService" onsubmit="return validateUpdateForm();">
                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">Service ID:</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="serviceid" id="serviceid" placeholder="" readonly>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">Service Name:</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="servicename" id="servicename" placeholder="">
                                                <span id="error2" style="color: red; display: none">* Required</span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Description:</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="description" id="description" placeholder="">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">Contact No:</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="contactno" id="contactno" placeholder="">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">Email:</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="email" id="email" placeholder="">
                                                <span id="errormail" style="color: red; display: none">* Invalid Email</span>
                                            </div>
                                        </div>

                                        <div class="form-group pull-right">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button type="submit" class="btn btn-primary">Update</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>








                    <!--  Page content -->
                </div>
            </div>
        </div>

        <script>

            function  closeForm() {
                $('content').hide();
            }

            function validateUpdateForm() {
                var errcontact = document.forms["form2"]["contactno"].value;
                //var errid = document.forms["form1"]["serviceid"].value;
                var errname = document.forms["form2"]["servicename"].value;
                var erremail = document.forms["form2"]["email"].value;

                if (errname == "") {
                    // alert("Name must be filled out");
                    var ret = false;
                    document.getElementById("error2").style.display = ret ? "none" : "inline";

                    return false;
                } else {
                    var ret = true;
                    document.getElementById("error2").style.display = ret ? "none" : "inline";
                }

                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (erremail.match(mailformat))
                {
                    var ret = true;
                    document.form2.email.focus();
                    document.getElementById("errormail").style.display = ret ? "none" : "inline";
                    //alert("passed");
                    return true;
                }
                else
                {

                    var ret = false;
                    document.form2.email.focus();
                    document.getElementById("errormail").style.display = ret ? "none" : "inline";
                    return false;
                }
                //var theIDnumber=/SER /;

                //if (errcontact.match(theIDnumber)) {
                // alert code goes here

                // return true;
                //} else {
                //     alert('Please supply a valid ID number');
                //    return false;
                // }

            }
        </script>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://code.jquery.com/jquery.js"></script>
        <!-- jQuery UI -->
        <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap/js/bootstrap.min.js"></script>

        <script src="vendors/form-helpers/js/bootstrap-formhelpers.min.js"></script>

        <script src="vendors/select/bootstrap-select.min.js"></script>

        <script src="vendors/tags/js/bootstrap-tags.min.js"></script>

        <script src="vendors/mask/jquery.maskedinput.min.js"></script>

        <script src="vendors/moment/moment.min.js"></script>

        <script src="vendors/wizard/jquery.bootstrap.wizard.min.js"></script>

        <!-- bootstrap-datetimepicker -->
        <link href="vendors/bootstrap-datetimepicker/datetimepicker.css" rel="stylesheet">
        <script src="vendors/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script> 


        <link href="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet"/>
        <script src="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/js/bootstrap-editable.min.js"></script>

        <script src="js/custom.js"></script>
        <script src="js/forms.js"></script>
    </body>
</html>