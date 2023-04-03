<%@page import="data.User"%>
<%@page import="java.util.List"%>
<%@page import="repository.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    

       String search =request.getParameter("q");
           List<User> li=Users.findByKeyword(search);
    %>
    
    <%@ include file="/commons/top.jsp"%>
    
        <%if(li.isEmpty()){ %>
              일치하는 데이터가 없습니다
        <%}else{%>
    <%for(User one : li){%>
    <div style="text-align:center">
    <h1>검색목록</h1>
     <div>
      
     <a href ="./follows/add-task.jsp?target=<%=one.getId()%>"><%=one.getId() %><button type="submit">팔로우하기</button></a> 
      
    </div>
    <div>
			  <span style="color : green"><%=one.getFollowerCnt() %>: follow</span>
    </div>
    </div>
    <%} %>
    <%} %>
    
    
  <%@include file="/commons/bottom.jsp" %>