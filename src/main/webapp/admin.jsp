
<%@page import="java.util.Map"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>

<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You ara not loged in ! Login first !");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You ara not admin ! do not access this page !");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>


                            <%  
                                
                                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list = cdao.getCategory();
                                
                                //getting count
                                
                                Map<String,Long>map= Helper.getCounts(FactoryProvider.getFactory());
                                

                            %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include  file ="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>

        <div class="container admin">

            <div class="container-fluid">

                <%@include file="components/message.jsp"%>


            </div>

            <!-- first row -->
            <div class="row mt-3">

                <!--first column-->
                <div class="col-md-4">

                    <!--first box-->
                    <div class="card">

                        <div class="card-body text-center">

                            <div class="container ">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src ="img/team.png" alt="user_icon">    

                            </div>

                            <h3><%=map.get("userCount")%></h3>
                            <h3 class="text-uppercase text-muted">Users</h3>

                        </div>
                    </div>

                </div>
                <!--second column--> 
                <div class="col-md-4">

                    <!--second box-->
                    <div class="card">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src ="img/team.png" alt="user_icon">    
                            </div>

                            <h3><%=list.size()%></h3>
                            <h3 class="text-uppercase text-muted">Categories</h3>

                        </div>
                    </div>

                </div>
                <!--third column--> 
                <div class="col-md-4">
                    <!--third box-->
                    <div class="card">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src ="img/team.png" alt="user_icon">    
                            </div>

                            <h3><%=map.get("productCount") %></h3>
                            <h3 class="text-uppercase text-muted">Products</h3>

                        </div>
                    </div>

                </div>
            </div>

            <!-- second row -->
            <div class="row mt-2">

                <!--col 1-->
                <div class="col-md-6">

                    <!--box-1-->
                    <div class="card" data-toggle="modal" data-target="#add-category-model">

                        <div class=" card-body text-center">

                            <div class="container">

                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon">

                            </div>

                            <p class="mt-2">Click here to add new categories</p>
                            <h3 class="text-uppercase text-muted">Add Category</h3>

                        </div>

                    </div>

                </div>

                <!--col 2-->
                <div class="col-md-6">

                    <!--box-1-->
                    <div class="card" data-toggle="modal" data-target="#add-product-model">

                        <div class="card-body text-center">

                            <div class="container">

                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon">

                            </div>

                            <p class="mt-2">Click here to add new product</p>
                            <h3 class="text-uppercase text-muted">Add Product</h3>

                        </div>

                    </div>  

                </div>

            </div>

        </div>

        <!--Start category model-->

        <!-- Modal -->
        <div class="modal fade" id="add-category-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addcategory">

                            <div class="form-group">
                                <input name="categorytitle" type="text" id="categorytitle" class="form-control" placeholder="Category Title" required/>
                            </div>

                            <div class="form-group">
                                <textarea name="categorydescription" id="categorydescription" style="height:150px" class="form-control" placeholder="Category Descripton" required></textarea>
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div> 
        <!--End category model-->



        <!--*******************************************************************************************************************************************************************-->   

        <!--Start Product model-->

        <div class="modal fade" id="add-product-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <!--start form-->
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            
                            <input type="hidden" name="operation" value="addproduct" >
                            
                            <div class="form-group">
                                <input name="pName" type="text" class="form-control" id="pName" placeholder="Enter title of product" required />                                
                            </div>  

                            <div class="form-group">
                                <textarea style="height:150px" name="pDesc" type="text" id="pDesc" class="form-control" placeholder="Enter description of product"></textarea>                                
                            </div>

                            <div class="form-group">
                                <input name="pPrice" type="number" class="form-control" id="pPrice" placeholder="Enter price of product" required />                                
                            </div>

                            <div class="form-group">
                                <input name="pDiscount" type="number" class="form-control" id="pDiscount" placeholder="Enter discount of product" required />                                
                            </div>

                            <div class="form-group">
                                <input name="pQuantity" type="number" class="form-control" id="pQuantity" placeholder="Enter title of product" required />                                
                            </div>


                            
                            <!--product categories-->
                            <div class="form-group">
                                <select name="catId" class="form-control" id="" >

                                    <%
                                        for (Category c : list) {
                                    %>
                                    
                                    <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>

                                    <%  } %>

                                </select>            
                            </div>

                            <!--product file-->
                            <div class="form-group">
                                <input type="file" name="pPic"required/>
                            </div> 

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                            </div>

                        </form> 

                        <!--end form-->
                    </div>             
                    </div>
                </div>
            </div>

            <!--End product model--> 
            <%@include file="components/common_model.jsp"%> 
    </body>
</html>
