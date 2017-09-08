<%-- 
    Document   : updateservicedetails
    Created on : Aug 23, 2017, 3:46:31 PM
    Author     : ganusha_m
--%>



<!DOCTYPE html>
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
                                    <div class="panel-title">Branch Details Form</div>

                                    <div class="panel-options">
                                        <button class="btn btn-sm btn-danger" onclick="closeForm();"><i class="glyphicon glyphicon-remove"></i> </button>
                                    </div>
                                </div>


                                <div class="panel-body">
                                    <form class="form-horizontal" role="form" method="POST" action="UpdateBankDetails">
                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">Branch:</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="fbranch" id="fbranch" placeholder="">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">Branch ID:</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="fbranchid" id="fbranchid" placeholder="">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Contact(Finance)</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="fbranchfincontact" id="fbranchfincontact" placeholder="">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">Email(Finance)</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="fbranchfinemail" id="fbranchfinemail" placeholder="">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">Contact(Branch Manager)</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="fbranchmancontact" id="fbranchmancontact" placeholder="">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">Email(Branch Manager)</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="fbranchmanemail" id="fbranchmanemail" placeholder="">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">Address</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="fbranchaddress" id="fbranchaddress"  placeholder="">
                                            </div>
                                        </div>



                                        <div class="form-group">
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
            function upDetail(val) {
                //alert("aaaaaaaaaaaaaaaaa");
                //alert(val);
                jQuery.ajax({
                    type: 'POST',
                    url: "LoadBranchDetails?branch=" + val,
                    dataType: 'json',
                    async: false,
                    success: function(data) {

                        //alert(data);
                        //alert(JSON.stringify(data));
                        // alert(data.regno);
                        //document.getElementById("my").innerHTML = "okkkkkkkkkkkkkkkkkkkkkkkk";
                        document.getElementById("fbranch").value = data.name;
                        document.getElementById("fbranchid").value = data.regno;
                        document.getElementById("fbranchfincontact").value = data.contactfinance;
                        document.getElementById("fbranchfinemail").value = data.emailfinance;
                        document.getElementById("fbranchmancontact").value = data.contactmanager;
                        document.getElementById("fbranchmanemail").value = data.emailmanager;
                        document.getElementById("fbranchaddress").value = data.address;


                    }
                });
            }
            function  closeForm() {
                $('content').hide();
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