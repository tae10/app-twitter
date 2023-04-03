<%--
   이 페이지의 목적은 로그인을 처리해주는 작업

 --%>

<%@page import="data.User"%>
<%@page import="repository.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.getParameter("uri");
	request.setCharacterEncoding("utf-8");;

	String id = request.getParameter("id");
	
	String pass = request.getParameter("pass");
	
	User one = Users.findById(id);
	
	
	if(one == null){
		response.sendRedirect("./login.jsp?error=1");
	} else {
		String DBpass = one.getPass();
		if (pass.equals(DBpass)) {
	session.setAttribute("logon", true);
           session.setAttribute("logonUser", one);
	response.sendRedirect("../home/index.jsp");
		} else {
	response.sendRedirect("./login.jsp?error=2");
		}
	}
%>