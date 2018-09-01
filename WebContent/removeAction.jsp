<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String cpath = new File(request.getServletPath()).getParent();
	String localPath = application.getRealPath(cpath);
	String path = localPath + "//jsonFile//" + request.getParameter("menuName");

	File file = new File(path);

	if (file.exists()) {
		if (file.delete()) {
			System.out.println("파일삭제 성공");
		} else {
			System.out.println("파일삭제 실패");
		}
	} else {
		System.out.println("파일이 존재하지 않습니다.");
	}
	
	response.sendRedirect("index.jsp");
%>