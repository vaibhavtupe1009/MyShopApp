<%@page import="com.AradhanaMilkAndBekary.Entities.User"%>
<%
    User user = (User) session.getAttribute("currentuser");
    if (user == null) {

        response.sendRedirect("LogIn.jsp");
    } else {
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
     
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md bg-primary">
                    <nav class="navbar navbar-expand-lg navbar-light bg-primary">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <h1 class="text-white">
                                    <i class="bi bi-shop"></i>&nbsp <i>Aradhana Milk & Bekary</i>
                                </h1>
                            </li>
                        </ul>
                        <a href="#" class="text-white mr-3" data-toggle="modal" data-target="#myModal"><img class="img-fluid mr-2" style="border-radius: 50%; max-width: 40px" src="pics/<%= user.getProfile()%>" ><%= user.getName()%></a>
                        <a href="LogOutServlet" class="btn btn-danger"><i class="fas fa-power-off"></i> Log Out</a>
                    </nav>        
                </div>

            </div>
        </div>


        <div class="container-fluid mt-5">
            <div class="row">
                <div class="col-md-3">
                    <div class="list-group">
                        <button id="btnSale" type="button" class="list-group-item list-group-item-action">Sale</button>
                        <button id="btnUpdateProduct" type="button" class="list-group-item list-group-item-action">Update Product</button>
                        <button id="btnAddProduct" type="button" class="list-group-item list-group-item-action">Add Product</button>
                        <button id="btnRemoveProduct" type="button" class="list-group-item list-group-item-action">Add user</button>
                    </div>
                </div>


                <div class="col-md-7 offset-md-1" id="form-container">
                    <div id="saleContainer">
                        <%@include file="SaleForm.jsp" %>
                    </div>
                    <div id="addContainer">
                        <%@include file="AddProductForm.jsp" %>
                    </div>
                    <div id="updateContainer">
                        <%@include file="updateStock.jsp" %>
                    </div>

                </div>
            </div>
        </div>

        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header bg-primary">
                        <div class="container-fluid text-center">
                            <img class="img-fluid mr-2" style="border-radius: 50%; max-width: 200px" src="pics/<%= user.getProfile()%>" >
                        </div>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body text-center">

                        <table class="table">
                            <tbody>
                                <tr>
                                    <th>Name</th>
                                    <td><%=user.getName()%></td>
                                </tr>
                                <tr>
                                    <th>Email</th>
                                    <td><%= user.getEmail()%></td>
                                </tr>
                                <tr>
                                    <th>Gender</th>
                                    <td><%= user.getGender()%></td>
                                </tr>
                                <tr>
                                    <th>Mobile No.</th>
                                    <td><%= user.getMoNo()%></td>
                                </tr>
                                <tr>
                                    <th>City</th>
                                    <td><%= user.getAddress()%></td>
                                </tr>
                            </tbody>
                        </table>

                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer bg-primary ">
                        <button type="button" onclick="fn1()" class="btn btn-warning" data-toggle="modal" data-target="#myModal1">
                            Edit
                        </button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>

        <!-- edit Modal -->
        <div class="modal" id="myModal1">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header bg-primary text-white">
                        <div class="container-fluid text-center">
                            <h4 class="modal-title">Edit Profile</h4>
                        </div>
                    </div>
                    <form action="editProfileServlet" method="post" enctype="multipart/form-data">

                        <!-- Modal body -->
                        <div class="modal-body">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th>Name</th>
                                        <td><input type="text" name="cName" class="form-control" value="<%= user.getName()%>"></td>
                                    </tr>
                                    <tr>
                                        <th>Email</th>
                                        <td><%= user.getEmail()%></td>
                                    </tr>
                                    <tr>
                                        <th>Gender</th>
                                        <td><%= user.getGender()%></td>
                                    </tr>
                                    <tr>
                                        <th>Mobile No.</th>
                                        <td><input type="text" name="cMoNo" class="form-control" value="<%= user.getMoNo()%>"></td>
                                    </tr>
                                    <tr>
                                        <th>Password</th>
                                        <td><input type="password" name="cPass" class="form-control" value="<%= user.getPassword()%>"></td>
                                    </tr>
                                    <tr>
                                    <tr>
                                        <th>Profile Pic</th>
                                        <td><input type="file" name="profile" class="form-control"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer bg-primary" >
                            <button type="submit" class="btn btn-success" >Save</button>
                            <button type="button" onclick="fn2()" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </form>


                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $("#saleContainer").hide();
                $("#addContainer").hide();
                $("#updateContainer").hide();
                
            })
            $("#btnSale").click(function () {
                $("#saleContainer").show();
                $("#addContainer").hide();
                $("#updateContainer").hide();
                $(this).addClass("active");
                $("#btnAddProduct").removeClass("active");
                $("#btnUpdateProduct").removeClass("active");

            })
            $("#btnAddProduct").click(function () {
                $("#addContainer").show();
                $("#saleContainer").hide();
                $("#updateContainer").hide();
                $(this).addClass("active");
                $("#btnSalet").removeClass("active");
                $("#btnUpdateProduct").removeClass("active");


            })

            $("#btnUpdateProduct").click(function () {
                $("#updateContainer").show();
                $("#addContainer").hide();
                $("#saleContainer").hide();
                $(this).addClass("active");
                $("#btnAddProduct").removeClass("active");
                $("#btnSale").removeClass("active");

            })

            function fn1() {
                $("#myModal").hide()
            }
            function fn2() {
                $("#myModal1").hide();
                $("#myModal").show();

            }


        </script>

    </body>
</html>
<%
    }
%>
