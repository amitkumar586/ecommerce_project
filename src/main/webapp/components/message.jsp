<%
    String msg =(String)session.getAttribute("message");
    if(msg != null)
    {
        //print msg
   %>
   
   <div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong><%=msg %></strong> 
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
   
   <%
        
        //remove msg after show 
        session.removeAttribute("message");
    }
        
%>