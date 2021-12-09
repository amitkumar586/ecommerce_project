
package com.learn.mycart.servlets;

import com.learn.mycart.dao.UserDao;
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


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
        
            try 
            {
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                
                //validation 
                
                //To authontication user create userdao object
                UserDao userDao =new UserDao(FactoryProvider.getFactory());
                User user = userDao.getByUser(email, password);
                // System.out.println(user);
               
               HttpSession httpSession= request.getSession();
               
               if(user==null)
               {
                  //out.println("<h1>Invalid details</h1>");
                  httpSession.setAttribute("message","Invalid details try with another one!!");
                  response.sendRedirect("login.jsp");
                   return;
               }
               else
               {
                   //login
                   httpSession.setAttribute("current-user",user);
                   
                   if(user.getUserType().equals("admin"))
                   {
                        //if user is admin then page redirect in on admin.jsp page
                       response.sendRedirect("admin.jsp");
                   }
                   else if(user.getUserType().equals("normal"))
                   {
                       //if user is normal then page redirect in on normal.jsp page
                        response.sendRedirect("normal.jsp");
                   }
                   else
                   {
                       out.println("we have not identified use type");
                   }
                   return;
                      
               }
            } catch (Exception e) {
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
    public String getServletInfo()
    {
        return "Short description";
    }// </editor-fold>

}
