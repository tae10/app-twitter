<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="data.User"%>
<%@page import="repository.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%



// multipart 요청은 처리방법이 달라서 getParameter를 뽑을 수가 없다.
User user = (User)session.getAttribute("logonUser");
String id = user.getId();

//saveDirectory를 resource/profile/[로그인아이디]랜덤으로 저장

String path = application.getRealPath("/resource/profile/"+id);
File pathFile =new File(path);
if(!pathFile.exists()) {
	pathFile.mkdirs();
}

System.out.println("path =" + path);


MultipartRequest multi=new MultipartRequest(request, path, 1024*1024*20,"utf-8");

String genCode = Long.toString(System.currentTimeMillis());
String img = "/resource/profile/"+id+"/"+genCode;
//파일이 안넘어오면 multi.getFIle이 null인 경우를 막아야한다
if(multi.getFile("attach")==null){
     img=user.getImg();
}else{
multi.getFile("attach").renameTo(new File(path, genCode));
}
String nick = multi.getParameter("nick");
String profile = multi.getParameter("profile");

int r = Users.updateOne(id, nick, profile, img);

if (r == 1) {
	session.setAttribute("logonUser", Users.findById(id));
	response.sendRedirect("./index.jsp");
} else {
	response.sendRedirect("./setting.jsp?error");

}
%>

path: <%=path %>
genCode: <%=genCode %>
RealFileAddress: <%=new File(path, genCode).getAbsolutePath() %>
URl : <%="/resource/profile/"+id+"/" + genCode %>
nick : <%=nick %>
profile : <%=profile %>

