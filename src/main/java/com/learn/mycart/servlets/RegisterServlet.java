
package com.learn.mycart.servlets;

import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;


@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
           
            try 
            {
                String userName = request.getParameter("user_name");
                String userEmail = request.getParameter("user_email");
                String userPassword = request.getParameter("user_password");
                String userPhone = request.getParameter("user_phone");
                String userAddress = request.getParameter("user_address");
            
                // validation
                
                //creating user object to store data
                User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress,"normal");
               
                Session hibernateSession = FactoryProvider.getFactory().openSession();
               
                 Transaction tx = hibernateSession.beginTransaction();
                 
                 int userId =(int)hibernateSession.save(user);
                 
                 tx.commit();
                
                 hibernateSession.close();
                 
//                 out.println("successfully saved");
//                 out.println("<br>userId is</br>"+ userId);

                   HttpSession httpSession =  request.getSession(); 
                   httpSession.setAttribute("message","Registration Successful user id is "+userId);
                   response.sendRedirect("register.jsp"); //send msg at any page
                   return;
            } 
            catch (Exception e) 
            {
                e.printStackTrace();
            }
    
            
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
