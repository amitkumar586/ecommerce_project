<%@page import="com.learn.mycart.entities.User"%>
<%
    //firstly check if any user already login or not
    User user =(User)session.getAttribute("current-user");
    
    //now check user nul or not
    if(user==null)
    {
        session.setAttribute("message", "you are not logedin !! login first");
        response.sendRedirect("login.jsp");
        // blocked user
        return;
    }
    else
    {
        //here we check user normal or admin
        if(user.getUserType().equals("admin"))
        {
            session.setAttribute("message", "you are not valid user !! Do not access this page");
            response.sendRedirect("login.jsp");
            //if user is normal 
            return;
        }   
    }
    %>
    

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User-panel</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <h1>Normal user panel!</h1>
    </body>
</html>
