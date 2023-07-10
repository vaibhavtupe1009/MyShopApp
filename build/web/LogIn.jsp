

<%@page import="com.AradhanaMilkAndBekary.Entities.Massage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In</title>
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
                    </nav>        
                </div>
            </div>
        </div>

        <div class="container mt-5">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <form action="logInServlet" method="post">
                        <table class="table">
                            <thead class="">
                            <div class="text-center text-primary"><i class="fas fa-user-circle fa-5x"></i></div>
                            <h1 class="display-5 text-center text-primary"> Login Here</h1>

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

                            </thead>
                            <tbody>                   
                            <div class="form-group">
                                <div class="input-group">
                                    <i class="fas fa-user-circle fa-2x text-primary mx-3"></i>
                                    <input type="email" class="form-control" placeholder="Enter Email" name="uEmail" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <i class="fas fa-key fa-2x text-primary mx-3"></i>
                                    <input type="password" class="form-control" placeholder="Enter Password Here" name="uPass" required>
                                </div>
                            </div>
                            </tbody>
                            <tfoot>
                            <div class="row">
                                <div class="col-md-6 form-group text-left">
                                    <a href="UserRegister.jsp" class="text-primary mx-3 "><i class="fas fa-user-plus"></i>  Register New</a>
                                </div>
                                <div class="col-md-6 form-group text-right">
                                    <button class="btn btn-primary " type="submit"><i class="fas fa-lock-open"></i> LogIn</button>
                                    <button class="btn btn-primary" type="reset">Reset</button>
                                </div>
                            </div>
                            </tfoot>
                        </table>
                    </form>

                </div>

            </div>
        </div>
    </body>
</body>
</html>
