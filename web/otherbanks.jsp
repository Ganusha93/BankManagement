<%-- 
    Document   : otherbanks
    Created on : Aug 21, 2017, 8:56:23 AM
    Author     : ganusha_m
--%>

<!DOCTYPE html>
<%
    String username = (String) session.getAttribute("user");
    String password = (String) session.getAttribute("pass");
    if (username == null || password == null) {
        response.sendRedirect("./login.jsp");
    }
%>
<html>
    <head>
        <title>Bootstrap Admin Theme v3</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- styles -->
        <link href="css/styles.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
            < !--[if lt IE 9] >
                    < script src = "https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js" ></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->


    </head>
    <body>
        <div id="form" style="display:none ; width: 200%;"><jsp:include page="updatebankdetails.jsp" /></div> 
        <div class="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-5 ">
                        <!-- Logo -->
                        <div class="logo">
                            <h1><a href="index.html">Bank Administrative System</a></h1>
                        </div>
                    </div>
                    <%String name = (String) session.getAttribute("user");%>
                    <div class="col-md-5">


                    </div>
                    <div class="col-md-2">

                        <label class="active label  lg " style="margin-top: 5%;"><%= name%><span class="glyphicon glyphicon-user"></span> </label>
                        <a href="LogoutServlet" style="margin-top: 8%;"class="btn btn-primary btn-sm" >Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="page-content" id="pagecontent">

            <div class="row">
                <div class="col-md-2">
                    <div class="sidebar content-box" style="display: block;">
                        <ul class="nav">
                            <!-- Main menu -->
                            <li ><a href="LoadServices"><i class="glyphicon glyphicon-home"></i> Services</a></li>
                            <li><a href="LoadDetails"><i class="glyphicon glyphicon-calendar"></i>Bank details</a></li>
                            <li class="current"><a href="otherbanks.jsp"><i class="glyphicon glyphicon-stats"></i> Other Banks</a></li>
                            <li class="current"><a href="#"><i></i> </a></li>
                            <li class="current"><a href="#"><i></i> </a></li>


                        </ul>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="content-box-large panel-body" >
                                <div class="panel-heading">
                                    <div class="form-group col-md-5">

                                        <div class="col-md-9">
                                            <input class="form-control" placeholder="Bank Name" type="text"  id="bank" onkeyup="showData(this.value);" >
                                            <div style="position: absolute; z-index: 2; list-style: none; background-color: #F0F8FF; width: 92%;" id="autocomplete" ></div>

                                        </div>
                                        <div class="col-lg-3 pull-right ">

                                            <button  class="btn btn-primary btn-sm col-lg-12  " id="addnewservice" onclick="bankSelect();" >Search</button>
                                        </div>

                                    </div>
                                    <div class="form-group col-md-5">

                                        <div class="col-md-9">
                                            <input class="form-control" placeholder="Branch Name" type="text"  id="branch" onkeyup="showBranchData(this.value);"  disabled>
                                            <div style="position: absolute; z-index: 2; list-style: none; background-color: #F0F8FF; width: 92%;" id="autocompletebranch" ></div>

                                        </div>
                                        <div class="col-lg-3 pull-right ">

                                            <button  class="btn btn-primary btn-sm col-lg-12  " id="addnewservice" onclick="branchSelect();" >Search</button>
                                        </div>

                                    </div>

                                    <div class="panel-options">

                                    </div>

                                    <div id="panelbody" style="display: none; ">
                                        <div class=" row col-lg-12 Bold" ><h1 id="name">Sampath Bank</h1></div>
                                        <table class="table table-user-information">
                                            <tr >
                                                <td><lable>Reg No:</lable></td>
                                            <td id="regno"></td>    

                                            </tr>

                                            <tr >
                                                <td><lable>Contact No(Finance):</lable></td>
                                            <td id="fincontact"><lable></lable></td>    

                                            </tr>
                                            <tr >
                                                <td><lable>Email(finace)</lable></td>
                                            <td id="finemail"></td>    

                                            </tr>
                                            <tr >
                                                <td><lable>Contact No(ATM):</lable></td>
                                            <td id="atmcontact"></td> <br><br>
                                            </tr>
                                            <tr >
                                                <td><lable>Email(ATM)</lable></td>
                                            <td id="atmemail"></td>    

                                            </tr>

                                            <tr >
                                                <td><lable>Head-Office Address:</lable></td>
                                            <td id="address"></td>    

                                            </tr>
                                            <tr >
                                                <td><lable>Web site:</lable></td>
                                            <td id="web"></td>    

                                            </tr>





                                        </table>
                                    </div>

                                    <div id="panelbody" style="display: none; ">
                                        <div class=" row col-lg-12 Bold" ><h1 id="name">Sampath Bank</h1></div>
                                        <table class="table table-user-information table-striped">
                                            <tr >
                                                <td><lable>Reg No:</lable></td>
                                            <td id="regno"></td>    

                                            </tr>

                                            <tr >
                                                <td><lable>Contact No(Finance):</lable></td>
                                            <td id="fincontact"><lable></lable></td>    

                                            </tr>
                                            <tr >
                                                <td><lable>Email(finace)</lable></td>
                                            <td id="finemail"></td>    

                                            </tr>
                                            <tr >
                                                <td><lable>Contact No(ATM):</lable></td>
                                            <td id="atmcontact"></td> <br><br>
                                            </tr>
                                            <tr >
                                                <td><lable>Email(ATM)</lable></td>
                                            <td id="atmemail"></td>    

                                            </tr>

                                            <tr >
                                                <td><lable>Head-Office Address:</lable></td>
                                            <td id="address"></td>    

                                            </tr>
                                            <tr >
                                                <td><lable>Web site:</lable></td>
                                            <td id="web"></td>    

                                            </tr>





                                        </table>
                                    </div>


                                    <div id="branchdetail" style="display: none">
                                        <div class=" row col-lg-12 "><h1 class="bold">Sampath Bank</h1> <p id="branch"></p></div>
                                        <table class="table table-user-information table-striped">
                                            <tr >
                                                <td><lable>Branch ID:</lable></td>
                                            <td id="branchid"></td>    

                                            </tr>

                                            <tr >
                                                <td><lable>Contact No(Finance):</lable></td>
                                            <td id="branchfincontact"></td>    

                                            </tr>
                                            <tr >
                                                <td><lable>Email(finace)</lable></td>
                                            <td id="branchfinemail"></td>    

                                            </tr>
                                            <tr >
                                                <td><lable>Contact No(Branch Manager):</lable></td>
                                            <td id="branchmancontact"></td> <br><br>
                                            </tr>
                                            <tr >
                                                <td><lable>Email(Brach Manager)</lable></td>
                                            <td id="branchmanemail"></td>    

                                            </tr>

                                            <tr >
                                                <td><lable>Branch Address:</td>
                                                <td id="branchaddress"></td>    

                                                </tr>






                                        </table>

                                        <div class="col-lg-2 pull-right ">
                                            <button  class="btn btn-primary btn-mini col-lg-12  " id="addnewservice" onclick="loadForm(document.getElementById('branch').value)"  style="margin-bottom: 4%;">Edit Details</button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>




                    </div>
                </div>
            </div>

            <footer style="position: fixed; width: 100%;">
                <div class="container ">

                    <div class="copy text-center">
                        Copyright 2017 <a href='#'>Bank Management System @epic</a>
                    </div>

                </div>
            </footer>


            <script>


                function bankSelect() {

                    document.getElementById("branch").disabled = false;
                    //$('#panelbody').load('otherbankdetails.jsp');

                    var res = document.getElementById("bank").value;
                    //alert(res.toString());
                    jQuery.ajax({
                        type: 'POST',
                        url: "LoadBankDetail?bank=" + res,
                        dataType: 'json',
                        async: false,
                        success: function(data) {

                            //alert(data);
                            //alert(JSON.stringify(data));
                            //alert(data.regno);
                            //document.getElementById("my").innerHTML = "okkkkkkkkkkkkkkkkkkkkkkkk";
                            document.getElementById("regno").innerHTML = data.regno;
                            document.getElementById("name").innerHTML = data.name;
                            document.getElementById("fincontact").innerHTML = data.contactfinance;
                            document.getElementById("finemail").innerHTML = data.emailfinance;
                            document.getElementById("atmcontact").innerHTML = data.contactatm;
                            document.getElementById("atmemail").innerHTML = data.emaiatm;
                            document.getElementById("address").innerHTML = data.address;
                            document.getElementById("web").innerHTML = data.web;

                        }
                    });


                    document.getElementById("panelbody").style.display = 'block';


                }
                function branchSelect() {

                    //document.getElementById("branch").disabled = false;
                    // $('#panelbody').load('branchdetails.jsp');

                    var bankname = document.getElementById("bank").value

                    var res = document.getElementById("branch").value;
                    //alert(res.toString());
                    jQuery.ajax({
                        type: 'POST',
                        url: "LoadBranchDetails?branch=" + res + "&bankname=" + bankname,
                        dataType: 'json',
                        async: false,
                        success: function(data) {

                            //alert(data);
                            //alert(JSON.stringify(data));
                            //alert(data.regno);
                            //document.getElementById("my").innerHTML = "okkkkkkkkkkkkkkkkkkkkkkkk";
                            document.getElementById("branch").innerHTML = data.name;
                            document.getElementById("branchid").innerHTML = data.regno;
                            document.getElementById("branchfincontact").innerHTML = data.contactfinance;
                            document.getElementById("branchfinemail").innerHTML = data.emailfinance;
                            document.getElementById("branchmancontact").innerHTML = data.contactmanager;
                            document.getElementById("branchmanemail").innerHTML = data.emailmanager;
                            document.getElementById("branchaddress").innerHTML = data.address;


                        }
                    });

                    document.getElementById("panelbody").style.display = 'none';
                    document.getElementById("branchdetail").style.display = 'block';

                }

                function showBranchData(value) {
                    var bankname = document.getElementById("bank").value

                    $.ajax({
                        url: "OtherBanksController?branch=" + value + "&bankname=" + bankname,
                        type: "POST",
                        async: false,
                        success: function(data) {
                            $("#autocompletebranch").fadeIn();
                            $("#autocompletebranch").html(data);
                        }

                    });

                    $(document).on('click', 'li', function() {
                        $("#branch").val($(this).text());
                        $("#autocompletebranch").fadeOut();
                    });

                }

                function showData(value) {
                    //alert("asssssssssssssssssssssssssssssssssssss");
                    $.ajax({
                        url: "OtherBanksController?bank=" + value,
                        type: "POST",
                        async: false,
                        success: function(data) {
                            $("#autocomplete").fadeIn();
                            $("#autocomplete").html(data);
                        }

                    });

                    $(document).on('click', 'li', function() {
                        $("#bank").val($(this).text());
                        $("#autocomplete").fadeOut();
                    });


                }

                function loadForm(val) {
                    //alert();
                    $("#form").toggle("slow");
                    document.getElementById('pagecontent').style.opacity = '0.4';
                    upDetail(val);

                }
                function  closeForm() {
                    $('#form').hide();
                    document.getElementById('pagecontent').style.opacity = '1';
                }
            </script>
            <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
            <script src="https://code.jquery.com/jquery.js"></script>
            <!-- Include all compiled plugins (below), or include individual files as needed -->
            <script src="bootstrap/js/bootstrap.min.js"></script>
            <script src="js/custom.js"></script>

    </body>
</html>