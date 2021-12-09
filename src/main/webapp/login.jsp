

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                  
                    <div class="card mt-3">
                        
                        <div class="card-header primary-background text-white">
                            <h3>Login Here !!</h3>
                            
                        </div>  
                        <%@include file="components/message.jsp"%>
                        <div class="card-body">
                            
                                <form action="LoginServlet" method="post">
                                <div class="form-group">
                                <label for="email">Email address</label>
                                <input name="email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                <label for="password">Password</label>
                                <input name="password" type="password" class="form-control" id="password" placeholder="Password">
                                </div>
                                <a href="register.jsp" class="text-center d-block mb-2">if not registered click here</a>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Submit</button>
                                    <button class="btn btn-outline-warning">Reset</button>
                                </div>                              
                                      
                            </form>
                            </div>       
                        
                    </div>
                    
                </div>
            </div>       
        </div>                                                                                                               
        
    </body>
</html>
