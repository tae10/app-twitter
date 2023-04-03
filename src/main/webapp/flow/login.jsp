<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/commons/top.jsp" %>
     <%@include file="/commons/cancel.jsp" %>
    <%
     String error = request.getParameter("error");
      
   
    %>
    <div style="text-align:center">
    <h1>로그인 하기</h1>
    <form action ="./login-task.jsp" method="post">
    <input type="hidden" name="uri" value="/home/index.jsp">
    
    <p>
    아이디    <input type="text" name="id"/>
    </p>
    <p>
    비밀번호  <input type="password" name="pass"/>
    </p>
    <button type="submit">다음</button>
     <%if(error!=null) {%>
            <%if(error.equals("1")) {%>
                        아이디가 없습니다
            <%}else{ %>
                 비밀번호가 일치하지않습니다
                 
            <%} %>
     
     <%} %>
    <p>
       계정이 없으신가요?<a href="./join.jsp">가입하기</a>
    </p>
    </form>
    </div>
    
    <%@include file="/commons/bottom.jsp" %>