<%--
   join.jsp에서 제출된 내용을 토대로 DataBase에 신규유저 정보를 등혹하는 처리를 하는 곳
 --%>

<%@page import="repository.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
       request.setCharacterEncoding("utf-8");
                 
                   String id =request.getParameter("id");
                   String pass =request.getParameter("password");
                   String nick =request.getParameter("nick");
                   
                   int r =  Users.create(id,pass,nick);
                     if(r==1){
                  	   // 가입과 동시에 로그온상태변경
                          //response.sendRedirect("./login-task.jsp?userId="+id+"&password="+pass+");
                  	   session.setAttribute("logon", true);
                  	   session.setAttribute("logonUser", Users.findById(id));
                  	   response.sendRedirect("/home/index.jsp");
                  	  return;
                     }
       %>
   
<%@include file="/commons/top.jsp" %>

   
  <h1> <%if(r==-1) {%>></h1>
               <h1> 중복된 데이터로 등록에 실패했습니다</h1>  
     <% }else{%>
               <h1>환영합니다</h1>
     <%} %>  
     
 <%@include file="/commons/bottom.jsp" %>
