
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.helper.ConnectonProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart - Home</title>
        <%@include  file ="components/common_css_js.jsp"%>
        
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <div class="container-fluid">

        <div class="row mt3 mx-2">

            <%      
                String cat = request.getParameter("category");

                //object of productdao    
                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                
                List<Product> list = null;
                
                if(cat ==null)
                {
                
                    list = dao.getAllProducts(); 
                
                }
                else if(cat.trim().equals("all"))
                {
                    list = dao.getAllProducts();
                }
                else
                {
                  int cid = Integer.parseInt(cat.trim());  
                  list = dao.getAllProductsById(cid);
                }

                //object of categorydao
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> list1 = cdao.getCategory();

            %>

            <!--show categories-->
            <div class="col-md-2">

                <div class="list-group mt-2">

                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active mt-2">All Products</a>

                    <%                        
                        for (Category c : list1)
                        {
                    
                    %>

                    <a href="index.jsp?category=<%=c.getCategoryId() %>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>  

                    <% } %>
                </div>

            </div>
            <!--show products-->
            <div class="col-md-10">

                <!--row-->
                <div class="row mt-2">
                    <!--col-->
                    <div class="col-md-12">

                        <div class="card-columns text-center">

                            <!--traversing products-->
                            <%
                                for (Product p : list) {

                            %>
                            <!--product card-->
                            <div class="card"> 
                                    
                                <div class="container">
                                    <img src="img/products/<%=p.getpPhoto()%>" style="max-height:150px ; max-width:100% ;width:auto" class="card-img-top m-2"  alt="...">
                                        
                                </div>

                                <div class="card-body">

                                    <h5 class="card-title"><%=p.getpName()%></h5>

                                    <p class="card-text"> 
                                        <%=Helper.get10Words(p.getpDesc())%>
                                    </p>

                                </div>

                                <div class="card-footer text-center">

                                    <button class="btn primary-background text-white" onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.getPriceAfterDiscount()%>)"> Add To Cart</button>
                                    <button class="btn btn-outline-success"> &#8377 <%=p.getPriceAfterDiscount()%>  <span class="text-secondary discount-label"> <%=p.getpPrice() %> , <%=p.getpDiscount() %>% off</span></button>

                                </div>

                            </div>

                            <%}
                            
                            if(list.size()==0)
                            {
                              out.println("No items in this category");
                            }
                            
                            %>   

                        </div>

                    </div>
                </div> 

            </div>
        </div>
        </div>
                            
       <%@include file="components/common_model.jsp" %>                      
                            
    </body>
</html>
