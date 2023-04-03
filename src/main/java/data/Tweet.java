package data;

import java.util.Date;

public class Tweet {
  String code;
  String writer;
  String body;
  Date writered;
  
  
    //writer 추가 정보를 join으로 얻을때를 대비해서
  String writerNick;
  String writerImg;
  
  //setter,getter 추가
public String getCode() {
	return code;
}
public void setCode(String code) {
	this.code = code;
}
public String getWriter() {
	return writer;
}
public void setWriter(String writer) {
	this.writer = writer;
}
public String getBody() {
	return body;
}
public void setBody(String body) {
	this.body = body;
}
public Date getWritered() {
	return writered;
}
public void setWritered(Date writered) {
	this.writered = writered;
}
public String getWriterNick() {
	return writerNick;
}
public void setWriterNick(String writerNick) {
	this.writerNick = writerNick;
}
public String getWriterImg() {
	return writerImg;
}
public void setWriterImg(String writerImg) {
	this.writerImg = writerImg;
}
}
