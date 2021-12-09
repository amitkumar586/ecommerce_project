
package com.learn.mycart.helper;
import java.sql.*;
public class ConnectonProvider
{
private static Connection con ;  
public static Connection getConnection()
{
    try 
    {
        if(con==null)
        {
            //load driver class
            Class.forName("com.mysql.jdbc.Driver");
            
            //create connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mycart", "root","123456"); 
        }
    } catch (Exception e)
    {
        e.printStackTrace();
    }
    return con;
} 
}
