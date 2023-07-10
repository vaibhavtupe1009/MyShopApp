
<%@page import="com.AradhanaMilkAndBekary.Entities.Massage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
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
                        <a class="btn btn-warning" href="LogIn.jsp">Login</a>&nbsp 
                    </nav>        
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-4 mb-4">
                        <form action="RegisterUserServlet" method="post" enctype="multipart/form-data">

                            <div class="card-header text-center bg-primary">
                                <i class="fas fa-user-plus fa-4x text-white"></i>
                                <h3 class="text-white">Register user</h3>
                                
                            <%
                                Massage m = (Massage) session.getAttribute("Msg");
                                if (m != null) {
                            %>
                            <div class="alert <%=m.getCssClass()%>" role="alert">
                                <%= m.getContent()%>
                            </div>
                            <%
                                    session.removeAttribute("Msg");
                                }
                            %>
                            </div>
                            <div class="card-body bg-light">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="uname" placeholder="Enter Username" name="cname" required>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" id="uemail" placeholder="Enter Email" name="cemail" required>
                                </div>
                                <div class="form-group">
                                    <input type="tel" pattern="[0-9]{10}" class="form-control" id="uMoNo" placeholder="Enter Mobile No." name="cMo" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="pwd" placeholder="Enter Password" name="cpass" required>
                                </div>
                                <div class="form-check-inline">
                                    <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="gRadio" value="Male">Male
                                    </label>
                                </div>
                                <div class="form-check-inline">
                                    <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="gRadio" value="Female">Female
                                    </label>
                                </div> 
                                <div class="form-group">
                                    <input type="text" class="form-control mt-2" id="city" placeholder="Enter City" name="city" required>
                                </div>

                                <div class="form-group">
                                    <label>Profile Pic</label>
                                    <input type=file class="form-control" id="pro" name="profile" >
                                </div>

                            </div>
                            <div class="card-footer text-center bg-primary">
                                <button type="submit" class="btn btn-success">Submit</button>
                                <a href="index.jsp" class="btn btn-danger">Cancel</a>
                            </div>
                        </form>
                    </div>

                </div>

            </div>
        </div>
    </body>
</html>
