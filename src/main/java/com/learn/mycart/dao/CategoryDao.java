
package com.learn.mycart.dao;

import com.learn.mycart.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao 
{
  private SessionFactory factory;

    public CategoryDao(SessionFactory factory) 
    {
        this.factory = factory;
    }
    public int saveCategory(Category category)
    {
      Session openSession = this.factory.openSession();
      Transaction beginTransaction = openSession.beginTransaction();
      int categoryId =(int)openSession.save(category);
      beginTransaction.commit();
      openSession.close();
      return categoryId;
    }
    
    public List<Category> getCategory()
    {
      Session s = this.factory.openSession();
      Query query = s.createQuery("from Category");
      List<Category> list =query.list();
      return list;
    } 
  
    public Category getCategoryById(int cid)
    {
        Category cat=null;
        try 
        {
            Session session= this.factory.openSession();
            cat = session.get(Category.class, cid);
            session.close();
        } 
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return cat;
    }
    
    
    
}
