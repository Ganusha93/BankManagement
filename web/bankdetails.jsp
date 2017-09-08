<%@page import="java.util.Iterator;" %>
<%@page import="java.util.List;" %>
<%@page import="javax.servlet.http.HttpSession;" %>
<%@page import="java.io.PrintWriter;"%>

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

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        
        <div id="bankdetailform" style="display:none ; width: 200%;"><jsp:include page="updatedetails.jsp" /></div> 
        <div class="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <!-- Logo -->
                        <div class="logo">
                            <h1><a href="index.jsp">Bank Administrative System</a></h1>
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
                            <li class="current"><a href="LoadDetails"><i class="glyphicon glyphicon-calendar"></i>Bank details</a></li>
                            <li><a href="otherbanks.jsp"><i class="glyphicon glyphicon-stats"></i> Other Banks</a></li>
                            <li class="current"><a href="#"><i></i> </a></li>
                            <li class="current"><a href="#"><i></i> </a></li>

                        </ul>
                    </div>


                </div>

                <%List data = (List) request.getAttribute("bankdetails");
                    String regno = (String) data.get(0);
                    String fincontact = (String) data.get(2);
                    String finemail = (String) data.get(3);
                    String atmcontact = (String) data.get(4);
                    String atmemail = (String) data.get(5);
                    String address = (String) data.get(6);
                    String website = (String) data.get(7);
                %>
                <div class="col-md-8">
                    <div class=" row col-lg-12 "><h1 class="bold">Sampath Bank</h1> </div>
                    <table class="table table-user-information table-striped">
                        <tr >
                            <td><lable>Reg No:</lable></td>
                        <td id="regno"><%=regno%></td>    

                        </tr>

                        <tr >
                            <td><lable>Contact No(Finance):</lable></td>
                        <td id="fincontact"><%=fincontact%></td>    

                        </tr>
                        <tr >
                            <td><lable>Email(finace)</lable></td>
                        <td id="finemail"><%=finemail%></td>    

                        </tr>
                        <tr >
                            <td><lable>Contact No(ATM):</lable></td>
                        <td id="atmcontact"><%=atmcontact%></td> <br><br>
                        </tr>
                        <tr >
                            <td><lable>Email(ATM)</lable></td>
                        <td id="atmemail"><%=atmemail%></td>    

                        </tr>

                        <tr >
                            <td><lable>Head-Office Address:</lable></td>
                        <td id="address"><%=address%></td>    

                        </tr>
                        <tr >
                            <td><lable>Web site:</lable></td>
                        <td id="web"><%=website%></td>    

                        </tr>





                    </table>
                    <div class="col-lg-2 pull-right ">
                        <button  class="btn btn-primary btn-mini col-lg-12  " id="addnewservice" onclick="loadDetailForm()"  style="margin-bottom: 4%;">Edit Details</button>
                    </div>
                </div>
            </div>
        </div>


    </div>


    <footer style="position:fixed; width: 100%;">
        <div class="container">

            <div class="copy text-center">
                Copyright 2017 <a href='#'>Bank Management System @epic</a>
            </div>

        </div>
    </footer >
    <script>


        function loadDetailForm() {
            $('#bankdetailform').toggle("slow");
            document.getElementById('pagecontent').style.opacity = '0.4';
            document.getElementById("fbranch").value=document.getElementById("regno").innerHTML;
            document.getElementById("fbranchid").value=document.getElementById("fincontact").innerHTML;
            document.getElementById("fbranchfincontact").value=document.getElementById("finemail").innerHTML;
            document.getElementById("fbranchfinemail").value=document.getElementById("atmcontact").innerHTML;
            document.getElementById("fbranchmancontact").value=document.getElementById("atmemail").innerHTML;
            document.getElementById("fbranchmanemail").value=document.getElementById("address").innerHTML;
            document.getElementById("fbranchaddress").value=document.getElementById("web").innerHTML;




        }
        function  closeForm() {
            $('#bankdetailform').hide();
            $('#updateform').hide();
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