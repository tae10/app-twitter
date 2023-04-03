<%@page import="repository.TweetLikes"%>
<%@page import="data.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
      User user =(User)session.getAttribute("logonUser");
       String name =user.getId();
       
       String code =request.getParameter("code");
       
       TweetLikes.create(name, code);
     
    
    
    
    %>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>