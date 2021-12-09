<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not loged in ! Login first to access checkout page !");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include  file ="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>

        <div class="continer">
            <div class="row">
                <!--cart details-->
                <div class="col-md-6 mt-3">

                    <div class="card">

                        <h3 class="text-center ">YOur Selected Items</h3>

                        <div class="card-body">
                            <div class="cart-body mt-5 continer-fluid"></div>

                        </div>
                    </div>                    

                </div>


                <!-- form -->
                <div class="col-md-6 mt-3">

                    <div class="card">
                        <h3 class="text-center ">YOur Details for order</h3>
                        <div class="card-body ">

                            <form action="RegisterServlet" method="post">
                                <div class="form-group">
                                    <label for="email">Your Email</label>
                                    <input value=" <%=user.getUserEmail() %>" name="your_email" type="email" class="form-control" id="email" placeholder="Enter Email"> 
                                </div>
                                <div class="form-group">
                                    <label for="name">Your Name</label>
                                    <input value=" <%=user.getUserName() %>" name="your_name" type="name" class="form-control" id="name" placeholder="Enter Name"> 
                                </div>

                                <div class="form-group">
                                    <label for="phone">User Phone</label>
                                    <input value=" <%=user.getUserPhone() %>"  name="your_phone" type="phone" class="form-control" id="phone" placeholder="Enter phone"> 
                                </div>
                                <div class="form-group">
                                    <label for="address">Your Address</label>
                                    <textarea name="your_address" value=" <%=user.getUserAddress()%>" style="height:100px" class="form-control" placeholder="Enter Address"></textarea> 
                                </div>

                                <div class="container text-center">
                                    <button class="btn btn-outline-success text-center">Order Now</button>
                                    <button class="btn btn-outline-warning text-center">Reset</button>
                                    <button class="btn btn-outline-primary text-center">Continue Shopping</button>
                                </div>

                            </form>

                        </div>
                    </div>                    

                </div>

            </div>
        </div>
        <%@include file="components/common_model.jsp" %>
    </body>
</html>
