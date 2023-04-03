<%--
 사용자가 회원가입을 하기위해 필요한 데이터를 작성하여 
 제출할  폼을 제공하는곳
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/commons/top.jsp" %>
 <%@include file="/commons/cancel.jsp" %>
     
    <div style="background-color:skyblue" >
    <h1 style="text-align: center">지금 트위터에 가입하세요</h1>
    <form action="./join-task.jsp" method="post">
    <div style="text-align: center">
    <p>
   <input type="text"  placeholder="아이디"  name="id"/>
    </p>
    
    <p>
  <input type="password" placeholder="비밀번호" name="password"/>
    </p>
    <p>
<input type="text" placeholder="닉네임"name="nick"/>
    </p>
    
  <p>
  <button type="submit"> 다음  </button>
  </p>
    
    
    
    </form>
  
    </div>

   <%@include file="/commons/bottom.jsp" %>