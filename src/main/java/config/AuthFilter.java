package config;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.User;
//@WebFilter({"/home/index.jsp","/home/following.jsp"})//하나일대는 그냥적고 2개이상 이면 ,하고 중괄호할것
@WebFilter({"/home/index.jsp"})//하나일대는 그냥적고 2개이상 이면 ,하고 중괄호할것
public class AuthFilter extends HttpFilter{

@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		   String uri=request.getRequestURI();
	     System.out.println("doFilter.."+uri);
	     //if를 걸어서
	     //현재 요청을 보낸 사용자의 세션에 logon 값이 true면 통과
	     //그게 아니면 /flow/login.jsp로 리 다이렉트 시키는 필터를 만들어보자.
         boolean logon =(boolean)request.getSession().getAttribute("logon");
         User logonUser =(User)request.getSession().getAttribute("logonUser");
         if(logon && logonUser !=null) {
	        chain.doFilter(request, response); //필터 통과시켜주는
         }else{
        	 response.sendRedirect("/flow/login.jsp?uri="+uri);
        	 
         }
	}	
}
