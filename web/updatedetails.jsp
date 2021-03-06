<%-- 
    Document   : addbankdetails
    Created on : Aug 19, 2017, 7:08:56 PM
    Author     : Ganusha
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
                                    <form class="form-horizontal" role="form" name="form3" method="POST" action="UpdateDetails"  onsubmit="return validatebankForm();" >
                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">REG NO:</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="fbranch" id="fbranch" placeholder="" readonly>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">Contact No(Finance):</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="fbranchid" id="fbranchid" onkeypress="return IsNumeric0(event);" ondrop="return false;" maxlength="10"  placeholder="">
                                                <span id="errfincontactupdate" style="color: red; display: none">* Required</span>
                                                 <span id="error0" style="color: red; display: none">* Input digits (0 - 9)</span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Email(finace):</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="fbranchfincontact" id="fbranchfincontact" placeholder="">
                                                <span id="errfinmailupdate" style="color: red; display: none">* Invalid Email</span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">Contact No(ATM):</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="fbranchfinemail" id="fbranchfinemail" onkeypress="return IsNumeric0(event);" ondrop="return false;" maxlength="10"  placeholder="">
                                                <span id="erratmcontactupdate" style="color: red; display: none">* Required</span>
                                                 <span id="error0" style="color: red; display: none">* Input digits (0 - 9)</span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">Email(ATM)</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="fbranchmancontact" id="fbranchmancontact" placeholder="">
                                                <span id="erratmmailupdate" style="color: red; display: none">* Invalid Email</span>
                                                 
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">Head-Office Address:</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="fbranchmanemail" id="fbranchmanemail" placeholder="">
                                                <span id="erraddressupdate" style="color: red; display: none">* Required</span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">Web site:</label>
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
            var specialKeys = new Array();
            specialKeys.push(8); //Backspace
            function IsNumeric0(e) {
                var keyCode = e.which ? e.which : e.keyCode
                var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
                document.getElementById("error0").style.display = ret ? "none" : "inline";

                return ret;
            }
            
            function validatebankForm() {
                var errfincontact = document.forms["form3"]["fbranchid"].value;
                var errfinemail = document.forms["form3"]["fbranchfincontact"].value;
                var erratmcontact = document.forms["form3"]["fbranchfinemail"].value;
                var erratmemail = document.forms["form3"]["fbranchmancontact"].value;
                var erraddress = document.forms["form3"]["fbranchmanemail"].value;
                var errweb = document.forms["form3"]["fbranchaddress"].value;
                var ret;

                if (errfincontact == "") {
                    // alert("Name must be filled out");
                    var ret = false;
                    document.getElementById("errfincontactupdate").style.display = ret ? "none" : "inline";

                    return false;
                } else {
                    var ret = true;
                    document.getElementById("errfincontactupdate").style.display = ret ? "none" : "inline";
                }
                
                if (erratmcontact == "") {
                    // alert("Name must be filled out");
                    var ret = false;
                    document.getElementById("erratmcontactupdate").style.display = ret ? "none" : "inline";

                    return false;
                } else {
                    var ret = true;
                    document.getElementById("erratmcontactupdate").style.display = ret ? "none" : "inline";
                }

                if (erraddress == "") {
                    // alert("Name must be filled out");
                    var ret = false;
                    document.getElementById("erraddressupdate").style.display = ret ? "none" : "inline";

                    return false;
                } else {
                    var ret = true;
                    document.getElementById("erraddressupdate").style.display = ret ? "none" : "inline";
                }

                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                //alert(errfinemail);
                if (!(errfinemail.match(mailformat)))
                {
                    ret = false;
                    document.getElementById("errfinmailupdate").style.display = ret ? "none" : "inline";
                    document.form3.email.focus();
                    return false;

                }
                else
                {

                    ret = true;
                    document.form3.email.focus();
                    document.getElementById("errfinmailupdate").style.display = ret ? "none" : "inline";

                }





            }
            
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
