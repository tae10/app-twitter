<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="data.TweetAttach"%>
<%@page import="repository.TweetAttaches"%>
<%@page import="data.Tweet"%>
<%@page import="java.util.List"%>
<%@page import="repository.Tweets"%>
<%@page import="data.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	boolean logon = (boolean) session.getAttribute("logon");
	if (!logon) {
		response.sendRedirect("/flow/login.jsp");
		return;
	}
	User user = (User) session.getAttribute("logonUser");
	
	
	List<Tweet> latest =Tweets.findLatest(5);
	
	Map<String, List<TweetAttach>> attachesMap = new HashMap<>();
	for(Tweet t : latest) {
		List<TweetAttach> li = TweetAttaches.findByTweetCode(t.getCode());
		attachesMap.put(t.getCode(), li);
	}
	
	

%>
<%@ include file="/commons/top.jsp"%>
<%-- 왼쪽사이드 영역 --%>
<div style="display: flex; height: 100vh; gap: 10px;">
	<%@ include file="/commons/side.jsp"%>
	<%-- 센터 영역 --%>
	<div style="flex: 5">
		<%-- 서치 영역 --%>
		<div style="margin: 10px; text-align: right">
			<form action="./search.jsp" autocomplete="off"
				class="vertical-center" style="justify-content: flex-end;">
				<img src="/resource/icon/search.svg"
					style="width: 32px; height: 32px" /><input type="text" name="q"
					placeholder="Search..." style="width: 30%; font-size: 1.0em" />
			</form>
		</div>
		<%-- TWEET 쓰기 영역 --%>
		<div style="margin: 10px;">
			<form action="./tweet/create-task.jsp" autocomplete="off"
				style="width: 100%;" method="post" enctype="multipart/form-data">
				<div style="padding-right: 22px">
					<textarea style="width: 100%; resize: none; height: 90px"
						placeholder="오늘은 무슨일이 있으셨나요?" name="body"></textarea>
				</div>
				<div style="display: flex">
					<div style="flex: 1">
						<input type="file" name="attach" multiple/>
					</div>
					<div>
						<button type="submit">TWEET</button>
					</div>
				</div>
			</form>
		</div>
		<%-- 최신 트윗 뷰 영역 --%>
		<div style="margin: 10px;">
			<%for(Tweet tweet : latest) { %>
			<div style="padding:10px; border: 1px solid #777; margin-bottom: 4px; border-radius: 4px">
				<div>
					<b><%=tweet.getWriter() %></b> | <small><%=tweet.getWritered() %></small>
				</div>
				<div><%=tweet.getBody() == null ? "": tweet.getBody() %></div>
				<div style="display: flex; gap:10px; justify-content: center">
					<%for(TweetAttach attach : attachesMap.get(tweet.getCode()) ) { %>
						<div >
							<img src="<%=attach.getUri() %>" style="border-radius: 20px;"/>
						</div>
					<%} %>
						<div>
						   <a href ="./tweet/like-task.jsp?code=<%=tweet.getCode()%>"><button type="submit" >좋아요</button></a>
						</div>
				</div>
			</div>
		<%} %>
		</div>
	</div>
</div>
