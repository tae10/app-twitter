<%@page import="data.Follow"%>
<%@page import="repository.Follows"%>
<%@page import="data.User"%>
<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    UUID uuid = UUID.randomUUID();
	System.out.println(uuid.toString());	// \\w{8}-\\w{4}-\\w{4}-\\w{4}-\\w{12}
	String code = uuid.toString().split("-")[0];
	
	
    String target=request.getParameter("target");
    
    User user =(User)session.getAttribute("logonUser");
    String owner =user.getId();
         
         int r = Follows.create(code, owner, target);
    
    %>
    
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%if(r==1){ %>
        정상적으로 팔로우 처리가 되었습니다
   
   <%}else{%>
        실패하였습니다
        
   <%} %>   
   
   
   
   
</body>
</html>