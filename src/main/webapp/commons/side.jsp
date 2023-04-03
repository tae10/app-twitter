<%@ page import="data.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User temp = (User) session.getAttribute("logonUser");
%>
<%-- 왼쪽사이드 영역 --%>
	<div style="flex: 1; display: flex; flex-direction: column;"
		class="side">
		<ul style="list-style: none; flex: 1;">
			<li><a href="./index.jsp">HOME</a></li>
			<li>MESSAGES</li>
			<li><a href="./setting.jsp">SETTING</a></li>
		</ul>
		<div style="padding-bottom: 15px;">
			<div
				style="display: flex; align-items: center; padding: 2px; gap: 7px; justify-content: center">
				<div>
					<img src="<%=application.getContextPath()%><%=temp.getImg()%>"
						style="width: 36px; height: 36px; border-radius: 50%" />
				</div>
				<div style="flex:1">
					<b><%=temp.getNick()%></b> <small> (@<%=temp.getId()%>)
					</small>
				</div>
			</div>
			<div style="text-align: right">
				<a href="../flow/logout.jsp">로그아웃</a>
			</div>
		</div>
	</div>