<%@page import="data.User"%>
<%@page import="data.Follow"%>
<%@page import="java.util.List"%>
<%@page import="repository.Follows"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%  
        
      String id = request.getParameter("id");
      List<Follow> li = Follows.findByOwner(id);
     
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%if(li.size()==0){ %>
     팔로우가 없습니다 <br>
<%}else{ %>
<div style="text-align:cente">
 팔로우하고 있는 사람들 ==>
 <ul>
<%for(Follow f : li){%>

  <li> <%=f.getTarget() %> </li>
</ul>

<%} %>
<%} %>
</div>



</body>
</html>