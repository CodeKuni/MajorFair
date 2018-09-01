<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String cpath = new File(request.getServletPath()).getParent();
	String localPath = application.getRealPath(cpath);

	File file = new File(localPath + "//jsonFile//" + request.getParameter("realMenuName"));
	out.println(request.getParameter("menuName"));
	
	if (file.exists()) {
		if (file.delete()) {
			System.out.println("파일삭제 성공");
		} else {
			System.out.println("파일삭제 실패");
		}
	} else {
		System.out.println("파일이 존재하지 않습니다.");
	}
	
	file = new File(localPath + "//jsonFile//" + request.getParameter("menuName"));
	try {
		// 파일에 문자열을 쓴다.
		// 하지만 이미 파일이 존재하면 모든 내용을 삭제하고 그위에 덮어쓴다
		// 파일이 손산될 우려가 있다.
		FileWriter fw = new FileWriter(file);
		fw.write(request.getParameter("menuContext"));
		fw.close();
		response.sendRedirect("index.jsp");
		//response.sendRedirect("index.jsp");
	} catch (IOException e) {
		e.printStackTrace();
	}
%>