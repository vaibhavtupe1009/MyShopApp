<%@page import="java.util.List"%>
<%@page import="com.AradhanaMilkAndBekary.Entities.Product"%>
<%@page import="com.AradhanaMilkAndBekary.Helper.connectionProvider"%>
<%@page import="com.AradhanaMilkAndBekary.Dao.ProductDao"%>

<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js" integrity="sha512-2ImtlRlf2VVmiGZsjm9bEyhjGW4dU7B6TNwh/hx/iSByxNENtj3WVE6o/9Lj4TJeVXPi4bnOIMXFIJJAeufa0A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" integrity="sha512-nMNlpuaDPrqlEls3IX/Q56H36qvBASwb3ipuo3MxeWbsQB1881ox0cRv7UPTgBlriqoynt35KjEwgGUeUXIPnw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">


<div id="saleForm">
    <form id="saleFormId">
        <div class="form-group row">
            <div class="col-md-5">
                <b>Product</b>
                <select class="form-control" id="selectProduct" name="productId">
                    <option disabled selected id="disabled">---Select Product---</option>
                    <%
                        ProductDao dao = new ProductDao(connectionProvider.getConnection());
                        List<Product> products = dao.getAllProduct();
                        for (Product p : products) {
                            if (p.getQuantity() == 0) {
                    %>
                    <option disabled style="color: red" id="<%=p.getId()%>" value="<%=p.getSalePrice()%>"><%=p.getName()%> &nbsp;<b><%= p.getSalePrice()%>&nbsp;&nbsp;&nbsp;&nbsp;Out Of Stock</option>
                        <%

                        } else {
                        %>
                    <option rate="<%=p.getSalePrice()%>" quantity="<%=p.getQuantity()%>" id="<%=p.getId()%>" value="<%=p.getId()%>"><%=p.getName()%> &nbsp;<%= p.getSalePrice()%></option>
                        <%
                                }
                            }
                        %>
                </select>
            </div>
            <div class="col-md-3">
                <b>Rate</b>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <b>Avl Qnt</b>
                <div class="input-group">
                    <input name="product" type="number " class="form-control" placeholder="" id="salePriceId" readonly>
                    <input name="AvlQuantity" type="number " class="form-control" placeholder="" id="quantityId" readonly>
                </div>
            </div>
            <div class="col-md-2">
                <b>Quantity</b>
                <div class="input-group">
                    <button type="button" class="btn btn-success btn-sm" id="btnMinQuantity"><i class="fas fa-minus"></i></button>
                    <input type="number " class="form-control" id="productQuantity" name="ReQuantity">
                    <button type="button" class="btn btn-success btn-sm" id="btnAddQuantity"><i class="fas fa-plus"></i></button>
                </div>
            </div>
            <input type="hidden" id="productId">
            <div class="col-md-2">
                <button type="submit" class="btn btn-success mt-4">Add</button>
            </div>
        </div>
    </form>
</div>

<script>
    var oq;
    $(".select2").select2();
    $(document).ready(function () {

        $("#selectProduct").change(function () {
            var v = $(this).children("option:selected").val();
            var quantity = $(this).children("option:selected").attr("quantity");
            var rate = $(this).children("option:selected").attr("rate");
            $("#salePriceId").val(rate);
            $("#quantityId").val(quantity);
            $("#productQuantity").val(1);
        });
        $("#btnAddQuantity").click(function () {
            var pId = $("#selectProduct").children("option:selected").attr("id");
            if (pId === "disabled")
            {
                swal("Select Product First");
            } else
            {
                oq = $("#selectProduct").children("option:selected").attr("quantity");
                var q = parseInt($("#productQuantity").val());
                if (isNaN(q))
                {
                    $("#productQuantity").val(1);
                } else
                {
                    if (q < oq)
                    {
                        var nq = q + 1;
                        $("#productQuantity").val(nq);
                    } else
                    {
                        swal("No More Stock Available of Thid Product ! ");
                    }
                }
            }
        });
        $("#btnMinQuantity").click(function () {
            var pId = $("#selectProduct").children("option:selected").attr("id");
            if (pId === "disabled")
            {
                swal("Select Product First");
            } else
            {
                var q = parseInt($("#productQuantity").val());
                if (isNaN(q))
                {
                    $("#productQuantity").val(1);
                } else
                {
                    var q = parseInt($("#productQuantity").val());
                    if (q > 1) {
                        var nq = q - 1;
                        $("#productQuantity").val(nq);
                    }
                }
            }

        });
        $("#productQuantity").change(function () {
            var pId = $("#selectProduct").children("option:selected").attr("id");
            if (pId !== "disabled")
            {
                var uq = $("#productQuantity").val();
                if (parseInt(uq) === 0)
                {
                    swal("Product Quantity Must More Than Zero");
                    $("#productQuantity").val(1);
                }
                if (isNaN(uq)) {
                    swal("Please Enter Quantity In Number Only !");
                    $("#productQuantity").val(1);
                } else {
                    if ((uq - Math.floor(uq)) !== 0) {
                        swal("Please Do Not Enter Decimal Point Number As Quantity");
                        $("#productQuantity").val(1);
                    } else {
                        var uq = parseInt(uq);
                        oq = parseInt($("#selectProduct").children("option:selected").attr("quantity"));
                        if (oq < uq) {
                            swal("Sorry ! Only " + oq + " Quantity Is Available Of This Product !");
                            $("#productQuantity").val(oq);
                        }

                    }
                }

            }
        });
        $("#saleFormId").on("submit", function (event) {
            event.preventDefault();
            let f = $("#saleFormId").serialize();
            swal(f);
        });
        
    });
</script>

