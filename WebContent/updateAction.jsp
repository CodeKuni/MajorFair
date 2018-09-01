<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String cpath = new File(request.getServletPath()).getParent();
	String localPath = application.getRealPath(cpath);

	File file = new File(localPath + "//jsonData");
	try {
		// 파일에 문자열을 쓴다.
		// 하지만 이미 파일이 존재하면 모든 내용을 삭제하고 그위에 덮어쓴다
		// 파일이 손산될 우려가 있다.
		FileWriter fw = new FileWriter(file);
		fw.write(request.getParameter("jsonStr"));
		fw.close();
	} catch (IOException e) {
		e.printStackTrace();
	}
%>