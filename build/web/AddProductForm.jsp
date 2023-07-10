<%@page import="com.AradhanaMilkAndBekary.Entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.AradhanaMilkAndBekary.Helper.connectionProvider"%>
<%@page import="com.AradhanaMilkAndBekary.Dao.ProductDao"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">


<div id="adddProductForm">
    <div class="row text-center">
        <div class="col">
            <h2>Add Product</h2>
            <div class="alert" role="alert" id="msgId">
            </div>
        </div>
    </div>
    <form action="" id="addProductForm">
        <div class="form-group">
            <b>Product Name</b>
            <input class="form-control" type="text" name="pName" placeholder="Enter Product Name Here" required>                                
        </div>
        <div class="form-group row">
            <div class="col-md-4">
                <b>Product Buy Price</b>
                <input class="form-control" type="number" step="any" name="pbPrice" placeholder="Buy Price" required>                                
            </div>
            <div class="col-md-4">
                <b>Product Sale Price</b>
                <input class="form-control" type="number" step="any" name="psPrice" placeholder="Sale Price Per Unit" required>                                
            </div>
            <div class="col-md-4">
                <b> Product Quantity</b>
                <input class="form-control" type="number" name="pQuantity" placeholder="Quantity To Add" required>                                
            </div>
        </div>
        <div class="form-group">
            <b>Product Discription</b>
            <textarea class="form-control" type="" name="pDis" placeholder="Enter Product Discription"></textarea>                               
        </div>
        <div class="form-group text-right">
            <button type="submit" class="btn btn-success" id="saveProduct">Save</button>
            <button type="reset" class="btn btn-success">Cancel</button>
        </div>
    </form>
</div>
<script>
    $(document).ready(function () {
        $("#msgId").hide();
    })
    $("#addProductForm").on("submit", function (event) {
        event.preventDefault();
        var f = $(this).serialize();
        $.ajax({
            url: "AddProductServlet",
            data: f,
            type: 'POST',
            success: function (data, textStatus, jqXHR) {
                if (data == "Done") {
                    $("#msgId").html("Product Added Successfully.");
                    $("#msgId").addClass("alert-success");
                    $("#msgId").show();
                    $("#addProductForm").trigger("reset");

                }
            }
        })
    })
</script>
