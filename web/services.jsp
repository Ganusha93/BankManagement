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

    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1 
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 

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
        <div id="updateform" style="display:none ; width: 200%;"><jsp:include page="updateservice.jsp" /></div> 
        <div id="addserviceform" style="display:none ; width: 200%;"><jsp:include page="addservice.jsp" /></div> 


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
                            <li class="current"><a href="LoadServices"><i class="glyphicon glyphicon-home"></i> Services</a></li>
                            <li><a href="LoadDetails"><i class="glyphicon glyphicon-calendar"></i>Bank details</a></li>
                            <li><a href="otherbanks.jsp"><i class="glyphicon glyphicon-stats"></i> Other Banks</a></li>
                            <li class="current"><a href="#"><i></i> </a></li>
                            <li class="current"><a href="#"><i></i> </a></li>

                        </ul>
                    </div>

                    <div class="col-lg-12 pull-right ">

                        <button  class="btn btn-primary btn-lg col-lg-12  " id="addnewservice" onclick="loadDetailForm();"  style="margin-bottom: 4%;">Add New Service</button>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="row">
                        <table class="table-bordered table table-bordered table-hover" id="myTable">
                            <tr class="active">
                                <th>Service ID</th>
                                <th>Service Name</th>
                                <th>Description</th>
                                <th>Contact No</th>
                                <th>Email</th>


                            </tr>
                            <%Iterator itr;%>
                            <%List data = (List) request.getAttribute("services");
                                for (itr = data.iterator(); itr.hasNext();) {
                            %>
                            <tr>
                                <% String s = (String) itr.next();%>
                                <td><%=s%></td>
                                <td><%= itr.next()%></td>
                                <td><%= itr.next()%></td>
                                <td><%= itr.next()%></td>
                                <td><%= itr.next()%></td>

                                <td><input type="button" class="btn btn-primary " value="Edit" onclick="updateService($(this).closest('tr').index());"></input></td>
                                <td><input type="button" class="btn btn-danger" value="Delete" onclick="deleteService($(this).closest('tr').index())"></input></td>

                                <%}%>
                            </tr>
                        </table>
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
            function updateService(row) {
                var oTable = document.getElementById('myTable');

                var rowLength = oTable.rows.length;
                var oCells = oTable.rows.item(row).cells;

                // var cellLength = oCells.length;


                document.getElementById('serviceid').value = oCells.item(0).innerHTML;
                document.getElementById('servicename').value = oCells.item(1).innerHTML;
                document.getElementById('description').value = oCells.item(2).innerHTML;
                document.getElementById('contactno').value = oCells.item(3).innerHTML;
                document.getElementById('email').value = oCells.item(4).innerHTML;
                //alert("gfxhj");

                document.getElementById('pagecontent').style.opacity = '0.4';
                $('#updateform').toggle("slow");
            }


            function loadDetailForm() {
                $('#addserviceform').toggle("slow");
                document.getElementById('pagecontent').style.opacity = '0.4';

            }
            function  closeForm() {
                $('#addserviceform').hide();
                $('#updateform').hide();
                document.getElementById('pagecontent').style.opacity = '1';
            }

            function deleteService(id) {
                var oTable = document.getElementById('myTable');

                var rowLength = oTable.rows.length;
                var oCells = oTable.rows.item(id).cells;
                var value = oCells.item(0).innerHTML;
                //alert(value);
                url = "DeleteService";
                window.location.href = "http://localhost:8080/BankManagement/" + url + "?id=" + value;
                document.getElementById('serviceid').value = oCells.item(0).innerHTML;
            }


        </script>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://code.jquery.com/jquery.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>