<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //사용중인 세션을 애초에 죽이는--일반적인 방법
    session.invalidate();
    
    //2다른 방법은 사용중이던 값들을 변경
    //session.setAttribute("logon", false);
   // session.setAttribute("logonUser", null);
    //session.removeAttribute("logonUser");
    
    response.sendRedirect("/flow/login.jsp");
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